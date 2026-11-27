
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stores_table.dart';

part 'stores_dao.g.dart';

@DriftAccessor(
  tables: [Stores],
)
class StoresDao extends DatabaseAccessor<AppDatabase>
    with _$StoresDaoMixin {
  StoresDao(super.db);

  // =====================================================
  // 1. Insert
  // =====================================================

  Future<int> insertStore(StoresCompanion store) {
    return into(stores).insert(store);
  }

  // =====================================================
  // 2. Update
  // =====================================================

  Future<bool> updateStore(StoreDb store) {
    if (store.id <= 0) {
      throw ArgumentError('رقم المخزن غير صالح.');
    }

    return update(stores).replace(
      store.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 3. Get All
  // =====================================================

  Future<List<StoreDb>> getAllStores() {
    return (select(stores)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Get Active Stores
  // =====================================================

  Future<List<StoreDb>> getActiveStores() {
    return (select(stores)
          ..where(
            (t) => t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 5. Get By ID
  // =====================================================

  Future<StoreDb?> getStoreById(int id) {
    if (id <= 0) {
      throw ArgumentError('رقم المخزن غير صالح.');
    }

    return (select(stores)
          ..where(
            (t) => t.id.equals(id),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // 6. Get Main Store
  // =====================================================

  Future<StoreDb?> getMainStore() {
    return (select(stores)
          ..where(
            (t) =>
                t.isMain.equals(true) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  // =====================================================
  // 7. Watch All
  // =====================================================

  Stream<List<StoreDb>> watchAllStores() {
    return (select(stores)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 8. Watch Active
  // =====================================================

  Stream<List<StoreDb>> watchActiveStores() {
    return (select(stores)
          ..where(
            (t) => t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // 9. Check Store Name
  // =====================================================

  Future<bool> storeNameExists(
    String name, {
    int? excludedId,
  }) async {
    final normalizedName = name.trim();

    if (normalizedName.isEmpty) {
      return false;
    }

    final countExpression = stores.id.count();

    final query = selectOnly(stores)
      ..addColumns([countExpression])
      ..where(
        stores.name.equals(normalizedName),
      );

    if (excludedId != null) {
      if (excludedId <= 0) {
        throw ArgumentError('رقم المخزن المستثنى غير صالح.');
      }

      query.where(
        stores.id.isNotValue(excludedId),
      );
    }

    final count = await query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();

    return count > 0;
  }

  // =====================================================
  // 10. Check Store Code
  // =====================================================

  Future<bool> storeCodeExists(
    String code, {
    int? excludedId,
  }) async {
    final normalizedCode = code.trim();

    if (normalizedCode.isEmpty) {
      return false;
    }

    final countExpression = stores.id.count();

    final query = selectOnly(stores)
      ..addColumns([countExpression])
      ..where(
        stores.storeCode.equals(normalizedCode),
      );

    if (excludedId != null) {
      if (excludedId <= 0) {
        throw ArgumentError('رقم المخزن المستثنى غير صالح.');
      }

      query.where(
        stores.id.isNotValue(excludedId),
      );
    }

    final count = await query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();

    return count > 0;
  }

  // =====================================================
  // 11. Deactivate
  // =====================================================

  Future<int> deactivateStore(int id) async {
    if (id <= 0) {
      throw ArgumentError('رقم المخزن غير صالح.');
    }

    final store = await getStoreById(id);

    if (store == null) {
      return 0;
    }

    if (store.isMain) {
      throw StateError(
        'لا يمكن تعطيل المخزن الرئيسي قبل تعيين مخزن رئيسي آخر.',
      );
    }

    return (update(stores)
          ..where(
            (t) => t.id.equals(id),
          ))
        .write(
      StoresCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 12. Activate
  // =====================================================

  Future<int> activateStore(int id) async {
    if (id <= 0) {
      throw ArgumentError('رقم المخزن غير صالح.');
    }

    return (update(stores)
          ..where(
            (t) => t.id.equals(id),
          ))
        .write(
      StoresCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 13. Set Main Store
  // =====================================================

  Future<void> setMainStore(int id) {
    if (id <= 0) {
      throw ArgumentError('رقم المخزن غير صالح.');
    }

    return transaction(() async {
      final target = await (select(stores)
            ..where(
              (t) =>
                  t.id.equals(id) &
                  t.isActive.equals(true),
            ))
          .getSingleOrNull();

      if (target == null) {
        throw StateError(
          'المخزن غير موجود أو غير مفعّل.',
        );
      }

      await update(stores).write(
        StoresCompanion(
          isMain: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(stores)
            ..where(
              (t) => t.id.equals(id),
            ))
          .write(
        StoresCompanion(
          isMain: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // 14. Count
  // =====================================================

  Future<int> countStores() async {
    final countExpression = stores.id.count();

    final query = selectOnly(stores)
      ..addColumns([countExpression]);

    return query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }

  Future<int> countActiveStores() async {
    final countExpression = stores.id.count();

    final query = selectOnly(stores)
      ..addColumns([countExpression])
      ..where(
        stores.isActive.equals(true),
      );

    return query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }
}
