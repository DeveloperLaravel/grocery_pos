
import 'package:drift/drift.dart';

@DataClassName('SupplierDb')
class Suppliers extends Table {
  // =====================================================
  // 1. Primary Key & Code
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // Example: SUP-000001
  TextColumn get supplierCode => text()
      .nullable()
      .unique()
      .withLength(max: 30)();

  // individual / company / government
  TextColumn get supplierType =>
      text().withDefault(const Constant('company'))();

  // =====================================================
  // 2. Basic Information
  // =====================================================

  TextColumn get name => text()
      .withLength(min: 1, max: 150)();

  TextColumn get companyName => text()
      .nullable()
      .withLength(max: 200)();

  TextColumn get contactPerson => text()
      .nullable()
      .withLength(max: 150)();

  TextColumn get imagePath => text().nullable()();

  // =====================================================
  // 3. Contact Information
  // =====================================================

  TextColumn get phone => text()
      .nullable()
      .withLength(max: 30)();

  TextColumn get secondaryPhone => text()
      .nullable()
      .withLength(max: 30)();

  TextColumn get whatsapp => text()
      .nullable()
      .withLength(max: 30)();

  TextColumn get email => text()
      .nullable()
      .withLength(max: 150)();

  TextColumn get website => text()
      .nullable()
      .withLength(max: 255)();

  // =====================================================
  // 4. Legal Information
  // =====================================================

  TextColumn get nationalId => text()
      .nullable()
      .withLength(max: 50)();

  TextColumn get taxNumber => text()
      .nullable()
      .withLength(max: 50)();

  TextColumn get commercialRegister => text()
      .nullable()
      .withLength(max: 50)();

  // =====================================================
  // 5. Address Information
  // =====================================================

  TextColumn get address => text().nullable()();

  TextColumn get country => text()
      .nullable()
      .withLength(max: 100)();

  TextColumn get city => text()
      .nullable()
      .withLength(max: 100)();

  TextColumn get region => text()
      .nullable()
      .withLength(max: 100)();

  TextColumn get street => text()
      .nullable()
      .withLength(max: 200)();

  TextColumn get buildingNumber => text()
      .nullable()
      .withLength(max: 50)();

  TextColumn get postalCode => text()
      .nullable()
      .withLength(max: 20)();

  TextColumn get billingAddress => text().nullable()();

  TextColumn get shippingAddress => text().nullable()();

  // =====================================================
  // 6. Supplier Classification
  // =====================================================

  // manufacturer / wholesaler / distributor /
  // importer / service_provider / other
  TextColumn get supplierCategory =>
      text().withDefault(const Constant('wholesaler'))();

  // normal / preferred / strategic
  TextColumn get supplierLevel =>
      text().withDefault(const Constant('normal'))();

  // Rating: 0 - 5
  RealColumn get rating =>
      real().withDefault(const Constant(0.0))();

  BoolColumn get isPreferred =>
      boolean().withDefault(const Constant(false))();

  // =====================================================
  // 7. Financial Information
  // =====================================================

  // Whether supplier allows us to buy on credit
  BoolColumn get allowCredit =>
      boolean().withDefault(const Constant(true))();

  // Maximum credit offered by supplier
  RealColumn get creditLimit =>
      real().withDefault(const Constant(0.0))();

  // Opening balance owed to supplier
  RealColumn get openingBalance =>
      real().withDefault(const Constant(0.0))();

  // Current outstanding balance
  RealColumn get currentBalance =>
      real().withDefault(const Constant(0.0))();

  // Payment due period in days
  IntColumn get paymentTermsDays =>
      integer().withDefault(const Constant(0))();

  // cash / bank_transfer / cheque / card
  TextColumn get preferredPaymentMethod =>
      text().withDefault(const Constant('bank_transfer'))();

  // =====================================================
  // 8. Banking Information
  // =====================================================

  TextColumn get bankName =>
      text().nullable()();

  TextColumn get bankBranch =>
      text().nullable()();

  TextColumn get bankAccountName =>
      text().nullable()();

  TextColumn get bankAccountNumber =>
      text().nullable()();

  TextColumn get iban =>
      text().nullable()();

  TextColumn get swiftCode =>
      text().nullable()();

  // =====================================================
  // 9. Supplier Activity
  // =====================================================

  DateTimeColumn get lastPurchaseAt =>
      dateTime().nullable()();

  DateTimeColumn get lastPaymentAt =>
      dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // =====================================================
  // 10. Notes
  // =====================================================

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 11. Timestamps
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // =====================================================
  // Primary Key
  // =====================================================


}
