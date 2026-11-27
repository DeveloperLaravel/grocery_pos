
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/finance/expense_categories_table.dart';


part 'expense_categories_dao.g.dart';

@DriftAccessor(tables: [ExpenseCategories])
class ExpenseCategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$ExpenseCategoriesDaoMixin {
  ExpenseCategoriesDao(super.db);

  // =====================================================
  // CREATE
  // =====================================================

  Future<int> insertCategory(
    ExpenseCategoriesCompanion entry,
  ) async {
    if (entry.parentId.present &&
        entry.parentId.value != null) {
      final parent = await getCategoryById(
        entry.parentId.value!,
      );

      if (parent == null) {
        throw StateError('Parent category not found.');
      }

      if (!parent.isActive) {
        throw StateError('Parent category is inactive.');
      }
    }

    return into(expenseCategories).insert(entry);
  }

  // =====================================================
  // UPDATE
  // =====================================================

  Future<bool> updateCategory(
    ExpenseCategoriesCompanion entry,
  ) async {
    if (!entry.id.present) {
      throw ArgumentError('Category ID is required.');
    }

    final id = entry.id.value;

    if (entry.parentId.present &&
        entry.parentId.value != null) {
      final parentId = entry.parentId.value!;

      if (id == parentId) {
        throw StateError(
          'A category cannot be its own parent.',
        );
      }

      final parent = await getCategoryById(parentId);

      if (parent == null || !parent.isActive) {
        throw StateError('Invalid parent category.');
      }

      // Prevent circular parent relationships.
      var current = parent;

      while (true) {
        if (current.id == id) {
          throw StateError(
            'Circular category relationship detected.',
          );
        }

        if (current.parentId == null) break;

        final next = await getCategoryById(
          current.parentId!,
        );

        if (next == null) break;

        current = next;
      }
    }

    return update(expenseCategories).replace(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // READ
  // =====================================================

  Future<ExpenseCategoryDb?> getCategoryById(int id) {
    return (select(expenseCategories)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<ExpenseCategoryDb>> getAllCategories() {
    return (select(expenseCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Future<List<ExpenseCategoryDb>> getActiveCategories() {
    return (select(expenseCategories)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // PARENT CATEGORIES
  // =====================================================

  Future<List<ExpenseCategoryDb>> getParentCategories() {
    return (select(expenseCategories)
          ..where(
            (t) =>
                t.parentId.isNull() &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
          ]))
        .get();
  }

  // =====================================================
  // CHILD CATEGORIES
  // =====================================================

  Future<List<ExpenseCategoryDb>> getChildCategories(
    int parentId,
  ) {
    return (select(expenseCategories)
          ..where(
            (t) =>
                t.parentId.equals(parentId) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // WATCH
  // =====================================================

  Stream<List<ExpenseCategoryDb>> watchAllCategories() {
    return (select(expenseCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  Stream<List<ExpenseCategoryDb>> watchActiveCategories() {
    return (select(expenseCategories)
          ..where((t) => t.isActive.equals(true)))
        .watch();
  }

  Stream<List<ExpenseCategoryDb>> watchChildCategories(
    int parentId,
  ) {
    return (select(expenseCategories)
          ..where(
            (t) =>
                t.parentId.equals(parentId) &
                t.isActive.equals(true),
          ))
        .watch();
  }

  // =====================================================
  // SEARCH
  // =====================================================

  Future<List<ExpenseCategoryDb>> searchCategories(
    String keyword,
  ) {
    final search = '%${keyword.trim()}%';

    return (select(expenseCategories)
          ..where(
            (t) =>
                t.name.like(search) |
                t.code.like(search),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // VALIDATION
  // =====================================================

  Future<bool> isCodeExists(
    String code, {
    int? excludeId,
  }) async {
    final query = select(expenseCategories);

    query.where(
      (t) => excludeId == null
          ? t.code.equals(code)
          : t.code.equals(code) &
              t.id.equals(excludeId).not(),
    );

    return (await query.getSingleOrNull()) != null;
  }

  // =====================================================
  // ACTIVATE / DEACTIVATE
  // =====================================================

  Future<int> activateCategory(int id) {
    return (update(expenseCategories)
          ..where((t) => t.id.equals(id)))
        .write(
      ExpenseCategoriesCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deactivateCategory(int id) async {
    final category = await getCategoryById(id);

    if (category == null) return 0;

    final children = await getChildCategories(id);

    if (children.isNotEmpty) {
      throw StateError(
        'Deactivate child categories first.',
      );
    }

    return (update(expenseCategories)
          ..where((t) => t.id.equals(id)))
        .write(
      ExpenseCategoriesCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // DELETE
  // =====================================================

  Future<int> deleteCategory(int id) async {
    final children = await (select(expenseCategories)
          ..where((t) => t.parentId.equals(id)))
        .get();

    if (children.isNotEmpty) {
      throw StateError(
        'Cannot delete category with child categories.',
      );
    }

    return (delete(expenseCategories)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =====================================================
  // COUNT
  // =====================================================

  Future<int> countCategories() async {
    final count = expenseCategories.id.count();

    final query = selectOnly(expenseCategories)
      ..addColumns([count]);

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }
}
