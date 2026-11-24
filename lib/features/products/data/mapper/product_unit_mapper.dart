
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/product_unit.dart';
import '../models/product_unit_model.dart';

class ProductUnitMapper {
  ProductUnitMapper._();

  // ==========================================
  // Drift -> Freezed Model
  // ==========================================

  static ProductUnitModel fromDb(ProductUnitDb db) {
    return ProductUnitModel(
      id: db.id,
      productId: db.productId,
      unitName: db.unitName,
      unitSymbol: db.unitSymbol,
      conversionFactor: db.conversionFactor,
      salePrice: db.salePrice,
      purchasePrice: db.purchasePrice,
      isBaseUnit: db.isBaseUnit,
      isDefault: db.isDefault,
      isActive: db.isActive,
      sortOrder: db.sortOrder,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // ==========================================
  // Freezed Model -> Domain Entity
  // ==========================================

  static ProductUnit toEntity(ProductUnitModel model) {
    return ProductUnit(
      id: model.id,
      productId: model.productId,
      unitName: model.unitName,
      unitSymbol: model.unitSymbol,
      conversionFactor: model.conversionFactor,
      salePrice: model.salePrice,
      purchasePrice: model.purchasePrice,
      isBaseUnit: model.isBaseUnit,
      isDefault: model.isDefault,
      isActive: model.isActive,
      sortOrder: model.sortOrder,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // ==========================================
  // Domain Entity -> Freezed Model
  // ==========================================

  static ProductUnitModel fromEntity(ProductUnit entity) {
    return ProductUnitModel(
      id: entity.id,
      productId: entity.productId,
      unitName: entity.unitName,
      unitSymbol: entity.unitSymbol,
      conversionFactor: entity.conversionFactor,
      salePrice: entity.salePrice,
      purchasePrice: entity.purchasePrice,
      isBaseUnit: entity.isBaseUnit,
      isDefault: entity.isDefault,
      isActive: entity.isActive,
      sortOrder: entity.sortOrder,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // ==========================================
  // Domain Entity -> Drift Companion
  // ==========================================

  static ProductUnitsCompanion toCompanion(
    ProductUnit entity,
  ) {
    return ProductUnitsCompanion(
      productId: Value(entity.productId),
      unitName: Value(entity.unitName),
      unitSymbol: Value(entity.unitSymbol),
      conversionFactor: Value(entity.conversionFactor),
      salePrice: Value(entity.salePrice),
      purchasePrice: Value(entity.purchasePrice),
      isBaseUnit: Value(entity.isBaseUnit),
      isDefault: Value(entity.isDefault),
      isActive: Value(entity.isActive),
      sortOrder: Value(entity.sortOrder),
      updatedAt: Value(DateTime.now()),
    );
  }
}
