import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/barcodes/get_product_barcodes_usecase.dart';
import '../../../domain/usecases/barcodes/watch_product_barcodes_usecase.dart';
import '../../../domain/usecases/barcodes/get_barcode_usecase.dart';
import '../../../domain/usecases/barcodes/get_product_by_barcode_usecase.dart';
import '../../../domain/usecases/barcodes/insert_product_barcode_usecase.dart';
import '../../../domain/usecases/barcodes/set_default_barcode_usecase.dart';
import '../../../domain/usecases/barcodes/delete_product_barcode_usecase.dart';

import 'barcodes_event.dart';
import 'barcodes_state.dart';

@injectable
class BarcodesBloc extends Bloc<BarcodesEvent, BarcodesState> {
  final GetProductBarcodesUseCase _getProductBarcodes;
  final WatchProductBarcodesUseCase _watchProductBarcodes;
  final GetBarcodeUseCase _getBarcode;
  final GetProductByBarcodeUseCase _getProductByBarcode;
  final InsertProductBarcodeUseCase _insertProductBarcode;
  final SetDefaultBarcodeUseCase _setDefaultBarcode;
  final DeleteProductBarcodeUseCase _deleteProductBarcode;

  StreamSubscription? _barcodesSubscription;

  BarcodesBloc(
    this._getProductBarcodes,
    this._watchProductBarcodes,
    this._getBarcode,
    this._getProductByBarcode,
    this._insertProductBarcode,
    this._setDefaultBarcode,
    this._deleteProductBarcode,
  ) : super(const BarcodesState()) {
    on<WatchBarcodesRequested>(_onWatchRequested);
    on<LoadBarcodesRequested>(_onLoadRequested);
    on<BarcodeLookupRequested>(_onBarcodeLookup);
    on<ProductLookupRequested>(_onProductLookup);
    on<AddBarcodeRequested>(_onAddRequested);
    on<SetDefaultBarcodeRequested>(_onSetDefaultRequested);
    on<DeleteBarcodeRequested>(_onDeleteRequested);
    on<BarcodeStreamUpdated>(_onStreamUpdated);
    on<BarcodeStreamFailed>(_onStreamFailed);
    on<ClearBarcodeLookup>(_onClearLookup);
  }

  // =========================================================
  // WATCH PRODUCT BARCODES
  // =========================================================

