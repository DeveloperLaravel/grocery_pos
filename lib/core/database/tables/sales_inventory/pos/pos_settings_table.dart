import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/inventory/stores_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('PosSettingDb')
class PosSettings extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get terminalId => integer()
      .unique()
      .references(
        PosTerminals,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // General Settings
  TextColumn get currencyCode => text()
      .withDefault(const Constant('LYD'))();

  TextColumn get currencySymbol => text()
      .withDefault(const Constant('د.ل'))();

  // Receipt Settings
  TextColumn get receiptFormat => text()
      .withDefault(const Constant('thermal80'))();

  // thermal58 / thermal80 / A4

  BoolColumn get autoPrintReceipt =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get printAfterPayment =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get showLogo =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get showBarcode =>
      boolean().withDefault(const Constant(true))();

  // Sales Settings
  BoolColumn get confirmBeforeSale =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get allowNegativeStock =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get allowPriceEdit =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get allowDiscount =>
      boolean().withDefault(const Constant(true))();

  RealColumn get maxDiscountPercent =>
      real().withDefault(const Constant(100))();

  BoolColumn get requireCustomer =>
      boolean().withDefault(const Constant(false))();

  // Shift Settings
  BoolColumn get requireOpenShift =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get requireClosingCount =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get allowMultipleShifts =>
      boolean().withDefault(const Constant(false))();

  // Held Sales
  BoolColumn get allowHeldSales =>
      boolean().withDefault(const Constant(true))();

  // Payment Settings
  TextColumn get defaultPaymentMethod => text()
      .withDefault(const Constant('cash'))();

  // Cash / card / bank_transfer

  BoolColumn get allowMixedPayments =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get allowCreditSales =>
      boolean().withDefault(const Constant(true))();

  // Barcode Settings
  BoolColumn get autoSearchBarcode =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get clearCartAfterSale =>
      boolean().withDefault(const Constant(true))();

  // Audit
  IntColumn get updatedBy => integer().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}