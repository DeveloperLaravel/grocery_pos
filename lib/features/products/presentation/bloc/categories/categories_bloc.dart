import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/parties/category.dart';

import '../../../domain/usecases/categories/get_all_categories_usecase.dart';
import '../../../domain/usecases/categories/watch_all_categories_usecase.dart';
import '../../../domain/usecases/categories/get_root_categories_usecase.dart';
import '../../../domain/usecases/categories/get_child_categories_usecase.dart';
import '../../../domain/usecases/categories/create_category_usecase.dart';
import '../../../domain/usecases/categories/update_category_usecase.dart';
import '../../../domain/usecases/categories/delete_category_usecase.dart';

import 'categories_event.dart';
import 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetAllCategoriesUseCase _getAllCategories;
  final WatchAllCategoriesUseCase _watchAllCategories;
  final GetRootCategoriesUseCase _getRootCategories;
  final GetChildCategoriesUseCase _getChildCategories;
  final CreateCategoryUseCase _createCategory;
  final UpdateCategoryUseCase _updateCategory;
  final DeleteCategoryUseCase _deleteCategory;

  StreamSubscription<List<Category>>? _categoriesSubscription;

  // يمنع استجابة طلب قديم لتصنيفات فرعية من استبدال الطلب الأحدث.
  int _childrenRequestId = 0;

  CategoriesBloc(
    this._getAllCategories,
    this._watchAllCategories,
    this._getRootCategories,
    this._getChildCategories,
    this._createCategory,
    this._updateCategory,
    this._deleteCategory,
  ) : super(const CategoriesState()) {
    // تحميل ومراقبة البيانات
    on<LoadCategories>(_onLoadCategories);
    on<WatchCategories>(_onWatchCategories);
    on<CategoriesUpdated>(_onCategoriesUpdated);
    on<CategoriesWatchFailed>(_onWatchFailed);

    // التصنيفات الرئيسية والفرعية
    on<LoadRootCategories>(_onLoadRootCategories);
    on<LoadChildCategories>(_onLoadChildCategories);

    // البحث
    on<SearchCategories>(_onSearchCategories);
    on<ClearCategorySearch>(_onClearSearch);

    // العمليات
    on<CreateCategory>(_onCreateCategory);
    on<UpdateCategory>(_onUpdateCategory);
    on<DeleteCategory>(_onDeleteCategory);
  }

  // =========================================================
  // LOAD ALL CATEGORIES
  // =========================================================

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(
      status: CategoriesStatus.loading,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final categories = await _getAllCategories();

      emit(_buildCategoriesState(categories));
    } catch (error) {
      emit(state.copyWith(
        status: CategoriesStatus.failure,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // WATCH CATEGORIES
  // =========================================================

  Future<void> _onWatchCategories(
    WatchCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    await _categoriesSubscription?.cancel();
    _categoriesSubscription = null;

    emit(state.copyWith(
      isWatching: true,
      errorMessage: null,
    ));

    try {
      _categoriesSubscription = _watchAllCategories().listen(
        (categories) {
          if (!isClosed) {
            add(
              CategoriesEvent.categoriesUpdated(categories),
            );
          }
        },
        onError: (Object error, StackTrace stackTrace) {
          if (!isClosed) {
            add(
              CategoriesEvent.watchFailed(
                _errorMessage(error),
              ),
            );
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isWatching: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // HANDLE STREAM UPDATES
  // =========================================================

  void _onCategoriesUpdated(
    CategoriesUpdated event,
    Emitter<CategoriesState> emit,
  ) {
    emit(_buildCategoriesState(event.categories));
  }

  Future<void> _onWatchFailed(
    CategoriesWatchFailed event,
    Emitter<CategoriesState> emit,
  ) async {
    await _categoriesSubscription?.cancel();
    _categoriesSubscription = null;

    emit(state.copyWith(
      isWatching: false,
      errorMessage: event.message,
    ));
  }

  // =========================================================
  // LOAD ROOT CATEGORIES
  // =========================================================

  Future<void> _onLoadRootCategories(
    LoadRootCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      final roots = await _getRootCategories();

      emit(state.copyWith(
        rootCategories: roots,
        errorMessage: null,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // LOAD CHILD CATEGORIES
  // =========================================================

  Future<void> _onLoadChildCategories(
    LoadChildCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    final requestId = ++_childrenRequestId;
    final parentId = event.parentId;

    emit(state.copyWith(
      selectedParentId: parentId,
      childCategories: [],
      errorMessage: null,
    ));

    try {
      final children = await _getChildCategories(parentId);

      // تجاهل نتيجة الطلب القديم إذا اختار المستخدم أباً آخر.
      if (requestId != _childrenRequestId) return;

      emit(state.copyWith(
        childCategories: children,
        errorMessage: null,
      ));
    } catch (error) {
      if (requestId != _childrenRequestId) return;

      emit(state.copyWith(
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // SEARCH CATEGORIES
  // =========================================================

  void _onSearchCategories(
    SearchCategories event,
    Emitter<CategoriesState> emit,
  ) {
    final query = event.query.trim();

    emit(state.copyWith(
      searchQuery: query,
      categories: _applySearch(
        state.allCategories,
        query,
      ),
      errorMessage: null,
    ));
  }

  // =========================================================
  // CLEAR SEARCH
  // =========================================================

  void _onClearSearch(
    ClearCategorySearch event,
    Emitter<CategoriesState> emit,
  ) {
    emit(state.copyWith(
      searchQuery: '',
      categories: state.allCategories,
      errorMessage: null,
    ));
  }

  // =========================================================
  // CREATE CATEGORY
  // =========================================================

  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final id = await _createCategory(event.category);

      final categories = await _getAllCategories();

      emit(
        _buildCategoriesState(categories).copyWith(
          isOperationInProgress: false,
          successMessage: 'تمت إضافة التصنيف بنجاح',
          lastAffectedCategoryId: id,
        ),
      );
    } catch (error) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // UPDATE CATEGORY
  // =========================================================

  Future<void> _onUpdateCategory(
    UpdateCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await _updateCategory(
        id: event.id,
        category: event.category,
      );

      if (!updated) {
        throw Exception(
          'لم يتم العثور على التصنيف أو لم يتم تعديله',
        );
      }

      final categories = await _getAllCategories();

      emit(
        _buildCategoriesState(categories).copyWith(
          isOperationInProgress: false,
          successMessage: 'تم تحديث التصنيف بنجاح',
          lastAffectedCategoryId: event.id,
        ),
      );
    } catch (error) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // DELETE CATEGORY
  // =========================================================

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await _deleteCategory(event.id);

      if (deleted <= 0) {
        throw Exception('تعذر حذف التصنيف');
      }

      final categories = await _getAllCategories();

      emit(
        _buildCategoriesState(categories).copyWith(
          isOperationInProgress: false,
          successMessage: 'تم حذف التصنيف بنجاح',
          lastAffectedCategoryId: event.id,
        ),
      );
    } catch (error) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // BUILD STATE
  // =========================================================

  CategoriesState _buildCategoriesState(
    List<Category> categories,
  ) {
    final roots = categories
        .where((category) => category.parentId == null)
        .toList();

    final selectedParentId = state.selectedParentId;

    final children = selectedParentId == null
        ? <Category>[]
        : categories
            .where(
              (category) =>
                  category.parentId == selectedParentId,
            )
            .toList();

    return state.copyWith(
      status: CategoriesStatus.success,
      allCategories: categories,
      categories: _applySearch(
        categories,
        state.searchQuery,
      ),
      rootCategories: roots,
      childCategories: children,
      errorMessage: null,
    );
  }

  // =========================================================
  // SEARCH HELPER
  // =========================================================

  List<Category> _applySearch(
    List<Category> categories,
    String query,
  ) {
    final normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return categories;
    }

    return categories.where((category) {
      final name = category.name.toLowerCase();

      final description =
          category.description?.toLowerCase() ?? '';

      return name.contains(normalizedQuery) ||
          description.contains(normalizedQuery);
    }).toList();
  }

  // =========================================================
  // ERROR HELPER
  // =========================================================

  String _errorMessage(Object error) {
    return error.toString().replaceFirst(
      'Exception: ',
      '',
    );
  }

  // =========================================================
  // DISPOSE
  // =========================================================

  @override
  Future<void> close() async {
    _childrenRequestId++;

    await _categoriesSubscription?.cancel();
    _categoriesSubscription = null;

    await super.close();
  }
}