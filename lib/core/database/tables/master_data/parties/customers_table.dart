
import 'package:drift/drift.dart';

@DataClassName('CustomerDb')
class Customers extends Table {
  // =====================================================
  // 1. Primary Key & Code
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // Example: CUS-000001
  TextColumn get customerCode => text()
      .nullable()
      .unique()
      .withLength(max: 30)();

  // individual / company / government
  TextColumn get customerType =>
      text().withDefault(const Constant('individual'))();

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
  // 6. Customer Classification
  // =====================================================

  // normal / vip / wholesale / retail
  TextColumn get customerCategory =>
      text().withDefault(const Constant('normal'))();

  // retail / wholesale
  TextColumn get priceLevel =>
      text().withDefault(const Constant('retail'))();

  // =====================================================
  // 7. Financial Information
  // =====================================================

  // Allow purchases on credit
  BoolColumn get allowCredit =>
      boolean().withDefault(const Constant(false))();

  // Maximum outstanding customer debt
  RealColumn get creditLimit =>
      real().withDefault(const Constant(0.0))();

  // Balance before system activation
  RealColumn get openingBalance =>
      real().withDefault(const Constant(0.0))();

  // Current outstanding balance
  RealColumn get currentBalance =>
      real().withDefault(const Constant(0.0))();

  // Payment due period in days
  IntColumn get paymentTermsDays =>
      integer().withDefault(const Constant(0))();

  // Discount percentage: 0 - 100
  RealColumn get defaultDiscount =>
      real().withDefault(const Constant(0.0))();

  // cash / card / bank_transfer / cheque
  TextColumn get preferredPaymentMethod =>
      text().withDefault(const Constant('cash'))();

  // =====================================================
  // 8. Loyalty Program
  // =====================================================

  IntColumn get loyaltyPoints =>
      integer().withDefault(const Constant(0))();

  // =====================================================
  // 9. Customer Activity
  // =====================================================

  DateTimeColumn get lastSaleAt =>
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

  @override
  Set<Column> get primaryKey => {id};
}
