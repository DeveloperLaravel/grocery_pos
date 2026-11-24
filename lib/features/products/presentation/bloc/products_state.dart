
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/product_unit.dart';
import '../../domain/entities/product_barcode.dart';
import '../../domain/entities/product_image.dart';

part 'products_state.freezed.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    // =======================================================
    // Products
    // =======================================================

    @Default([]) List<Product> products,

    @Default([]) List<Product> allProducts,

    Product? selectedProduct,

    Product? barcodeProduct,

    @Default('') String searchQuery,

    // =======================================================
    // Current Product
    // =======================================================

    int? currentProductId,

    // =======================================================
    // Product Units
    // =======================================================

    @Default([]) List<ProductUnit> units,

    // =======================================================
    // Product Barcodes
    // =======================================================

    @Default([]) List<ProductBarcode> barcodes,

    ProductBarcode? selectedBarcode,

    // =======================================================
    // Product Images
    // =======================================================

    @Default([]) List<ProductImage> images,

    // =======================================================
    // Loading States
    // =======================================================

    @Default(false) bool isLoading,

    @Default(false) bool isSaving,

    @Default(false) bool isDeleting,

    @Default(false) bool isSearching,

    @Default(false) bool isLoadingProduct,

    @Default(false) bool isLoadingUnits,

    @Default(false) bool isLoadingBarcodes,

    @Default(false) bool isLoadingImages,

    @Default(false) bool isWatching,

    // =======================================================
    // Operation Results
    // =======================================================

    int? lastCreatedProductId,

    int? lastCreatedUnitId,

    int? lastCreatedBarcodeId,

    int? lastCreatedImageId,

    // =======================================================
    // Messages
    // =======================================================

    String? errorMessage,

    String? successMessage,
  }) = _ProductsState;

  const ProductsState._();

  // =========================================================
  // Computed Properties
  // =========================================================

  bool get hasProducts => products.isNotEmpty;

  bool get hasUnits => units.isNotEmpty;

  bool get hasBarcodes => barcodes.isNotEmpty;

  bool get hasImages => images.isNotEmpty;

  bool get hasError =>
      errorMessage != null && errorMessage!.isNotEmpty;

  bool get hasSuccess =>
      successMessage != null && successMessage!.isNotEmpty;

  bool get isEmpty => products.isEmpty;

  bool get isBusy =>
      isLoading ||
      isSaving ||
      isDeleting ||
      isSearching ||
      isLoadingProduct ||
      isLoadingUnits ||
      isLoadingBarcodes ||
      isLoadingImages;
}