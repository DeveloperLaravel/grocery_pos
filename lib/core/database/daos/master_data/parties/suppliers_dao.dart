
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/suppliers_table.dart';

part 'suppliers_dao.g.dart';

@DriftAccessor(tables: [Suppliers])
class SuppliersDao extends DatabaseAccessor<AppDatabase>
    with _$SuppliersDaoMixin {
  SuppliersDao(super.db);

  // CREATE
  Future<int> insertSupplier(
    SuppliersCompanion companion,
  ) {
    return into(suppliers).insert(companion);
  }

  // UPDATE
  Future<int> updateSupplier(
    int id,
    SuppliersCompanion companion,
  ) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      companion.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // GET BY ID
  Future<SupplierDb?> getSupplierById(int id) {
    return (select(suppliers)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // WATCH BY ID
  Stream<SupplierDb?> watchSupplierById(int id) {
    return (select(suppliers)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // GET BY CODE
  Future<SupplierDb?> getSupplierByCode(String code) {
    return (select(suppliers)
          ..where(
            (t) => t.supplierCode.equals(code.trim()),
          ))
        .getSingleOrNull();
  }

  // GET ALL
  Future<List<SupplierDb>> getAllSuppliers() {
    return (select(suppliers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // WATCH ALL
  Stream<List<SupplierDb>> watchAllSuppliers() {
    return (select(suppliers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // GET ACTIVE
  Future<List<SupplierDb>> getActiveSuppliers() {
    return (select(suppliers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // WATCH ACTIVE
  Stream<List<SupplierDb>> watchActiveSuppliers() {
    return (select(suppliers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // SEARCH
  Future<List<SupplierDb>> searchSuppliers(
    String keyword,
  ) {
    final value = keyword.trim();
    final query = select(suppliers);

    if (value.isNotEmpty) {
      final pattern = '%$value%';

      query.where(
        (t) =>
            t.name.like(pattern) |
            t.supplierCode.like(pattern) |
            t.phone.like(pattern) |
            t.secondaryPhone.like(pattern) |
            t.whatsapp.like(pattern) |
            t.email.like(pattern) |
            t.companyName.like(pattern) |
            t.contactPerson.like(pattern),
      );
    }

    query.orderBy([
      (t) => OrderingTerm.asc(t.name),
    ]);

    return query.get();
  }

  // CHECK CODE
  Future<bool> isSupplierCodeExists(
    String code, {
    int? excludedId,
  }) async {
    final query = select(suppliers)
      ..where(
        (t) => t.supplierCode.equals(code.trim()),
      );

    if (excludedId != null) {
      query.where(
        (t) => t.id.isNotValue(excludedId),
      );
    }

    return await query.getSingleOrNull() != null;
  }

  // ACTIVATE
  Future<int> activateSupplier(int id) {
    return _changeStatus(id, true);
  }

  // DEACTIVATE
  Future<int> deactivateSupplier(int id) {
    return _changeStatus(id, false);
  }

  // CHANGE STATUS
  Future<int> _changeStatus(
    int id,
    bool status,
  ) {
    return (update(suppliers)
          ..where((t) => t.id.equals(id)))
        .write(
      SuppliersCompanion(
        isActive: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // DELETE
  Future<int> deleteSupplierPermanently(int id) {
    return (delete(suppliers)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // COUNT
  Future<int> getSuppliersCount({
    bool activeOnly = false,
  }) async {
    final count = suppliers.id.count();

    final query = selectOnly(suppliers)
      ..addColumns([count]);

    if (activeOnly) {
      query.where(
        suppliers.isActive.equals(true),
      );
    }

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }
}
