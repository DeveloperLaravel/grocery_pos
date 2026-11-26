
import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../../../tables/master_data/parties/suppliers_table.dart';

part 'suppliers_dao.g.dart';

@DriftAccessor(tables: [Suppliers])
class SuppliersDao extends DatabaseAccessor<AppDatabase>
    with _$SuppliersDaoMixin {
  SuppliersDao(super.db);

  // =====================================================
  // 1. Insert
  // =====================================================

  Future<int> insertSupplier(SuppliersCompanion supplier) {
    return into(suppliers).insert(supplier);
  }

  // =====================================================
  // 2. Update
  // =====================================================

  Future<int> updateSupplier({
    required int id,
    required SuppliersCompanion supplier,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      supplier.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 3. Get All Suppliers
  // =====================================================

  Future<List<SupplierDb>> getAllSuppliers() {
    return (select(suppliers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Get Active Suppliers
  // =====================================================

  Future<List<SupplierDb>> getActiveSuppliers() {
    return (select(suppliers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 5. Watch All Suppliers
  // =====================================================

  Stream<List<SupplierDb>> watchAllSuppliers() {
    return (select(suppliers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 6. Watch Active Suppliers
  // =====================================================

  Stream<List<SupplierDb>> watchActiveSuppliers() {
    return (select(suppliers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // 7. Get Supplier By ID
  // =====================================================

  Future<SupplierDb?> getSupplierById(int id) {
    return (select(suppliers)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 8. Watch Supplier By ID
  // =====================================================

  Stream<SupplierDb?> watchSupplierById(int id) {
    return (select(suppliers)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // 9. Get Supplier By Code
  // =====================================================

  Future<SupplierDb?> getSupplierByCode(String code) {
    return (select(suppliers)
          ..where((t) => t.supplierCode.equals(code)))
        .getSingleOrNull();
  }

  // =====================================================
  // 10. Search Suppliers
  // =====================================================

  Future<List<SupplierDb>> searchSuppliers(String query) {
    final value = query.trim();

    if (value.isEmpty) {
      return getAllSuppliers();
    }

    final pattern = '%$value%';

    return (select(suppliers)
          ..where(
            (t) =>
                t.name.like(pattern) |
                t.supplierCode.like(pattern) |
                t.phone.like(pattern) |
                t.secondaryPhone.like(pattern) |
                t.whatsapp.like(pattern) |
                t.email.like(pattern) |
                t.companyName.like(pattern) |
                t.contactPerson.like(pattern),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 11. Watch Search Results
  // =====================================================

  Stream<List<SupplierDb>> watchSearchSuppliers(String query) {
    final value = query.trim();

    final queryBuilder = select(suppliers);

    if (value.isNotEmpty) {
      final pattern = '%$value%';

      queryBuilder.where(
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

    queryBuilder.orderBy([
      (t) => OrderingTerm.asc(t.name),
    ]);

    return queryBuilder.watch();
  }

  // =====================================================
  // 12. Get Suppliers By Category
  // =====================================================

  Future<List<SupplierDb>> getSuppliersByCategory(
    String category,
  ) {
    return (select(suppliers)
          ..where((t) => t.supplierCategory.equals(category))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 13. Get Suppliers By Level
  // =====================================================

  Future<List<SupplierDb>> getSuppliersByLevel(
    String level,
  ) {
    return (select(suppliers)
          ..where((t) => t.supplierLevel.equals(level))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 14. Get Preferred Suppliers
  // =====================================================

  Future<List<SupplierDb>> getPreferredSuppliers() {
    return (select(suppliers)
          ..where(
            (t) =>
                t.isPreferred.equals(true) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.rating),
          ]))
        .get();
  }

  // =====================================================
  // 15. Get Suppliers With Debt
  // =====================================================

  Future<List<SupplierDb>> getSuppliersWithDebt() {
    return (select(suppliers)
          ..where((t) => t.currentBalance.isBiggerThanValue(0))
          ..orderBy([
            (t) => OrderingTerm.desc(t.currentBalance),
          ]))
        .get();
  }

  // =====================================================
  // 16. Get Suppliers Allowing Credit
  // =====================================================

  Future<List<SupplierDb>> getCreditSuppliers() {
    return (select(suppliers)
          ..where(
            (t) =>
                t.allowCredit.equals(true) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // =====================================================
  // 17. Get Suppliers By Type
  // =====================================================

  Future<List<SupplierDb>> getSuppliersByType(
    String supplierType,
  ) {
    return (select(suppliers)
          ..where((t) => t.supplierType.equals(supplierType)))
        .get();
  }

  // =====================================================
  // 18. Pagination
  // =====================================================

  Future<List<SupplierDb>> getSuppliersPaginated({
    required int limit,
    required int offset,
  }) {
    return (select(suppliers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  // =====================================================
  // 19. Update Balance
  // =====================================================

  Future<int> updateSupplierBalance({
    required int id,
    required double balance,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        currentBalance: Value(balance),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 20. Update Supplier Rating
  // =====================================================

  Future<int> updateSupplierRating({
    required int id,
    required double rating,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        rating: Value(rating),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 21. Toggle Preferred Status
  // =====================================================

  Future<int> togglePreferredStatus({
    required int id,
    required bool isPreferred,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        isPreferred: Value(isPreferred),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 22. Update Last Purchase Date
  // =====================================================

  Future<int> updateLastPurchaseAt({
    required int id,
    required DateTime date,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        lastPurchaseAt: Value(date),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 23. Update Last Payment Date
  // =====================================================

  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        lastPaymentAt: Value(date),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 24. Toggle Active Status
  // =====================================================

  Future<int> toggleSupplierStatus({
    required int id,
    required bool isActive,
  }) {
    return (update(suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 25. Delete Supplier
  // =====================================================

  // Physical deletion.
  // Use only if the supplier has no linked financial records.
  Future<int> deleteSupplier(int id) {
    return (delete(suppliers)..where((t) => t.id.equals(id))).go();
  }

  // =====================================================
  // 26. Archive Supplier
  // =====================================================

  Future<int> archiveSupplier(int id) {
    return toggleSupplierStatus(
      id: id,
      isActive: false,
    );
  }

  // =====================================================
  // 27. Count Suppliers
  // =====================================================

  Future<int> countSuppliers() async {
    final countExpression = suppliers.id.count();

    final query = selectOnly(suppliers)
      ..addColumns([countExpression]);

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  // =====================================================
  // 28. Count Active Suppliers
  // =====================================================

  Future<int> countActiveSuppliers() async {
    final countExpression = suppliers.id.count();

    final query = selectOnly(suppliers)
      ..addColumns([countExpression])
      ..where(suppliers.isActive.equals(true));

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  // =====================================================
  // 29. Get Total Outstanding Balance
  // =====================================================

  Future<double> getTotalSupplierBalance() async {
    final sumExpression = suppliers.currentBalance.sum();

    final query = selectOnly(suppliers)
      ..addColumns([sumExpression]);

    final result = await query.getSingle();

    return result.read(sumExpression) ?? 0.0;
  }

  // =====================================================
  // 30. Check Supplier Code Exists
  // =====================================================

  Future<bool> supplierCodeExists(
    String code, {
    int? excludeId,
  }) async {
    final query = select(suppliers)
      ..where((t) => t.supplierCode.equals(code));

    if (excludeId != null) {
      query.where((t) => t.id.isNotValue(excludeId));
    }

    final result = await query.getSingleOrNull();

    return result != null;
  }
}
