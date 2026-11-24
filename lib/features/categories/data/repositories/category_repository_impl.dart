
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../database/category_local_data_source.dart';
import '../mappers/category_mapper.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl(this.localDataSource);

  // =========================================================
  // Get All Categories
  // =========================================================

  @override
  Future<List<Category>> getAllCategories() async {
    final models = await localDataSource.getAllCategories();

    return models
        .map(CategoryMapper.toEntity)
        .toList();
  }

  // =========================================================
  // Watch All Categories
  // =========================================================

  @override
  Stream<List<Category>> watchAllCategories() {
    return localDataSource.watchAllCategories().map(
      (models) => models
          .map(CategoryMapper.toEntity)
          .toList(),
    );
  }

  // =========================================================
  // Get Category By ID
  // =========================================================

  @override
  Future<Category?> getCategoryById(int id) async {
    final model = await localDataSource.getCategoryById(id);

    if (model == null) return null;

    return CategoryMapper.toEntity(model);
  }

  // =========================================================
  // Get Categories By Parent ID
  // =========================================================

  @override
  Future<List<Category>> getCategoriesByParentId(
    int? parentId,
  ) async {
    final models =
        await localDataSource.getCategoriesByParentId(parentId);

    return models
        .map(CategoryMapper.toEntity)
        .toList();
  }

  // =========================================================
  // Watch Categories By Parent ID
  // =========================================================

  @override
  Stream<List<Category>> watchCategoriesByParentId(
    int? parentId,
  ) {
    return localDataSource.watchCategoriesByParentId(parentId).map(
      (models) => models
          .map(CategoryMapper.toEntity)
          .toList(),
    );
  }

  // =========================================================
  // Search Categories
  // =========================================================

  @override
  Future<List<Category>> searchCategories(String keyword) async {
    final models =
        await localDataSource.searchCategories(keyword);

    return models
        .map(CategoryMapper.toEntity)
        .toList();
  }

  // =========================================================
  // Get Active Categories
  // =========================================================

  @override
  Future<List<Category>> getActiveCategories() async {
    final models = await localDataSource.getActiveCategories();

    return models
        .map(CategoryMapper.toEntity)
        .toList();
  }

  // =========================================================
  // Add Category
  // =========================================================

  @override
  Future<int> addCategory(Category category) {
    final model = CategoryMapper.fromEntity(category);

    return localDataSource.insertCategory(model);
  }

  // =========================================================
  // Update Category
  // =========================================================

  @override
Future<bool> updateCategory(Category category) async {
  final id = category.id;

  if (id == null || id <= 0) {
    throw ArgumentError.value(
      id,
      'category.id',
      'Invalid category ID',
    );
  }

  final model = CategoryMapper.fromEntity(category);

  return localDataSource.updateCategory(id, model);
}

  // =========================================================
  // Delete Category
  // =========================================================

  @override
  Future<bool> deleteCategory(int id) {
    return localDataSource.deleteCategoryById(id);
  }

  // =========================================================
  // Check Category Exists
  // =========================================================

  @override
  Future<bool> categoryExists(int id) {
    return localDataSource.categoryExists(id);
  }

  // =========================================================
  // Check Children
  // =========================================================

  @override
  Future<bool> hasChildren(int id) {
    return localDataSource.hasChildren(id);
  }

  // =========================================================
  // Count Products
  // =========================================================

  @override
  Future<int> countProducts(int categoryId) {
    return localDataSource.countProducts(categoryId);
  }
}
