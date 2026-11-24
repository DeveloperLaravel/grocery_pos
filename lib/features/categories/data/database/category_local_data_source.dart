
import '../models/category_model.dart';

abstract interface class CategoryLocalDataSource {
  Future<List<CategoryModel>> getAllCategories();

  Stream<List<CategoryModel>> watchAllCategories();

  Future<CategoryModel?> getCategoryById(int id);

  Future<List<CategoryModel>> getCategoriesByParentId(
    int? parentId,
  );

  Stream<List<CategoryModel>> watchCategoriesByParentId(
    int? parentId,
  );

  Future<List<CategoryModel>> searchCategories(String keyword);

  Future<List<CategoryModel>> getActiveCategories();

  Future<int> insertCategory(CategoryModel model);

  Future<bool> updateCategory(
    int id,
    CategoryModel model,
  );

  Future<bool> deleteCategoryById(int id);

  Future<bool> categoryExists(int id);

  Future<bool> hasChildren(int id);

  Future<int> countProducts(int categoryId);
}
