
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/product/product_image.dart';
import '../../models/product/product_image_model.dart';

class ProductImageMapper {
  const ProductImageMapper._();

  static ProductImageModel fromDb(ProductImageDb db) {
    return ProductImageModel(
      id: db.id,
      productId: db.productId,
      imagePath: db.imagePath,
      imageName: db.imageName,
      isPrimary: db.isPrimary,
      sortOrder: db.sortOrder,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  static ProductImage toEntity(ProductImageModel model) {
    return ProductImage(
      id: model.id,
      productId: model.productId,
      imagePath: model.imagePath,
      imageName: model.imageName,
      isPrimary: model.isPrimary,
      sortOrder: model.sortOrder,
    );
  }

  static ProductImageModel fromEntity(ProductImage entity) {
    final now = DateTime.now();

    return ProductImageModel(
      id: entity.id,
      productId: entity.productId,
      imagePath: entity.imagePath,
      imageName: entity.imageName,
      isPrimary: entity.isPrimary,
      sortOrder: entity.sortOrder,
      createdAt: now,
      updatedAt: now,
    );
  }

  static ProductImagesCompanion toCompanion(
    ProductImageModel model,
  ) {
    return ProductImagesCompanion(
      productId: Value(model.productId),
      imagePath: Value(model.imagePath),
      imageName: Value(model.imageName),
      isPrimary: Value(model.isPrimary),
      sortOrder: Value(model.sortOrder),
    );
  }
}
