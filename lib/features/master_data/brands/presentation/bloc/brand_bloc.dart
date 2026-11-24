
import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/brand.dart';

import '../../domain/exceptions/brand_validation_exception.dart';
import '../../domain/params/create_brand_params.dart';
import '../../domain/usecases/brands_usecases.dart';
import 'brand_event.dart';
import 'brand_state.dart';

@injectable
class BrandBloc extends Bloc<BrandEvent, BrandState> {
  // =====================================================
  // UseCases
  // =====================================================

  final GetAllBrandsUseCase getAllBrands;
  final GetActiveBrandsUseCase getActiveBrands;
  final GetBrandByIdUseCase getBrandById;
  final SearchBrandsUseCase searchBrands;
  final WatchAllBrandsUseCase watchAllBrands;
  final WatchActiveBrandsUseCase watchActiveBrands;
  final CreateBrandUseCase createBrand;
  final UpdateBrandUseCase updateBrand;
  final DeleteBrandUseCase deleteBrand;
  final ToggleBrandStatusUseCase toggleBrandStatus;
  final CheckBrandNameExistsUseCase checkBrandNameExists;
  final GetBrandsCountUseCase getBrandsCount;
  final GetActiveBrandsCountUseCase getActiveBrandsCount;

  // =====================================================
  // Stream
  // =====================================================

  StreamSubscription<List<Brand>>? _brandsSubscription;

  bool _activeOnly = false;
String _mapErrorMessage(Object error) {
  if (error is BrandValidationException) {
    return error.message;
  }

  return 'حدث خطأ غير متوقع أثناء تنفيذ العملية';
}
  // =====================================================
  // Constructor
  // =====================================================

  BrandBloc({
    required this.getAllBrands,
    required this.getActiveBrands,
    required this.getBrandById,
    required this.searchBrands,
    required this.watchAllBrands,
    required this.watchActiveBrands,
    required this.createBrand,
    required this.updateBrand,
    required this.deleteBrand,
    required this.toggleBrandStatus,
    required this.checkBrandNameExists,
    required this.getBrandsCount,
    required this.getActiveBrandsCount,
  }) : super(const BrandState()) {
    on<LoadBrandsRequested>(
      _onLoadBrands,
      transformer: droppable(),
    );

    on<WatchBrandsRequested>(
      _onWatchBrands,
      transformer: restartable(),
    );

    on<SearchBrandsRequested>(
      _onSearchBrands,
      transformer: restartable(),
    );

    on<GetBrandByIdRequested>(
      _onGetBrandById,
      transformer: droppable(),
    );

    on<CreateBrandRequested>(
      _onCreateBrand,
      transformer: droppable(),
    );

    on<UpdateBrandRequested>(
      _onUpdateBrand,
      transformer: droppable(),
    );

    on<DeleteBrandRequested>(
      _onDeleteBrand,
      transformer: droppable(),
    );

    on<ToggleBrandStatusRequested>(
      _onToggleBrandStatus,
      transformer: droppable(),
    );

    on<CheckBrandNameRequested>(
      _onCheckBrandName,
      transformer: restartable(),
    );

    on<LoadBrandsStatisticsRequested>(
      _onLoadStatistics,
      transformer: droppable(),
    );

    on<ClearBrandMessagesRequested>(
      _onClearMessages,
    );

    on<ClearBrandSearchRequested>(
      _onClearSearch,
    );

    // Internal stream events

    on<InternalBrandsUpdated>(
      _onInternalBrandsUpdated,
    );

    on<InternalBrandsError>(
      _onInternalBrandsError,
    );
  }

  // =====================================================
  // Helpers
  // =====================================================

  String _normalize(String value) {
    return value.trim().toLowerCase();
  }

  List<Brand> _filterBrands(
    List<Brand> brands,
    String query,
  ) {
    final normalizedQuery = _normalize(query);

    if (normalizedQuery.isEmpty) {
      return brands;
    }

    return brands.where((brand) {
      final name = _normalize(brand.name);
      final description = _normalize(
        brand.description ?? '',
      );

      return name.contains(normalizedQuery) ||
          description.contains(normalizedQuery);
    }).toList();
  }

