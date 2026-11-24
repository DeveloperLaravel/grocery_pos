
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/product_unit.dart';
import '../../domain/entities/product_barcode.dart';
import '../../domain/entities/product_image.dart';

part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  // =========================================================
  // Products
  // =========================================================

  const factory ProductsEvent.started() = ProductsStarted;

  const factory ProductsEvent.loadAll() = ProductsLoadAll;

  const factory ProductsEvent.watchRequested() =
      ProductsWatchRequested;

  const factory ProductsEvent.stopWatching() =
      ProductsStopWatching;

  const factory ProductsEvent.productsChanged(
    List<Product> products,
  ) = ProductsChanged;

  const factory ProductsEvent.streamFailed(
    String message,
  ) = ProductsStreamFailed;

  const factory ProductsEvent.getById(
    int id,
  ) = ProductsGetById;

  const factory ProductsEvent.getByBarcode(
    String barcode,
  ) = ProductsGetByBarcode;

  const factory ProductsEvent.search(
    String query,
  ) = ProductsSearch;

  const factory ProductsEvent.create(
    Product product,
  ) = ProductsCreate;

  const factory ProductsEvent.update(
    Product product,
  ) = ProductsUpdate;

  const factory ProductsEvent.delete(
    int id,
  ) = ProductsDelete;

  const factory ProductsEvent.clearSelection() =
      ProductsClearSelection;

  // =========================================================
  // Product Units
  // =========================================================

  const factory ProductsEvent.loadUnits(
    int productId,
  ) = ProductsLoadUnits;

  const factory ProductsEvent.addUnit(
    ProductUnit unit,
  ) = ProductsAddUnit;

  const factory ProductsEvent.updateUnit(
    ProductUnit unit,
  ) = ProductsUpdateUnit;

  const factory ProductsEvent.deleteUnit({
    required int id,
    required int productId,
  }) = ProductsDeleteUnit;

  const factory ProductsEvent.setDefaultUnit({
    required int productId,
    required int unitId,
  }) = ProductsSetDefaultUnit;

  // =========================================================
  // Product Barcodes
  // =========================================================

  const factory ProductsEvent.loadBarcodes(
    int productId,
  ) = ProductsLoadBarcodes;

  const factory ProductsEvent.getBarcodeDetails(
    String barcode,
  ) = ProductsGetBarcodeDetails;

  const factory ProductsEvent.addBarcode(
    ProductBarcode barcode,
  ) = ProductsAddBarcode;

  const factory ProductsEvent.deleteBarcode({
    required int id,
    required int productId,
  }) = ProductsDeleteBarcode;

  const factory ProductsEvent.setDefaultBarcode({
    required int id,
    required int productId,
  }) = ProductsSetDefaultBarcode;

  // =========================================================
  // Product Images
  // =========================================================

  const factory ProductsEvent.loadImages(
    int productId,
  ) = ProductsLoadImages;

  const factory ProductsEvent.addImage(
    ProductImage image,
  ) = ProductsAddImage;

  const factory ProductsEvent.deleteImage({
    required int id,
    required int productId,
  }) = ProductsDeleteImage;

  const factory ProductsEvent.setPrimaryImage({
    required int id,
    required int productId,
  }) = ProductsSetPrimaryImage;

  // =========================================================
  // Messages
  // =========================================================

  const factory ProductsEvent.clearMessages() =
      ProductsClearMessages;
}