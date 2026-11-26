
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/product/product_unit.dart';
import '../../models/product/product_unit_model.dart';

class ProductUnitMapper {
  const ProductUnitMapper._();

  static ProductUnitModel fromDb(ProductUnitDb db) {
    return ProductUnitModel(
      id: db.id,
      productId: db.productId,
      unitName: db.unitName,
      conversionFactor: db.conversionFactor,
      costPrice: db.costPrice,
      salePrice: db.salePrice,
      isBaseUnit: db.isBaseUnit,
      isDefault: db.isDefault,
      isActive: db.isActive,
      sortOrder: db.sortOrder,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  static ProductUnit toEntity(ProductUnitModel model) {
    return ProductUnit(
      id: model.id,
      productId: model.productId,
      unitName: model.unitName,
      conversionFactor: model.conversionFactor,
      costPrice: model.costPrice,
      salePrice: model.salePrice,
      isBaseUnit: model.isBaseUnit,
      isDefault: model.isDefault,
      isActive: model.isActive,
      sortOrder: model.sortOrder,
    );
  }

  static ProductUnitModel fromEntity(ProductUnit entity) {
    return ProductUnitModel(
      id: entity.id,
      productId: entity.productId,
      unitName: entity.unitName,
      conversionFactor: entity.conversionFactor,
      costPrice: entity.costPrice,
      salePrice: entity.salePrice,
      isBaseUnit: entity.isBaseUnit,
      isDefault: entity.isDefault,
      isActive: entity.isActive,
      sortOrder: entity.sortOrder,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static ProductUnitsCompanion toCompanion(
    ProductUnitModel model,
  ) {
    return ProductUnitsCompanion(
      unitName: Value(model.unitName),
      conversionFactor: Value(model.conversionFactor),
      costPrice: Value(model.costPrice),
      salePrice: Value(model.salePrice),
      isActive: Value(model.isActive),
      sortOrder: Value(model.sortOrder),
    );
  }
}
