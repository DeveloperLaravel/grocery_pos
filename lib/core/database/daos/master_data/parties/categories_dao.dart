
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/categories_table.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  // =========================================================
  // Get All Categories
  // =========================================================

  Future<List<CategoryDb>> getAllCategories() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =========================================================
  // Watch All Categories
  // =========================================================

  Stream<List<CategoryDb>> watchAllCategories() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =========================================================
  // Get Category By ID
  // =========================================================

  Future<CategoryDb?> getCategoryById(int id) {
    return (select(categories)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =========================================================
  // Get Categories By Parent ID
  // =========================================================

  Future<List<CategoryDb>> getCategoriesByParentId(
    int? parentId,
  ) {
    final query = select(categories);

    if (parentId == null) {
      query.where((t) => t.parentId.isNull());
    } else {
      query.where((t) => t.parentId.equals(parentId));
    }

    query.orderBy([
      (t) => OrderingTerm.asc(t.sortOrder),
      (t) => OrderingTerm.asc(t.name),
    ]);

    return query.get();
  }

  // =========================================================
  // Watch Categories By Parent ID
  // =========================================================

  Stream<List<CategoryDb>> watchCategoriesByParentId(
    int? parentId,
  ) {
    final query = select(categories);

    if (parentId == null) {
      query.where((t) => t.parentId.isNull());
    } else {
      query.where((t) => t.parentId.equals(parentId));
    }

    query.orderBy([
      (t) => OrderingTerm.asc(t.sortOrder),
      (t) => OrderingTerm.asc(t.name),
    ]);

    return query.watch();
  }

  // =========================================================
  // Search Categories
  // =========================================================

  Future<List<CategoryDb>> searchCategories(String keyword) {
    final query = select(categories)
      ..where(
        (t) => t.name.contains(keyword),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.name),
      ]);

    return query.get();
  }

  // =========================================================
  // Get Active Categories
  // =========================================================

  Future<List<CategoryDb>> getActiveCategories() {
    return (select(categories)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =========================================================
  // Insert Category
  // =========================================================

  Future<int> insertCategory(
    CategoriesCompanion companion,
  ) {
    return into(categories).insert(companion);
  }

  // =========================================================
  // Update Category
  // =========================================================

  Future<int> updateCategory(
    int id,
    CategoriesCompanion companion,
  ) {
    return (update(categories)
          ..where((t) => t.id.equals(id)))
        .write(companion);
  }

  // =========================================================
  // Delete Category
  // =========================================================

  Future<int> deleteCategoryById(int id) {
    return (delete(categories)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // Check Category Exists
  // =========================================================

  Future<bool> categoryExists(int id) async {
    final category = await getCategoryById(id);
    return category != null;
  }

  // =========================================================
  // Check Children
  // =========================================================

  Future<bool> hasChildren(int id) async {
    final query = select(categories)
      ..where((t) => t.parentId.equals(id))
      ..limit(1);

    return (await query.get()).isNotEmpty;
  }

  // =========================================================
  // Count Products In Category
  // =========================================================

  Future<int> countProducts(int categoryId) async {
    final query = customSelect(
      'SELECT COUNT(*) AS total '
      'FROM products WHERE category_id = ?',
      variables: [Variable.withInt(categoryId)],
      readsFrom: {},
    );

    final result = await query.getSingle();
    return result.read<int>('total');
  }
}
