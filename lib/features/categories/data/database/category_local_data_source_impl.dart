
import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/master_data/parties/categories_dao.dart';
import '../mappers/category_mapper.dart';
import '../models/category_model.dart';
import 'category_local_data_source.dart';

@LazySingleton(as: CategoryLocalDataSource)
class CategoryLocalDataSourceImpl
    implements CategoryLocalDataSource {
  final CategoriesDao dao;

  CategoryLocalDataSourceImpl(this.dao);

  // =========================================================
  // Get All Categories
  // =========================================================

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final result = await dao.getAllCategories();

    return result
        .map(CategoryMapper.fromDb)
        .toList();
  }

  // =========================================================
  // Watch All Categories
  // =========================================================

  @override
  Stream<List<CategoryModel>> watchAllCategories() {
    return dao.watchAllCategories().map(
      (items) => items
          .map(CategoryMapper.fromDb)
          .toList(),
    );
  }

  // =========================================================
  // Get Category By ID
  // =========================================================

  @override
  Future<CategoryModel?> getCategoryById(int id) async {
    final result = await dao.getCategoryById(id);

    if (result == null) return null;

    return CategoryMapper.fromDb(result);
  }

  // =========================================================
  // Get Categories By Parent ID
  // =========================================================

  @override
  Future<List<CategoryModel>> getCategoriesByParentId(
    int? parentId,
  ) async {
    final result = await dao.getCategoriesByParentId(parentId);

    return result
        .map(CategoryMapper.fromDb)
        .toList();
  }

  // =========================================================
  // Watch Categories By Parent ID
  // =========================================================

  @override
  Stream<List<CategoryModel>> watchCategoriesByParentId(
    int? parentId,
  ) {
    return dao.watchCategoriesByParentId(parentId).map(
      (items) => items
          .map(CategoryMapper.fromDb)
          .toList(),
    );
  }

  // =========================================================
  // Search Categories
  // =========================================================

  @override
  Future<List<CategoryModel>> searchCategories(
    String keyword,
  ) async {
    final result = await dao.searchCategories(keyword);

    return result
        .map(CategoryMapper.fromDb)
        .toList();
  }

  // =========================================================
  // Get Active Categories
  // =========================================================

  @override
  Future<List<CategoryModel>> getActiveCategories() async {
    final result = await dao.getActiveCategories();

    return result
        .map(CategoryMapper.fromDb)
        .toList();
  }

  // =========================================================
  // Insert Category
  // =========================================================

  @override
  Future<int> insertCategory(CategoryModel model) {
    final companion = CategoryMapper.toInsertCompanion(model);

    return dao.insertCategory(companion);
  }

  // =========================================================
  // Update Category
  // =========================================================

  @override
  Future<bool> updateCategory(
    int id,
    CategoryModel model,
  ) async {
    if (id <= 0) {
      throw ArgumentError.value(id, 'id', 'Invalid category ID');
    }

    final exists = await dao.categoryExists(id);

    if (!exists) return false;

    final companion = CategoryMapper.toUpdateCompanion(model);

    final affectedRows = await dao.updateCategory(
      id,
      companion,
    );

    return affectedRows > 0;
  }

  // =========================================================
  // Delete Category
  // =========================================================

  @override
  Future<bool> deleteCategoryById(int id) async {
    if (id <= 0) return false;

    final exists = await dao.categoryExists(id);

    if (!exists) return false;

    final affectedRows = await dao.deleteCategoryById(id);

    return affectedRows > 0;
  }

  // =========================================================
  // Check Category Exists
  // =========================================================

  @override
  Future<bool> categoryExists(int id) {
    return dao.categoryExists(id);
  }

  // =========================================================
  // Check Children
  // =========================================================

  @override
  Future<bool> hasChildren(int id) {
    return dao.hasChildren(id);
  }

  // =========================================================
  // Count Products
  // =========================================================

  @override
  Future<int> countProducts(int categoryId) {
    return dao.countProducts(categoryId);
  }
}
