
import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../../../tables/master_data/parties/customers_table.dart';

part 'customers_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomersDao extends DatabaseAccessor<AppDatabase>
    with _$CustomersDaoMixin {
  CustomersDao(super.db);

  // =====================================================
  // 1. Insert
  // =====================================================

  Future<int> insertCustomer(CustomersCompanion customer) {
    return into(customers).insert(customer);
  }

  // =====================================================
  // 2. Update
  // =====================================================

  Future<int> updateCustomer({
    required int id,
    required CustomersCompanion customer,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      customer.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 3. Get All
  // =====================================================

  Future<List<CustomerDb>> getAllCustomers() {
    return (select(customers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Get Active Customers
  // =====================================================

  Future<List<CustomerDb>> getActiveCustomers() {
    return (select(customers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 5. Watch All Customers
  // =====================================================

  Stream<List<CustomerDb>> watchAllCustomers() {
    return (select(customers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 6. Watch Active Customers
  // =====================================================

  Stream<List<CustomerDb>> watchActiveCustomers() {
    return (select(customers)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // 7. Get Customer By ID
  // =====================================================

  Future<CustomerDb?> getCustomerById(int id) {
    return (select(customers)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 8. Watch Customer By ID
  // =====================================================

  Stream<CustomerDb?> watchCustomerById(int id) {
    return (select(customers)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // 9. Get Customer By Code
  // =====================================================

  Future<CustomerDb?> getCustomerByCode(String code) {
    return (select(customers)
          ..where((t) => t.customerCode.equals(code)))
        .getSingleOrNull();
  }

  // =====================================================
  // 10. Search Customers
  // =====================================================

  Future<List<CustomerDb>> searchCustomers(String query) {
    final value = query.trim();

    if (value.isEmpty) {
      return getAllCustomers();
    }

    final pattern = '%$value%';

    return (select(customers)
          ..where(
            (t) =>
                t.name.like(pattern) |
                t.customerCode.like(pattern) |
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

  Stream<List<CustomerDb>> watchSearchCustomers(String query) {
    final value = query.trim();

    final queryBuilder = select(customers);

    if (value.isNotEmpty) {
      final pattern = '%$value%';

      queryBuilder.where(
        (t) =>
            t.name.like(pattern) |
            t.customerCode.like(pattern) |
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
  // 12. Get Customers By Category
  // =====================================================

  Future<List<CustomerDb>> getCustomersByCategory(
    String category,
  ) {
    return (select(customers)
          ..where((t) => t.customerCategory.equals(category))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 13. Get Customers By Price Level
  // =====================================================

  Future<List<CustomerDb>> getCustomersByPriceLevel(
    String priceLevel,
  ) {
    return (select(customers)
          ..where((t) => t.priceLevel.equals(priceLevel))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // 14. Get Customers With Debt
  // =====================================================

  Future<List<CustomerDb>> getCustomersWithDebt() {
    return (select(customers)
          ..where((t) => t.currentBalance.isBiggerThanValue(0))
          ..orderBy([
            (t) => OrderingTerm.desc(t.currentBalance),
          ]))
        .get();
  }

  // =====================================================
  // 15. Get Customers Allowed Credit
  // =====================================================

  Future<List<CustomerDb>> getCreditCustomers() {
    return (select(customers)
          ..where(
            (t) =>
                t.allowCredit.equals(true) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // =====================================================
  // 16. Get Customers By Type
  // =====================================================

  Future<List<CustomerDb>> getCustomersByType(
    String customerType,
  ) {
    return (select(customers)
          ..where((t) => t.customerType.equals(customerType)))
        .get();
  }

  // =====================================================
  // 17. Pagination
  // =====================================================

  Future<List<CustomerDb>> getCustomersPaginated({
    required int limit,
    required int offset,
  }) {
    return (select(customers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  // =====================================================
  // 18. Update Balance
  // =====================================================

  Future<int> updateCustomerBalance({
    required int id,
    required double balance,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        currentBalance: Value(balance),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 19. Update Loyalty Points
  // =====================================================

  Future<int> updateLoyaltyPoints({
    required int id,
    required int points,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        loyaltyPoints: Value(points),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 20. Update Last Sale Date
  // =====================================================

  Future<int> updateLastSaleAt({
    required int id,
    required DateTime date,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        lastSaleAt: Value(date),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 21. Update Last Payment Date
  // =====================================================

  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        lastPaymentAt: Value(date),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 22. Toggle Active Status
  // =====================================================

  Future<int> toggleCustomerStatus({
    required int id,
    required bool isActive,
  }) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 23. Delete Customer
  // =====================================================

  // Physical deletion.
  // Use only if the customer has no linked financial records.
  Future<int> deleteCustomer(int id) {
    return (delete(customers)..where((t) => t.id.equals(id))).go();
  }

  // =====================================================
  // 24. Archive Customer
  // =====================================================

  Future<int> archiveCustomer(int id) {
    return toggleCustomerStatus(
      id: id,
      isActive: false,
    );
  }

  // =====================================================
  // 25. Count Customers
  // =====================================================

  Future<int> countCustomers() async {
    final countExpression = customers.id.count();

    final query = selectOnly(customers)
      ..addColumns([countExpression]);

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  // =====================================================
  // 26. Count Active Customers
  // =====================================================

  Future<int> countActiveCustomers() async {
    final countExpression = customers.id.count();

    final query = selectOnly(customers)
      ..addColumns([countExpression])
      ..where(customers.isActive.equals(true));

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  // =====================================================
  // 27. Get Total Outstanding Balance
  // =====================================================

  Future<double> getTotalCustomerBalance() async {
    final sumExpression = customers.currentBalance.sum();

    final query = selectOnly(customers)
      ..addColumns([sumExpression]);

    final result = await query.getSingle();

    return result.read(sumExpression) ?? 0.0;
  }

  // =====================================================
  // 28. Check Customer Code Exists
  // =====================================================

  Future<bool> customerCodeExists(
    String code, {
    int? excludeId,
  }) async {
    final query = select(customers)
      ..where((t) => t.customerCode.equals(code));

    if (excludeId != null) {
      query.where((t) => t.id.isNotValue(excludeId));
    }

    final result = await query.getSingleOrNull();

    return result != null;
  }
}
