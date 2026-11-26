
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/product/product_barcode.dart';
import '../../models/product/product_barcode_model.dart';

class ProductBarcodeMapper {
  const ProductBarcodeMapper._();

  static ProductBarcodeModel fromDb(ProductBarcodeDb db) {
    return ProductBarcodeModel(
      id: db.id,
      productId: db.productId,
      productUnitId: db.productUnitId,
      barcode: db.barcode,
      barcodeType: db.barcodeType,
      source: db.source,
      isDefault: db.isDefault,
      isActive: db.isActive,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  static ProductBarcode toEntity(ProductBarcodeModel model) {
    return ProductBarcode(
      id: model.id,
      productId: model.productId,
      productUnitId: model.productUnitId,
      barcode: model.barcode,
      barcodeType: model.barcodeType,
      source: model.source,
      isDefault: model.isDefault,
      isActive: model.isActive,
    );
  }

  static ProductBarcodeModel fromEntity(ProductBarcode entity) {
    return ProductBarcodeModel(
      id: entity.id,
      productId: entity.productId,
      productUnitId: entity.productUnitId,
      barcode: entity.barcode,
      barcodeType: entity.barcodeType,
      source: entity.source,
      isDefault: entity.isDefault,
      isActive: entity.isActive,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static ProductBarcodesCompanion toCompanion(
    ProductBarcodeModel model,
  ) {
    return ProductBarcodesCompanion(
      productId: Value(model.productId),
      productUnitId: Value(model.productUnitId),
      barcode: Value(model.barcode),
      barcodeType: Value(model.barcodeType),
      source: Value(model.source),
      isDefault: Value(model.isDefault),
      isActive: Value(model.isActive),
    );
  }
}
