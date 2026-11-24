
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/brands_table.dart';


part 'brands_dao.g.dart';

@DriftAccessor(tables: [Brands])
class BrandsDao extends DatabaseAccessor<AppDatabase>
    with _$BrandsDaoMixin {
  BrandsDao(super.db);

  // Get All
  Future<List<BrandDb>> getAllBrands() {
    return (select(brands)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // Watch All
  Stream<List<BrandDb>> watchAllBrands() {
    return (select(brands)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // Get Active
  Future<List<BrandDb>> getActiveBrands() {
    return (select(brands)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // Watch Active
  Stream<List<BrandDb>> watchActiveBrands() {
    return (select(brands)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // Get By ID
  Future<BrandDb?> getBrandById(int id) {
    return (select(brands)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Watch By ID
  Stream<BrandDb?> watchBrandById(int id) {
    return (select(brands)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // Search
  Future<List<BrandDb>> searchBrands(String query) {
    final value = query.trim();

    if (value.isEmpty) return getAllBrands();

    return (select(brands)
          ..where((t) => t.name.like('%$value%'))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // Watch Search
  Stream<List<BrandDb>> watchSearchBrands(String query) {
    final value = query.trim();

    final statement = select(brands);

    if (value.isNotEmpty) {
      statement.where((t) => t.name.like('%$value%'));
    }

    statement.orderBy([
      (t) => OrderingTerm.asc(t.name),
    ]);

    return statement.watch();
  }

  // Insert
  Future<int> insertBrand(BrandsCompanion companion) {
    return into(brands).insert(companion);
  }

  // Update By ID
  Future<int> updateBrand(
    int id,
    BrandsCompanion companion,
  ) {
    return (update(brands)..where((t) => t.id.equals(id))).write(
      companion.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Delete
  Future<int> deleteBrand(int id) {
    return (delete(brands)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Activate
  Future<int> activateBrand(int id) {
    return _changeStatus(id, true);
  }

  // Deactivate
  Future<int> deactivateBrand(int id) {
    return _changeStatus(id, false);
  }

  Future<int> _changeStatus(int id, bool status) {
    return (update(brands)..where((t) => t.id.equals(id))).write(
      BrandsCompanion(
        isActive: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Exists
  Future<bool> isNameExists(
    String name, {
    int? excludeId,
  }) async {
    final query = select(brands)
      ..where((t) => t.name.equals(name.trim()));

    if (excludeId != null) {
      query.where((t) => t.id.isNotValue(excludeId));
    }

    return (await query.getSingleOrNull()) != null;
  }

  // Count
  Future<int> getBrandsCount({bool activeOnly = false}) async {
    final count = brands.id.count();

    final query = selectOnly(brands)..addColumns([count]);

    if (activeOnly) {
      query.where(brands.isActive.equals(true));
    }

    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }
}
