import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/customers_table.dart';



part 'customers_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomersDao extends DatabaseAccessor<AppDatabase>
    with _$CustomersDaoMixin {
  CustomersDao(super.db);

  // =====================================================
  // Insert
  // =====================================================

  Future<int> insertCustomer(
    CustomersCompanion companion,
  ) {
    return into(customers).insert(companion);
  }

  // =====================================================
  // Update
  // =====================================================

  Future<bool> updateCustomer(
    CustomersCompanion companion,
  ) {
    return update(customers).replace(
      CustomerDb(
        id: companion.id.value,
        customerCode: companion.customerCode.value,
        customerType: companion.customerType.value,
        name: companion.name.value,
        companyName: companion.companyName.value,
        contactPerson: companion.contactPerson.value,
        imagePath: companion.imagePath.value,
        phone: companion.phone.value,
        secondaryPhone: companion.secondaryPhone.value,
        whatsapp: companion.whatsapp.value,
        email: companion.email.value,
        website: companion.website.value,
        nationalId: companion.nationalId.value,
        taxNumber: companion.taxNumber.value,
        commercialRegister: companion.commercialRegister.value,
        address: companion.address.value,
        country: companion.country.value,
        city: companion.city.value,
        region: companion.region.value,
        street: companion.street.value,
        buildingNumber: companion.buildingNumber.value,
        postalCode: companion.postalCode.value,
        billingAddress: companion.billingAddress.value,
        shippingAddress: companion.shippingAddress.value,
        customerCategory: companion.customerCategory.value,
        priceLevel: companion.priceLevel.value,
        allowCredit: companion.allowCredit.value,
        creditLimit: companion.creditLimit.value,
        openingBalance: companion.openingBalance.value,
        paymentTermsDays: companion.paymentTermsDays.value,
        defaultDiscount: companion.defaultDiscount.value,
        preferredPaymentMethod:
            companion.preferredPaymentMethod.value,
        loyaltyPoints: companion.loyaltyPoints.value,
        lastPurchaseAt: companion.lastPurchaseAt.value,
        isActive: companion.isActive.value,
        notes: companion.notes.value,
        createdAt: companion.createdAt.value,
        updatedAt: companion.updatedAt.value,
      ),
    );
  }

  // =====================================================
  // Update By ID
  // =====================================================

  Future<int> updateCustomerById(
    int id,
    CustomersCompanion companion,
  ) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      companion.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // Get All
  // =====================================================

  Future<List<CustomerDb>> getAllCustomers() {
    return (select(customers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // Watch All
  // =====================================================

  Stream<List<CustomerDb>> watchAllCustomers() {
    return (select(customers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Get Active
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
  // Watch Active
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
  // Get By ID
  // =====================================================

  Future<CustomerDb?> getCustomerById(int id) {
    return (select(customers)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // Watch By ID
  // =====================================================

  Stream<CustomerDb?> watchCustomerById(int id) {
    return (select(customers)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Code
  // =====================================================

  Future<CustomerDb?> getCustomerByCode(String code) {
    return (select(customers)
          ..where((t) => t.customerCode.equals(code)))
        .getSingleOrNull();
  }

  // =====================================================
  // Search
  // =====================================================

  Future<List<CustomerDb>> searchCustomers(String query) {
    final value = '%${query.trim()}%';

    return (select(customers)
          ..where(
            (t) =>
                t.name.like(value) |
                t.customerCode.like(value) |
                t.phone.like(value) |
                t.secondaryPhone.like(value) |
                t.whatsapp.like(value) |
                t.email.like(value) |
                t.companyName.like(value) |
                t.contactPerson.like(value),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // Watch Search
  // =====================================================

  Stream<List<CustomerDb>> watchSearchCustomers(
    String query,
  ) {
    final value = '%${query.trim()}%';

    return (select(customers)
          ..where(
            (t) =>
                t.name.like(value) |
                t.customerCode.like(value) |
                t.phone.like(value) |
                t.secondaryPhone.like(value) |
                t.whatsapp.like(value) |
                t.email.like(value) |
                t.companyName.like(value) |
                t.contactPerson.like(value),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Check Code
  // =====================================================

  Future<bool> isCustomerCodeExists(
    String code, {
    int? excludedId,
  }) async {
    final query = select(customers)
      ..where((t) => t.customerCode.equals(code));

    if (excludedId != null) {
      query.where((t) => t.id.isNotValue(excludedId));
    }

    return (await query.getSingleOrNull()) != null;
  }

  // =====================================================
  // Soft Delete
  // =====================================================

  Future<int> deactivateCustomer(int id) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // Activate
  // =====================================================

  Future<int> activateCustomer(int id) {
    return (update(customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // Count
  // =====================================================

  Future<int> getCustomersCount() async {
    final count = customers.id.count();

    final query = selectOnly(customers)
      ..addColumns([count]);

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }

  // =====================================================
  // Active Count
  // =====================================================

  Future<int> getActiveCustomersCount() async {
    final count = customers.id.count();

    final query = selectOnly(customers)
      ..addColumns([count])
      ..where(customers.isActive.equals(true));

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }

  // =====================================================
  // Delete
  // =====================================================

  /// الحذف الفعلي متاح فقط عند الحاجة وبعد التأكد من
  /// عدم ارتباط العميل بفواتير أو سجلات أخرى.
  Future<int> deleteCustomerPermanently(int id) {
    return (delete(customers)..where((t) => t.id.equals(id))).go();
  }
}