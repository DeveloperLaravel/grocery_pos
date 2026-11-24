
import 'package:drift/drift.dart';

@DataClassName('SupplierDb')
class Suppliers extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Supplier Code
  TextColumn get supplierCode =>
      text().nullable().unique().withLength(max: 30)();

  // individual / company / government
  TextColumn get supplierType =>
      text().withDefault(const Constant('company'))();

  // Basic Information
  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  TextColumn get companyName =>
      text().nullable().withLength(max: 200)();

  TextColumn get contactPerson =>
      text().nullable().withLength(max: 150)();

  TextColumn get imagePath => text().nullable()();

  // Contact Information
  TextColumn get phone =>
      text().nullable().withLength(max: 30)();

  TextColumn get secondaryPhone =>
      text().nullable().withLength(max: 30)();

  TextColumn get whatsapp =>
      text().nullable().withLength(max: 30)();

  TextColumn get email =>
      text().nullable().withLength(max: 150)();

  TextColumn get website =>
      text().nullable().withLength(max: 255)();

  // Legal Information
  TextColumn get nationalId =>
      text().nullable().withLength(max: 50)();

  TextColumn get taxNumber =>
      text().nullable().withLength(max: 50)();

  TextColumn get commercialRegister =>
      text().nullable().withLength(max: 50)();

  // Address
  TextColumn get address => text().nullable()();

  TextColumn get country =>
      text().nullable().withLength(max: 100)();

  TextColumn get city =>
      text().nullable().withLength(max: 100)();

  TextColumn get region =>
      text().nullable().withLength(max: 100)();

  TextColumn get street =>
      text().nullable().withLength(max: 200)();

  TextColumn get buildingNumber =>
      text().nullable().withLength(max: 50)();

  TextColumn get postalCode =>
      text().nullable().withLength(max: 20)();

  TextColumn get billingAddress => text().nullable()();

  TextColumn get shippingAddress => text().nullable()();

  // Classification
  // manufacturer / wholesaler / distributor /
  // importer / service_provider / other
  TextColumn get supplierCategory =>
      text().withDefault(const Constant('wholesaler'))();

  // normal / preferred / strategic
  TextColumn get supplierLevel =>
      text().withDefault(const Constant('normal'))();

  RealColumn get rating =>
      real().withDefault(const Constant(0.0))();

  BoolColumn get isPreferred =>
      boolean().withDefault(const Constant(false))();

  // Financial Information
  BoolColumn get allowCredit =>
      boolean().withDefault(const Constant(true))();

  RealColumn get creditLimit =>
      real().withDefault(const Constant(0.0))();

  RealColumn get openingBalance =>
      real().withDefault(const Constant(0.0))();

  IntColumn get paymentTermsDays =>
      integer().withDefault(const Constant(0))();

  // cash / bank_transfer / cheque / card
  TextColumn get preferredPaymentMethod =>
      text().withDefault(const Constant('bank_transfer'))();

  // Banking
  TextColumn get bankName => text().nullable()();

  TextColumn get bankBranch => text().nullable()();

  TextColumn get bankAccountName => text().nullable()();

  TextColumn get bankAccountNumber => text().nullable()();

  TextColumn get iban => text().nullable()();

  TextColumn get swiftCode => text().nullable()();

  // Activity
  DateTimeColumn get lastPurchaseAt => dateTime().nullable()();

  DateTimeColumn get lastPaymentAt => dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  TextColumn get notes => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
