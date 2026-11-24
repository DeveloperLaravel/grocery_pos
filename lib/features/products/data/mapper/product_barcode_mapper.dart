
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/product_barcode.dart';
import '../models/product_barcode_model.dart';

class ProductBarcodeMapper {
  ProductBarcodeMapper._();

  /// Drift -> Freezed Model
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

  /// Freezed Model -> Domain Entity
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
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Domain Entity -> Freezed Model
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
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Domain Entity -> Drift Companion
  static ProductBarcodesCompanion toCompanion(
    ProductBarcode entity,
  ) {
    return ProductBarcodesCompanion(
      productId: Value(entity.productId),
      productUnitId: Value(entity.productUnitId),
      barcode: Value(entity.barcode),
      barcodeType: Value(entity.barcodeType),
      source: Value(entity.source),
      isDefault: Value(entity.isDefault),
      isActive: Value(entity.isActive),
      updatedAt: Value(DateTime.now()),
    );
  }
}
