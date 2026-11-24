
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';

import '../../domain/usecases/get_all_categories_usecase.dart';
import '../../domain/usecases/watch_all_categories_usecase.dart';
import '../../domain/usecases/get_category_by_id_usecase.dart';
import '../../domain/usecases/get_categories_by_parent_id_usecase.dart';
import '../../domain/usecases/search_categories_usecase.dart';
import '../../domain/usecases/get_active_categories_usecase.dart';
import '../../domain/usecases/add_category_usecase.dart';
import '../../domain/usecases/update_category_usecase.dart';
import '../../domain/usecases/delete_category_usecase.dart';

import 'category_event.dart';
import 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoriesUseCase getAllCategories;
  final WatchAllCategoriesUseCase watchAllCategories;
  final GetCategoryByIdUseCase getCategoryById;
  final GetCategoriesByParentIdUseCase getCategoriesByParentId;
  final SearchCategoriesUseCase searchCategories;
  final GetActiveCategoriesUseCase getActiveCategories;
  final AddCategoryUseCase addCategory;
  final UpdateCategoryUseCase updateCategory;
  final DeleteCategoryUseCase deleteCategory;

  StreamSubscription<List<Category>>? _subscription;

  CategoryBloc({
    required this.getAllCategories,
    required this.watchAllCategories,
    required this.getCategoryById,
    required this.getCategoriesByParentId,
    required this.searchCategories,
    required this.getActiveCategories,
    required this.addCategory,
    required this.updateCategory,
    required this.deleteCategory,
  }) : super(const CategoryState()) {
    on<CategoryLoadRequested>(_onLoad);
    on<CategoryWatchRequested>(_onWatch);
    on<CategoriesUpdated>(_onCategoriesUpdated);
    on<CategoryWatchFailed>(_onWatchFailed);

    on<CategoryGetByIdRequested>(_onGetById);
    on<CategoryChildrenRequested>(_onGetChildren);
    on<CategorySearchRequested>(_onSearch);
    on<CategoryActiveRequested>(_onGetActive);

    on<CategoryAddRequested>(_onAdd);
    on<CategoryUpdateRequested>(_onUpdate);
    on<CategoryDeleteRequested>(_onDelete);
    on<CategoryToggleStatusRequested>(_onToggleStatus);

    on<CategorySelectionCleared>(_onClearSelection);
    on<CategoryWatchStopped>(_onWatchStopped);
  }

  // =========================================================
  // Load All Categories
  // =========================================================

  Future<void> _onLoad(
    CategoryLoadRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      status: CategoryStatus.loading,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final categories = await getAllCategories();

      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: categories,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CategoryStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Watch Categories
  // =========================================================

  Future<void> _onWatch(
    CategoryWatchRequested event,
    Emitter<CategoryState> emit,
  ) async {
    await _subscription?.cancel();
    _subscription = null;

    emit(state.copyWith(
      errorMessage: null,
    ));

    _subscription = watchAllCategories().listen(
      (categories) {
        if (!isClosed) {
          add(CategoryEvent.categoriesUpdated(categories));
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (!isClosed) {
          add(CategoryEvent.watchFailed(error.toString()));
        }
      },
    );
  }

  // =========================================================
  // Stream Updated
  // =========================================================

  void _onCategoriesUpdated(
    CategoriesUpdated event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(
      status: CategoryStatus.success,
      categories: event.categories,
      errorMessage: null,
    ));
  }

  // =========================================================
  // Stream Error
  // =========================================================

  void _onWatchFailed(
    CategoryWatchFailed event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(
      status: CategoryStatus.failure,
      errorMessage: event.message,
    ));
  }

  // =========================================================
  // Get Category By ID
  // =========================================================

  Future<void> _onGetById(
    CategoryGetByIdRequested event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      final category = await getCategoryById(event.id);

      if (category == null) {
        emit(state.copyWith(
          selectedCategory: null,
          errorMessage: 'Category not found',
        ));
        return;
      }

      emit(state.copyWith(
        selectedCategory: category,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Get Children
  // =========================================================

  Future<void> _onGetChildren(
    CategoryChildrenRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      errorMessage: null,
    ));

    try {
      final children = await getCategoriesByParentId(
        event.parentId,
      );

      emit(state.copyWith(
        children: children,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Search
  // =========================================================

  Future<void> _onSearch(
    CategorySearchRequested event,
    Emitter<CategoryState> emit,
  ) async {
    final keyword = event.keyword.trim();

    if (keyword.isEmpty) {
      emit(state.copyWith(
        searchResults: [],
        errorMessage: null,
      ));
      return;
    }

    emit(state.copyWith(
      errorMessage: null,
    ));

    try {
      final results = await searchCategories(keyword);

      emit(state.copyWith(
        searchResults: results,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Get Active Categories
  // =========================================================

  Future<void> _onGetActive(
    CategoryActiveRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      errorMessage: null,
    ));

    try {
      final categories = await getActiveCategories();

      emit(state.copyWith(
        activeCategories: categories,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Add Category
  // =========================================================

  Future<void> _onAdd(
    CategoryAddRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      await addCategory(event.category);

      final categories = await getAllCategories();

      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: categories,
        isSaving: false,
        successMessage: 'Category added successfully',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Update Category
  // =========================================================

  Future<void> _onUpdate(
    CategoryUpdateRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await updateCategory(event.category);

      if (!updated) {
        emit(state.copyWith(
          isSaving: false,
          errorMessage: 'Category update failed',
        ));
        return;
      }

      final categories = await getAllCategories();

      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: categories,
        selectedCategory: event.category,
        isSaving: false,
        successMessage: 'Category updated successfully',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Delete Category
  // =========================================================

  Future<void> _onDelete(
    CategoryDeleteRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
      isDeleting: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await deleteCategory(event.id);

      if (!deleted) {
        emit(state.copyWith(
          isDeleting: false,
          errorMessage: 'Category could not be deleted',
        ));
        return;
      }

      final categories = await getAllCategories();

      final selectedId = state.selectedCategory?.id;

      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: categories,
        isDeleting: false,
        successMessage: 'Category deleted successfully',
        errorMessage: null,
        selectedCategory:
            selectedId == event.id ? null : state.selectedCategory,
      ));
    } catch (e) {
      emit(state.copyWith(
        isDeleting: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Toggle Active Status
  // =========================================================

  Future<void> _onToggleStatus(
    CategoryToggleStatusRequested event,
    Emitter<CategoryState> emit,
  ) async {
    final category = event.category;

    if (category.id == null || category.id! <= 0) {
      emit(state.copyWith(
        errorMessage: 'Invalid category ID',
      ));
      return;
    }

    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await updateCategory(
        category.copyWith(
          isActive: !category.isActive,
        ),
      );

      if (!updated) {
        emit(state.copyWith(
          isSaving: false,
          errorMessage: 'Category status update failed',
        ));
        return;
      }

      final categories = await getAllCategories();
      final activeCategories = await getActiveCategories();

      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: categories,
        activeCategories: activeCategories,
        isSaving: false,
        successMessage: 'Category status updated',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =========================================================
  // Clear Selection
  // =========================================================

  void _onClearSelection(
    CategorySelectionCleared event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(
      selectedCategory: null,
    ));
  }

  // =========================================================
  // Stop Watching
  // =========================================================

  Future<void> _onWatchStopped(
    CategoryWatchStopped event,
    Emitter<CategoryState> emit,
  ) async {
    await _subscription?.cancel();
    _subscription = null;
  }

  // =========================================================
  // Close
  // =========================================================

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    _subscription = null;

    await super.close();
  }
}
