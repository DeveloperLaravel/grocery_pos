import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product.dart';
import '../../../domain/entities/product/product_barcode.dart';

part 'barcodes_state.freezed.dart';

@freezed
abstract class BarcodesState with _$BarcodesState {
  const factory BarcodesState({
    @Default([]) List<ProductBarcode> barcodes,

    ProductBarcode? selectedBarcode,

    Product? scannedProduct,

    @Default(false) bool isLoading,

    @Default(false) bool isSaving,

    @Default(false) bool isDeleting,

    @Default(false) bool isSettingDefault,

    @Default(false) bool isSearching,

    @Default(false) bool isWatching,

    int? currentProductId,

    int? lastInsertedId,

    int? lastDeletedId,

    @Default(false) bool hasLoaded,

    String? errorMessage,

    String? successMessage,
  }) = _BarcodesState;
}