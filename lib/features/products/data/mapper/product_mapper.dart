
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

class ProductMapper {
  ProductMapper._();

  // =====================================================
  // Drift Database -> Freezed Model
  // =====================================================

  static ProductModel fromDb(ProductDb db) {
    return ProductModel(
      id: db.id,
      name: db.name,
      description: db.description,
      categoryId: db.categoryId,
      brandId: db.brandId,
      barcode: db.barcode,
      productType: db.productType,
      baseUnit: db.baseUnit,
      allowDecimalQuantity: db.allowDecimalQuantity,
      costPrice: db.costPrice,
      salePrice: db.salePrice,
      quantity: db.quantity,
      minStock: db.minStock,
      imagePath: db.imagePath,
      imageName: db.imageName,
      imageUpdatedAt: db.imageUpdatedAt,
      isActive: db.isActive,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // =====================================================
  // Freezed Model -> Domain Entity
  // =====================================================

  static Product toEntity(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      description: model.description,
      categoryId: model.categoryId,
      brandId: model.brandId,
      barcode: model.barcode,
      productType: model.productType,
      baseUnit: model.baseUnit,
      allowDecimalQuantity: model.allowDecimalQuantity,
      costPrice: model.costPrice,
      salePrice: model.salePrice,
      quantity: model.quantity,
      minStock: model.minStock,
      imagePath: model.imagePath,
      imageName: model.imageName,
      imageUpdatedAt: model.imageUpdatedAt,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // =====================================================
  // Domain Entity -> Freezed Model
  // =====================================================

  static ProductModel fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      categoryId: entity.categoryId,
      brandId: entity.brandId,
      barcode: entity.barcode,
      productType: entity.productType,
      baseUnit: entity.baseUnit,
      allowDecimalQuantity: entity.allowDecimalQuantity,
      costPrice: entity.costPrice,
      salePrice: entity.salePrice,
      quantity: entity.quantity,
      minStock: entity.minStock,
      imagePath: entity.imagePath,
      imageName: entity.imageName,
      imageUpdatedAt: entity.imageUpdatedAt,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // =====================================================
  // Freezed Model -> Create Companion
  // =====================================================

  static ProductsCompanion toCreateCompanionFromModel(
    ProductModel model,
  ) {
    return ProductsCompanion.insert(
      name: model.name,
      description: Value(model.description),
      categoryId: Value(model.categoryId),
      brandId: Value(model.brandId),

      // الباركود يدار من خلال ProductsDao.
      barcode: Value(model.barcode),

      productType: Value(model.productType),
      baseUnit: Value(model.baseUnit),
      allowDecimalQuantity: Value(model.allowDecimalQuantity),

      costPrice: Value(model.costPrice),
      salePrice: Value(model.salePrice),
      quantity: Value(model.quantity),
      minStock: Value(model.minStock),

      imagePath: Value(model.imagePath),
      imageName: Value(model.imageName),
      imageUpdatedAt: Value(model.imageUpdatedAt),

      isActive: Value(model.isActive),
      createdAt: Value(model.createdAt),
      updatedAt: Value(model.updatedAt),
    );
  }

  // =====================================================
  // Freezed Model -> Update Companion
  // =====================================================

  static ProductsCompanion toUpdateCompanionFromModel(
    ProductModel model,
  ) {
    return ProductsCompanion(
      name: Value(model.name),
      description: Value(model.description),
      categoryId: Value(model.categoryId),
      brandId: Value(model.brandId),

      // لا نعدل الباركود من هنا.
      productType: Value(model.productType),
      baseUnit: Value(model.baseUnit),
      allowDecimalQuantity: Value(model.allowDecimalQuantity),

      costPrice: Value(model.costPrice),
      salePrice: Value(model.salePrice),
      quantity: Value(model.quantity),
      minStock: Value(model.minStock),

      imagePath: Value(model.imagePath),
      imageName: Value(model.imageName),
      imageUpdatedAt: Value(model.imageUpdatedAt),

      isActive: Value(model.isActive),
      updatedAt: Value(DateTime.now()),
    );
  }
}
