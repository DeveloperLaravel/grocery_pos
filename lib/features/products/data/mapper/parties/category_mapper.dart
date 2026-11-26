
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/parties/category.dart';
import '../../models/parties/category_model.dart';

class CategoryMapper {
  const CategoryMapper._();

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

  static Category toEntity(CategoryModel model) {
    return Category(
      id: model.id,
      name: model.name,
      description: model.description,
      parentId: model.parentId,
      imagePath: model.imagePath,
      isActive: model.isActive,
      sortOrder: model.sortOrder,
    );
  }

  static CategoryModel fromEntity(Category entity) {
    final now = DateTime.now();

    return CategoryModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      parentId: entity.parentId,
      imagePath: entity.imagePath,
      isActive: entity.isActive,
      sortOrder: entity.sortOrder,
      createdAt: now,
      updatedAt: now,
    );
  }

  static CategoriesCompanion toCompanion(CategoryModel model) {
    return CategoriesCompanion(
      name: Value(model.name),
      description: Value(model.description),
      parentId: Value(model.parentId),
      imagePath: Value(model.imagePath),
      isActive: Value(model.isActive),
      sortOrder: Value(model.sortOrder),
    );
  }
}
