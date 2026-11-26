import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../domain/entities/product/product_unit.dart';
import '../../../domain/usecases/product_units/get_product_units_usecase.dart';
import '../../../domain/usecases/product_units/watch_product_units_usecase.dart';
import '../../../domain/usecases/product_units/get_unit_by_id_usecase.dart';
import '../../../domain/usecases/product_units/insert_product_unit_usecase.dart';
import '../../../domain/usecases/product_units/update_product_unit_usecase.dart';
import '../../../domain/usecases/product_units/set_base_unit_usecase.dart';
import '../../../domain/usecases/product_units/set_default_unit_usecase.dart';
import '../../../domain/usecases/product_units/delete_product_unit_usecase.dart';

import 'product_units_event.dart';
import 'product_units_state.dart';

@injectable
class ProductUnitsBloc
    extends Bloc<ProductUnitsEvent, ProductUnitsState> {
  final GetProductUnitsUseCase _getProductUnits;
  final WatchProductUnitsUseCase _watchProductUnits;
  final GetUnitByIdUseCase _getUnitById;
  final InsertProductUnitUseCase _insertProductUnit;
  final UpdateProductUnitUseCase _updateProductUnit;
  final SetBaseUnitUseCase _setBaseUnit;
  final SetDefaultUnitUseCase _setDefaultUnit;
  final DeleteProductUnitUseCase _deleteProductUnit;

  StreamSubscription<List<ProductUnit>>? _unitsSubscription;

  int? _currentProductId;

  ProductUnitsBloc({
    required GetProductUnitsUseCase getProductUnits,
    required WatchProductUnitsUseCase watchProductUnits,
    required GetUnitByIdUseCase getUnitById,
    required InsertProductUnitUseCase insertProductUnit,
    required UpdateProductUnitUseCase updateProductUnit,
    required SetBaseUnitUseCase setBaseUnit,
    required SetDefaultUnitUseCase setDefaultUnit,
    required DeleteProductUnitUseCase deleteProductUnit,
  })  : _getProductUnits = getProductUnits,
        _watchProductUnits = watchProductUnits,
        _getUnitById = getUnitById,
        _insertProductUnit = insertProductUnit,
        _updateProductUnit = updateProductUnit,
        _setBaseUnit = setBaseUnit,
        _setDefaultUnit = setDefaultUnit,
        _deleteProductUnit = deleteProductUnit,
        super(const ProductUnitsState()) {
    on<LoadProductUnits>(_onLoad);
    on<WatchProductUnits>(_onWatch);
    on<ProductUnitsChanged>(_onUnitsChanged);
    on<GetProductUnitById>(_onGetById);
    on<CreateProductUnit>(_onCreate);
    on<UpdateProductUnit>(_onUpdate);
    on<SetBaseProductUnit>(_onSetBase);
    on<SetDefaultProductUnit>(_onSetDefault);
    on<DeleteProductUnit>(_onDelete);
    on<ClearProductUnitMessages>(_onClearMessages);
  }

  // =========================================================
  // LOAD PRODUCT UNITS
  // =========================================================

  Future<void> _onLoad(
    LoadProductUnits event,
    Emitter<ProductUnitsState> emit,
  ) async {
    _currentProductId = event.productId;

    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _getProductUnits(
        productId: event.productId,
      ).run();

      result.match(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          ));
        },
        (units) {
          emit(state.copyWith(
            isLoading: false,
            units: units,
            errorMessage: null,
          ));
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // WATCH PRODUCT UNITS
  // =========================================================

  Future<void> _onWatch(
    WatchProductUnits event,
    Emitter<ProductUnitsState> emit,
  ) async {
    _currentProductId = event.productId;

    await _unitsSubscription?.cancel();
    _unitsSubscription = null;

    emit(state.copyWith(
      isWatching: true,
      errorMessage: null,
    ));

    try {
      _unitsSubscription = _watchProductUnits(
        productId: event.productId,
      ).listen(
        (units) {
          if (!isClosed) {
            add(ProductUnitsEvent.unitsChanged(
              units: units,
            ));
          }
        },
        onError: (error) {
          if (!isClosed) {
            add(ProductUnitsEvent.clearMessages());

            // نضع رسالة الخطأ من خلال تحديث الحالة
            // في حال وجود خطأ أثناء مراقبة البيانات.
            emitFromStreamError(error);
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isWatching: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // استقبال البيانات القادمة من Stream
  void _onUnitsChanged(
    ProductUnitsChanged event,
    Emitter<ProductUnitsState> emit,
  ) {
    emit(state.copyWith(
      units: event.units,
      isLoading: false,
      isWatching: true,
      errorMessage: null,
    ));
  }

  // =========================================================
  // GET UNIT BY ID
  // =========================================================

  Future<void> _onGetById(
    GetProductUnitById event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      final result = await _getUnitById(
        id: event.id,
      ).run();

      result.match(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          ));
        },
        (unit) {
          emit(state.copyWith(
            isLoading: false,
            selectedUnit: unit,
            errorMessage: unit == null
                ? 'الوحدة غير موجودة'
                : null,
          ));
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // CREATE PRODUCT UNIT
  // =========================================================

  Future<void> _onCreate(
    CreateProductUnit event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _insertProductUnit(
        unit: event.unit,
      ).run();

      await result.match(
        (failure) async {
          emit(state.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ));
        },
        (id) async {
          emit(state.copyWith(
            isSaving: false,
            successMessage: 'تمت إضافة وحدة المنتج بنجاح',
          ));

          await _refreshUnits();
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // UPDATE PRODUCT UNIT
  // =========================================================

  Future<void> _onUpdate(
    UpdateProductUnit event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _updateProductUnit(
        id: event.id,
        unit: event.unit,
      ).run();

      await result.match(
        (failure) async {
          emit(state.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ));
        },
        (updated) async {
          if (!updated) {
            emit(state.copyWith(
              isSaving: false,
              errorMessage: 'لم يتم العثور على الوحدة لتعديلها',
            ));
            return;
          }

          emit(state.copyWith(
            isSaving: false,
            selectedUnit: event.unit,
            successMessage: 'تم تحديث وحدة المنتج بنجاح',
          ));

          await _refreshUnits();
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // SET BASE UNIT
  // =========================================================

  Future<void> _onSetBase(
    SetBaseProductUnit event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isSettingBase: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _setBaseUnit(
        productId: event.productId,
        unitId: event.unitId,
      ).run();

      await result.match(
        (failure) async {
          emit(state.copyWith(
            isSettingBase: false,
            errorMessage: failure.message,
          ));
        },
        (_) async {
          emit(state.copyWith(
            isSettingBase: false,
            successMessage: 'تم تعيين وحدة الأساس بنجاح',
          ));

          await _refreshUnits();
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isSettingBase: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // SET DEFAULT UNIT
  // =========================================================

  Future<void> _onSetDefault(
    SetDefaultProductUnit event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isSettingDefault: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _setDefaultUnit(
        productId: event.productId,
        unitId: event.unitId,
      ).run();

      await result.match(
        (failure) async {
          emit(state.copyWith(
            isSettingDefault: false,
            errorMessage: failure.message,
          ));
        },
        (_) async {
          emit(state.copyWith(
            isSettingDefault: false,
            successMessage: 'تم تعيين وحدة البيع الافتراضية بنجاح',
          ));

          await _refreshUnits();
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isSettingDefault: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // DELETE PRODUCT UNIT
  // =========================================================

  Future<void> _onDelete(
    DeleteProductUnit event,
    Emitter<ProductUnitsState> emit,
  ) async {
    emit(state.copyWith(
      isDeleting: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _deleteProductUnit(
        id: event.id,
      ).run();

      await result.match(
        (failure) async {
          emit(state.copyWith(
            isDeleting: false,
            errorMessage: failure.message,
          ));
        },
        (deletedId) async {
          if (deletedId <= 0) {
            emit(state.copyWith(
              isDeleting: false,
              errorMessage: 'لم يتم العثور على الوحدة لحذفها',
            ));
            return;
          }

          emit(state.copyWith(
            isDeleting: false,
            selectedUnit: state.selectedUnit?.id == event.id
                ? null
                : state.selectedUnit,
            successMessage: 'تم حذف وحدة المنتج بنجاح',
          ));

          await _refreshUnits();
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isDeleting: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================================
  // REFRESH
  // =========================================================

  Future<void> _refreshUnits() async {
    final productId = _currentProductId;

    if (productId == null || isClosed) return;

    if (state.isWatching) {
      // Stream مسؤول عن تحديث القائمة تلقائياً.
      return;
    }

    add(ProductUnitsEvent.load(
      productId: productId,
    ));
  }

  // =========================================================
  // CLEAR MESSAGES
  // =========================================================

  void _onClearMessages(
    ClearProductUnitMessages event,
    Emitter<ProductUnitsState> emit,
  ) {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));
  }

  // =========================================================
  // STREAM ERROR
  // =========================================================

  void emitFromStreamError(Object error) {
    if (isClosed) return;

    add(ProductUnitsEvent.clearMessages());

    // يمكن إضافة Event خاص بأخطاء Stream عند الحاجة.
  }

  // =========================================================
  // CLOSE
  // =========================================================

  @override
  Future<void> close() async {
    await _unitsSubscription?.cancel();
    _unitsSubscription = null;

    return super.close();
  }
}