  Future<void> _reloadBrands(
    Emitter<BrandState> emit,
  ) async {
    final result = _activeOnly
        ? await getActiveBrands()
        : await getAllBrands();

    if (emit.isDone) return;

    emit(
      state.copyWith(
        brands: result,
        filteredBrands: _filterBrands(
          result,
          state.searchQuery,
        ),
        status: BrandStatus.success,
      ),
    );
  }

  Future<void> _refreshStatistics(
    Emitter<BrandState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoadingStatistics: true,
      ),
    );

    try {
      final results = await Future.wait<int>([
        getBrandsCount(),
        getActiveBrandsCount(),
      ]);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          totalBrands: results[0],
          activeBrands: results[1],
          isLoadingStatistics: false,
        ),
      );
    } catch (_) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isLoadingStatistics: false,
        ),
      );
    }
  }

  void _emitError(
    Emitter<BrandState> emit,
    Object error,
  ) {
    if (emit.isDone) return;

    emit(
      state.copyWith(
        errorMessage: error.toString(),
      ),
    );
  }

  // =====================================================
  // Load Brands
  // =====================================================

  Future<void> _onLoadBrands(
    LoadBrandsRequested event,
    Emitter<BrandState> emit,
  ) async {
    _activeOnly = event.activeOnly;

    emit(
      state.copyWith(
        status: BrandStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      await _reloadBrands(emit);
      await _refreshStatistics(emit);
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          status: BrandStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Watch Brands
  // =====================================================

  Future<void> _onWatchBrands(
    WatchBrandsRequested event,
    Emitter<BrandState> emit,
  ) async {
    _activeOnly = event.activeOnly;

    await _brandsSubscription?.cancel();

    emit(
      state.copyWith(
        status: BrandStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final stream = _activeOnly
          ? watchActiveBrands()
          : watchAllBrands();

      _brandsSubscription = stream.listen(
        (brands) {
          if (isClosed) return;

          add(
            BrandEvent.internalBrandsUpdated(
              brands: brands,
            ),
          );
        },
        onError: (Object error) {
          if (isClosed) return;

          add(
            BrandEvent.internalBrandsError(
              message: error.toString(),
            ),
          );
        },
      );

      await _refreshStatistics(emit);
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          status: BrandStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Internal Stream Events
  // =====================================================

  void _onInternalBrandsUpdated(
    InternalBrandsUpdated event,
    Emitter<BrandState> emit,
  ) {
    emit(
      state.copyWith(
        brands: event.brands,
        filteredBrands: _filterBrands(
          event.brands,
          state.searchQuery,
        ),
        status: BrandStatus.success,
        errorMessage: null,
      ),
    );
  }

  void _onInternalBrandsError(
    InternalBrandsError event,
    Emitter<BrandState> emit,
  ) {
    emit(
      state.copyWith(
        status: BrandStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  // =====================================================
  // Search Brands
  // =====================================================

  Future<void> _onSearchBrands(
    SearchBrandsRequested event,
    Emitter<BrandState> emit,
  ) async {
    final query = event.query.trim();

    emit(
      state.copyWith(
        searchQuery: query,
        isSearching: true,
        errorMessage: null,
      ),
    );

    try {
      final result = query.isEmpty
          ? state.brands
          : await searchBrands(query);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          filteredBrands: result,
          isSearching: false,
        ),
      );
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isSearching: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Get Brand By ID
  // =====================================================

  Future<void> _onGetBrandById(
    GetBrandByIdRequested event,
    Emitter<BrandState> emit,
  ) async {
    try {
      final result = await getBrandById(event.id);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          selectedBrand: result,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // Create Brand
  // =====================================================




Future<void> _onCreateBrand(
  CreateBrandRequested event,
  Emitter<BrandState> emit,
) async {
  emit(
    state.copyWith(
      isCreating: true,
      errorMessage: null,
      successMessage: null,
    ),
  );

  try {
    await createBrand(
      CreateBrandParams(
        name: event.name,
        description: event.description,
        imagePath: event.imagePath,
        isActive: event.isActive,
      ),
    );

    if (emit.isDone) return;

    await _reloadBrands(emit);
    if (emit.isDone) return;

    await _refreshStatistics(emit);
    if (emit.isDone) return;

    emit(
      state.copyWith(
        isCreating: false,
        successMessage: 'تمت إضافة العلامة التجارية بنجاح',
      ),
    );
  } catch (error) {
    if (emit.isDone) return;

    emit(
      state.copyWith(
        isCreating: false,
        errorMessage: _mapErrorMessage(error),
      ),
    );
  }
}

  // =====================================================
  // Update Brand
  // =====================================================

  Future<void> _onUpdateBrand(
    UpdateBrandRequested event,
    Emitter<BrandState> emit,
  ) async {
    emit(
      state.copyWith(
        isUpdating: true,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final result = await updateBrand(event.brand);

      if (!result) {
        throw Exception(
          'لم يتم العثور على العلامة التجارية للتعديل',
        );
      }

      if (emit.isDone) return;

      await _reloadBrands(emit);
      await _refreshStatistics(emit);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          isUpdating: false,
          selectedBrand: event.brand,
          successMessage: 'تم تعديل العلامة التجارية بنجاح',
        ),
      );
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isUpdating: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Delete Brand
  // =====================================================

  Future<void> _onDeleteBrand(
    DeleteBrandRequested event,
    Emitter<BrandState> emit,
  ) async {
    emit(
      state.copyWith(
        isDeleting: true,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final result = await deleteBrand(event.id);

      if (!result) {
        throw Exception('العلامة التجارية غير موجودة');
      }

      if (emit.isDone) return;

      await _reloadBrands(emit);
      await _refreshStatistics(emit);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          isDeleting: false,
          selectedBrand: state.selectedBrand?.id == event.id
              ? null
              : state.selectedBrand,
          successMessage: 'تم حذف العلامة التجارية بنجاح',
        ),
      );
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isDeleting: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Toggle Brand Status
  // =====================================================

  Future<void> _onToggleBrandStatus(
    ToggleBrandStatusRequested event,
    Emitter<BrandState> emit,
  ) async {
    emit(
      state.copyWith(
        isTogglingStatus: true,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final result = await toggleBrandStatus(event.id);

      if (!result) {
        throw Exception(
          'تعذر تغيير حالة العلامة التجارية',
        );
      }

      if (emit.isDone) return;

      await _reloadBrands(emit);
      await _refreshStatistics(emit);

      if (emit.isDone) return;

      emit(
        state.copyWith(
          isTogglingStatus: false,
          successMessage: 'تم تحديث حالة العلامة التجارية',
        ),
      );
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isTogglingStatus: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Check Brand Name
  // =====================================================

  Future<void> _onCheckBrandName(
    CheckBrandNameRequested event,
    Emitter<BrandState> emit,
  ) async {
    emit(
      state.copyWith(
        isCheckingName: true,
        nameExists: null,
        errorMessage: null,
      ),
    );

    try {
      final exists = await checkBrandNameExists(
        event.name.trim(),
        excludeId: event.excludeId,
      );

      if (emit.isDone) return;

      emit(
        state.copyWith(
          isCheckingName: false,
          nameExists: exists,
        ),
      );
    } catch (error) {
      if (emit.isDone) return;

      emit(
        state.copyWith(
          isCheckingName: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // =====================================================
  // Statistics
  // =====================================================

  Future<void> _onLoadStatistics(
    LoadBrandsStatisticsRequested event,
    Emitter<BrandState> emit,
  ) async {
    await _refreshStatistics(emit);
  }

  // =====================================================
  // Clear Messages
  // =====================================================

  void _onClearMessages(
    ClearBrandMessagesRequested event,
    Emitter<BrandState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  // =====================================================
  // Clear Search
  // =====================================================

  void _onClearSearch(
    ClearBrandSearchRequested event,
    Emitter<BrandState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: '',
        filteredBrands: state.brands,
        isSearching: false,
      ),
    );
  }

  // =====================================================
  // Close
  // =====================================================

  @override
  Future<void> close() async {
    await _brandsSubscription?.cancel();
    _brandsSubscription = null;

    return super.close();
  }
}
