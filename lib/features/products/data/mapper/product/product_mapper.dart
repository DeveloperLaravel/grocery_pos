import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/product/product.dart';
import '../../models/product/product_model.dart';

class ProductMapper {
  const ProductMapper._();

  // Drift Database Model -> Freezed Model
  static ProductModel fromDb(ProductDb db) {
    return ProductModel(
      id: db.id,
      name: db.name,
      description: db.description,
      categoryId: db.categoryId,
      brandId: db.brandId,
      productType: db.productType,
      baseUnit: db.baseUnit,
      allowDecimalQuantity: db.allowDecimalQuantity,
      costPrice: db.costPrice,
      salePrice: db.salePrice,
      minStock: db.minStock,
      quantity: db.quantity,
      isActive: db.isActive,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // Freezed Model -> Domain Entity
  static Product toEntity(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      description: model.description,
      categoryId: model.categoryId,
      brandId: model.brandId,
      productType: model.productType,
      baseUnit: model.baseUnit,
      allowDecimalQuantity: model.allowDecimalQuantity,
      costPrice: model.costPrice,
      salePrice: model.salePrice,
      minStock: model.minStock,
      quantity: model.quantity,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // Domain Entity -> Drift Companion
  static ProductsCompanion toCompanion(Product entity) {
    return ProductsCompanion(
      name: Value(entity.name),
      description: Value(entity.description),
      categoryId: Value(entity.categoryId),
      brandId: Value(entity.brandId),
      productType: Value(entity.productType),
      baseUnit: Value(entity.baseUnit),
      allowDecimalQuantity: Value(entity.allowDecimalQuantity),
      costPrice: Value(entity.costPrice),
      salePrice: Value(entity.salePrice),
      minStock: Value(entity.minStock),
      quantity: Value(entity.quantity),
      isActive: Value(entity.isActive),
    );
  }
  static ProductModel fromEntity(Product entity) {
  return ProductModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    categoryId: entity.categoryId,
    brandId: entity.brandId,
    productType: entity.productType,
    baseUnit: entity.baseUnit,
    allowDecimalQuantity: entity.allowDecimalQuantity,
    costPrice: entity.costPrice,
    salePrice: entity.salePrice,
    minStock: entity.minStock,
    quantity: entity.quantity,
    isActive: entity.isActive,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  );
}
}