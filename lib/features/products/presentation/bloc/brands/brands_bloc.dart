import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../domain/entities/parties/brand.dart';
import '../../../domain/usecases/brands/get_all_brands_usecase.dart';
import '../../../domain/usecases/brands/watch_all_brands_usecase.dart';
import '../../../domain/usecases/brands/insert_brand_usecase.dart';
import '../../../domain/usecases/brands/update_brand_usecase.dart';
import '../../../domain/usecases/brands/delete_brand_usecase.dart';

import 'brands_event.dart';
import 'brands_state.dart';

@injectable
class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetAllBrandsUseCase _getAllBrands;
  final WatchAllBrandsUseCase _watchAllBrands;
  final InsertBrandUseCase _insertBrand;
  final UpdateBrandUseCase _updateBrand;
  final DeleteBrandUseCase _deleteBrand;

  StreamSubscription<List<Brand>>? _brandsSubscription;

  BrandsBloc(
    this._getAllBrands,
    this._watchAllBrands,
    this._insertBrand,
    this._updateBrand,
    this._deleteBrand,
  ) : super(const BrandsState()) {
    on<LoadBrands>(_onLoadBrands);

    on<WatchBrands>(_onWatchBrands);

    on<BrandsChanged>(_onBrandsChanged);

    on<CreateBrand>(_onCreateBrand);

    on<UpdateBrand>(_onUpdateBrand);

    on<DeleteBrand>(_onDeleteBrand);
    on<BrandsWatchFailed>(_onBrandsWatchFailed);
  }

  // =========================================================
  // LOAD BRANDS
  // =========================================================

  Future<void> _onLoadBrands(
    LoadBrands event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final brands = await _getAllBrands();

      emit(state.copyWith(
        brands: brands,
        isLoading: false,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorMessage(e),
      ));
    }
  }
void _onBrandsWatchFailed(
  BrandsWatchFailed event,
  Emitter<BrandsState> emit,
) {
  emit(state.copyWith(
    isWatching: false,
    errorMessage: event.message,
  ));
}
  // =========================================================
  // WATCH BRANDS
  // =========================================================

  Future<void> _onWatchBrands(
    WatchBrands event,
    Emitter<BrandsState> emit,
  ) async {
    await _brandsSubscription?.cancel();

    emit(state.copyWith(
      isWatching: false,
      errorMessage: null,
    ));

    try {
      _brandsSubscription = _watchAllBrands().listen(
        (brands) {
          if (!isClosed) {
            add(BrandsChanged(brands));
          }
        },
        onError: (Object error, StackTrace stackTrace) {
          if (!isClosed) {
            add(BrandsWatchFailed(_errorMessage(error)));
          }
        },
      );

      emit(state.copyWith(
        isWatching: true,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isWatching: false,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // BRANDS CHANGED
  // =========================================================

  void _onBrandsChanged(
    BrandsChanged event,
    Emitter<BrandsState> emit,
  ) {
    emit(state.copyWith(
      brands: event.brands,
      isLoading: false,
      errorMessage: null,
    ));
  }

  // =========================================================
  // CREATE BRAND
  // =========================================================

  Future<void> _onCreateBrand(
    CreateBrand event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final id = await _insertBrand(event.brand);

      if (id <= 0) {
        throw Exception('لم يتم إنشاء العلامة التجارية');
      }

      await _refreshBrands(emit);

      emit(state.copyWith(
        isOperationInProgress: false,
        successMessage: 'تم إنشاء العلامة التجارية بنجاح',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(e),
        successMessage: null,
      ));
    }
  }

  // =========================================================
  // UPDATE BRAND
  // =========================================================

  Future<void> _onUpdateBrand(
    UpdateBrand event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await _updateBrand(
        id: event.id,
        brand: event.brand,
      );

      if (!updated) {
        throw Exception('لم يتم تحديث العلامة التجارية');
      }

      await _refreshBrands(emit);

      emit(state.copyWith(
        isOperationInProgress: false,
        successMessage: 'تم تحديث العلامة التجارية بنجاح',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(e),
        successMessage: null,
      ));
    }
  }

  // =========================================================
  // DELETE BRAND
  // =========================================================

  Future<void> _onDeleteBrand(
    DeleteBrand event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await _deleteBrand(event.id);

      if (deleted <= 0) {
        throw Exception('لم يتم حذف العلامة التجارية');
      }

      await _refreshBrands(emit);

      emit(state.copyWith(
        isOperationInProgress: false,
        successMessage: 'تم حذف العلامة التجارية بنجاح',
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(e),
        successMessage: null,
      ));
    }
  }

  // =========================================================
  // REFRESH BRANDS
  // =========================================================

  Future<void> _refreshBrands(
    Emitter<BrandsState> emit,
  ) async {
    final brands = await _getAllBrands();

    emit(state.copyWith(
      brands: brands,
      errorMessage: null,
    ));
  }

  // =========================================================
  // ERROR HANDLING
  // =========================================================

  String _errorMessage(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

  // =========================================================
  // CLOSE
  // =========================================================

  @override
  Future<void> close() async {
    await _brandsSubscription?.cancel();
    return super.close();
  }
}