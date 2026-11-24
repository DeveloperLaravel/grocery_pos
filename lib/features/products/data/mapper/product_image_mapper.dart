
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/product_image.dart';
import '../models/product_image_model.dart';

class ProductImageMapper {
  ProductImageMapper._();

  /// Drift -> Freezed Model
  static ProductImageModel fromDb(ProductImageDb db) {
    return ProductImageModel(
      id: db.id,
      productId: db.productId,
      imagePath: db.imagePath,
      imageName: db.imageName,
      isPrimary: db.isPrimary,
      sortOrder: db.sortOrder,
      createdAt: db.createdAt,
    );
  }

  /// Freezed Model -> Domain Entity
  static ProductImage toEntity(ProductImageModel model) {
    return ProductImage(
      id: model.id,
      productId: model.productId,
      imagePath: model.imagePath,
      imageName: model.imageName,
      isPrimary: model.isPrimary,
      sortOrder: model.sortOrder,
      createdAt: model.createdAt,
    );
  }

  /// Domain Entity -> Freezed Model
  static ProductImageModel fromEntity(ProductImage entity) {
    return ProductImageModel(
      id: entity.id,
      productId: entity.productId,
      imagePath: entity.imagePath,
      imageName: entity.imageName,
      isPrimary: entity.isPrimary,
      sortOrder: entity.sortOrder,
      createdAt: entity.createdAt,
    );
  }

  /// Domain Entity -> Drift Companion
  static ProductImagesCompanion toCompanion(
    ProductImage entity,
  ) {
    return ProductImagesCompanion(
      productId: Value(entity.productId),
      imagePath: Value(entity.imagePath),
      imageName: Value(entity.imageName),
      isPrimary: Value(entity.isPrimary),
      sortOrder: Value(entity.sortOrder),
    );
  }
}
