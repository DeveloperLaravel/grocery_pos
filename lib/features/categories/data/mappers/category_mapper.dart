
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/category.dart';
import '../models/category_model.dart';

class CategoryMapper {
  const CategoryMapper._();

  // =========================================================
  // Drift DB -> Model
  // =========================================================

  static CategoryModel fromDb(CategoryDb db) {
    return CategoryModel(
      id: db.id,
      name: db.name,
      description: db.description,
      parentId: db.parentId,
      imagePath: db.imagePath,
      isActive: db.isActive,
      sortOrder: db.sortOrder,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // =========================================================
  // Model -> Drift Insert Companion
  // =========================================================

  static CategoriesCompanion toInsertCompanion(
    CategoryModel model,
  ) {
    return CategoriesCompanion.insert(
      name: model.name,
      description: Value(model.description),
      parentId: Value(model.parentId),
      imagePath: Value(model.imagePath),
      isActive: Value(model.isActive),
      sortOrder: Value(model.sortOrder),
    );
  }

  // =========================================================
  // Model -> Drift Update Companion
  // =========================================================

  static CategoriesCompanion toUpdateCompanion(
    CategoryModel model,
  ) {
    return CategoriesCompanion(
      name: Value(model.name),
      description: Value(model.description),
      parentId: Value(model.parentId),
      imagePath: Value(model.imagePath),
      isActive: Value(model.isActive),
      sortOrder: Value(model.sortOrder),
      updatedAt: Value(DateTime.now()),
    );
  }

  // =========================================================
  // Model -> Domain Entity
  // =========================================================

  static Category toEntity(CategoryModel model) {
    return Category(
      id: model.id!,
      name: model.name,
      description: model.description,
      parentId: model.parentId,
      imagePath: model.imagePath,
      isActive: model.isActive,
      sortOrder: model.sortOrder,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // =========================================================
  // Domain Entity -> Model
  // =========================================================

  static CategoryModel fromEntity(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      parentId: entity.parentId,
      imagePath: entity.imagePath,
      isActive: entity.isActive,
      sortOrder: entity.sortOrder,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
