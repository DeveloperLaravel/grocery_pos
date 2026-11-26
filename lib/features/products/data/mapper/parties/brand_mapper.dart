
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/parties/brand.dart';
import '../../models/parties/brand_model.dart';

class BrandMapper {
  const BrandMapper._();

  static BrandModel fromDb(BrandDb db) {
    return BrandModel(
      id: db.id,
      name: db.name,
      description: db.description,
      imagePath: db.imagePath,
      isActive: db.isActive,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  static Brand toEntity(BrandModel model) {
    return Brand(
      id: model.id,
      name: model.name,
      description: model.description,
      imagePath: model.imagePath,
      isActive: model.isActive,
    );
  }

  static BrandModel fromEntity(Brand entity) {
    final now = DateTime.now();

    return BrandModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imagePath: entity.imagePath,
      isActive: entity.isActive,
      createdAt: now,
      updatedAt: now,
    );
  }

  static BrandsCompanion toCompanion(BrandModel model) {
    return BrandsCompanion(
      name: Value(model.name),
      description: Value(model.description),
      imagePath: Value(model.imagePath),
      isActive: Value(model.isActive),
    );
  }
}