  Future<void> _onWatchRequested(
    WatchBarcodesRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    await _cancelSubscription();

    emit(state.copyWith(
      isLoading: true,
      isWatching: false,
      hasLoaded: false,
      currentProductId: event.productId,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      // تحميل البيانات الأولية
      final barcodes = await _getProductBarcodes(event.productId);

      emit(state.copyWith(
        barcodes: barcodes,
        isLoading: false,
        isWatching: true,
        hasLoaded: true,
      ));

      // بدء مراقبة التغييرات
      _barcodesSubscription = _watchProductBarcodes(
        event.productId,
      ).listen(
        (barcodes) {
          if (!isClosed) {
            add(BarcodesEvent.streamUpdated(
              barcodes: barcodes,
            ));
          }
        },
        onError: (Object error, StackTrace stackTrace) {
          if (!isClosed) {
            add(BarcodesEvent.streamFailed(
              message: _errorMessage(error),
            ));
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        isWatching: false,
        hasLoaded: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // LOAD PRODUCT BARCODES
  // =========================================================

  Future<void> _onLoadRequested(
    LoadBarcodesRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final barcodes = await _getProductBarcodes(event.productId);

      emit(state.copyWith(
        barcodes: barcodes,
        currentProductId: event.productId,
        isLoading: false,
        hasLoaded: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // LOOKUP BARCODE
  // =========================================================

  Future<void> _onBarcodeLookup(
    BarcodeLookupRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    final barcode = event.barcode.trim();

    if (barcode.isEmpty) {
      emit(state.copyWith(
        selectedBarcode: null,
        errorMessage: 'يرجى إدخال الباركود',
        successMessage: null,
      ));
      return;
    }

    emit(state.copyWith(
      isSearching: true,
      errorMessage: null,
      successMessage: null,
      selectedBarcode: null,
    ));

    try {
      final result = await _getBarcode(barcode);

      if (result == null) {
        emit(state.copyWith(
          isSearching: false,
          selectedBarcode: null,
          errorMessage: 'الباركود غير موجود',
        ));
        return;
      }

      emit(state.copyWith(
        isSearching: false,
        selectedBarcode: result,
        successMessage: 'تم العثور على الباركود',
      ));
    } catch (error) {
      emit(state.copyWith(
        isSearching: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // LOOKUP PRODUCT BY BARCODE
  // =========================================================

  Future<void> _onProductLookup(
    ProductLookupRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    final barcode = event.barcode.trim();

    if (barcode.isEmpty) {
      emit(state.copyWith(
        scannedProduct: null,
        errorMessage: 'يرجى إدخال الباركود',
      ));
      return;
    }

    emit(state.copyWith(
      isSearching: true,
      scannedProduct: null,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final product = await _getProductByBarcode(barcode);

      if (product == null) {
        emit(state.copyWith(
          isSearching: false,
          scannedProduct: null,
          errorMessage: 'لا يوجد منتج مرتبط بهذا الباركود',
        ));
        return;
      }

      emit(state.copyWith(
        isSearching: false,
        scannedProduct: product,
        successMessage: 'تم العثور على المنتج بنجاح',
      ));
    } catch (error) {
      emit(state.copyWith(
        isSearching: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // INSERT PRODUCT BARCODE
  // =========================================================

  Future<void> _onAddRequested(
    AddBarcodeRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
      lastInsertedId: null,
    ));

    try {
      final insertedId = await _insertProductBarcode(
        event.barcode,
      );

      emit(state.copyWith(
        isSaving: false,
        lastInsertedId: insertedId,
        successMessage: 'تمت إضافة الباركود بنجاح',
      ));

      // تحديث القائمة إذا لم يكن Stream مفعلاً
      if (!state.isWatching && state.currentProductId != null) {
        add(BarcodesEvent.loadRequested(
          productId: state.currentProductId!,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // SET DEFAULT BARCODE
  // =========================================================

  Future<void> _onSetDefaultRequested(
    SetDefaultBarcodeRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    emit(state.copyWith(
      isSettingDefault: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      await _setDefaultBarcode(
        productId: event.productId,
        barcodeId: event.barcodeId,
      );

      emit(state.copyWith(
        isSettingDefault: false,
        successMessage: 'تم تعيين الباركود الافتراضي بنجاح',
      ));

      // تحديث القائمة في حال عدم تفعيل Stream
      if (!state.isWatching) {
        final barcodes = await _getProductBarcodes(
          event.productId,
        );

        emit(state.copyWith(
          barcodes: barcodes,
          currentProductId: event.productId,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        isSettingDefault: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // DELETE PRODUCT BARCODE
  // =========================================================

  Future<void> _onDeleteRequested(
    DeleteBarcodeRequested event,
    Emitter<BarcodesState> emit,
  ) async {
    emit(state.copyWith(
      isDeleting: true,
      errorMessage: null,
      successMessage: null,
      lastDeletedId: null,
    ));

    try {
      final deletedRows = await _deleteProductBarcode(
        event.id,
      );

      if (deletedRows == 0) {
        emit(state.copyWith(
          isDeleting: false,
          errorMessage: 'لم يتم العثور على الباركود المطلوب حذفه',
        ));
        return;
      }

      emit(state.copyWith(
        isDeleting: false,
        lastDeletedId: event.id,
        successMessage: 'تم حذف الباركود بنجاح',
        selectedBarcode: state.selectedBarcode?.id == event.id
            ? null
            : state.selectedBarcode,
      ));

      // تحديث القائمة إذا لم يكن Stream مفعلاً
      if (!state.isWatching && state.currentProductId != null) {
        final barcodes = await _getProductBarcodes(
          state.currentProductId!,
        );

        emit(state.copyWith(
          barcodes: barcodes,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        isDeleting: false,
        errorMessage: _errorMessage(error),
      ));
    }
  }

  // =========================================================
  // STREAM UPDATED
  // =========================================================

  void _onStreamUpdated(
    BarcodeStreamUpdated event,
    Emitter<BarcodesState> emit,
  ) {
    emit(state.copyWith(
      barcodes: event.barcodes,
      hasLoaded: true,
      isLoading: false,
      errorMessage: null,
    ));
  }

  // =========================================================
  // STREAM FAILED
  // =========================================================

  void _onStreamFailed(
    BarcodeStreamFailed event,
    Emitter<BarcodesState> emit,
  ) {
    emit(state.copyWith(
      isLoading: false,
      errorMessage: event.message,
    ));
  }

  // =========================================================
  // CLEAR LOOKUP
  // =========================================================

  void _onClearLookup(
    ClearBarcodeLookup event,
    Emitter<BarcodesState> emit,
  ) {
    emit(state.copyWith(
      selectedBarcode: null,
      scannedProduct: null,
      errorMessage: null,
      successMessage: null,
      isSearching: false,
    ));
  }

  // =========================================================
  // HELPERS
  // =========================================================

  Future<void> _cancelSubscription() async {
    await _barcodesSubscription?.cancel();
    _barcodesSubscription = null;
  }

  String _errorMessage(Object error) {
    final message = error.toString();

    return message.startsWith('Exception: ')
        ? message.substring('Exception: '.length)
        : message;
  }

  // =========================================================
  // CLOSE
  // =========================================================

  @override
  Future<void> close() async {
    await _cancelSubscription();
    return super.close();
  }
}