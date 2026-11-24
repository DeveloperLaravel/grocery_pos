
import '../entities/category.dart';

abstract interface class CategoryRepository {
  // Read
  Future<List<Category>> getAllCategories();

  Stream<List<Category>> watchAllCategories();

  Future<Category?> getCategoryById(int id);

  Future<List<Category>> getCategoriesByParentId(int? parentId);

  Stream<List<Category>> watchCategoriesByParentId(
    int? parentId,
  );

  Future<List<Category>> searchCategories(String keyword);

  Future<List<Category>> getActiveCategories();

  // Write
  Future<int> addCategory(Category category);

  Future<bool> updateCategory(Category category);

  Future<bool> deleteCategory(int id);

  // Validation
  Future<bool> categoryExists(int id);

  Future<bool> hasChildren(int id);

  Future<int> countProducts(int categoryId);
}
