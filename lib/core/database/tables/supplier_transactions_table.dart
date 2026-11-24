import 'package:drift/drift.dart';

import 'master_data/parties/suppliers_table.dart';
import 'sales_inventory/purchases/purchase_orders_table.dart';

@DataClassName('SupplierTransactionDb')
class SupplierTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get supplierId => integer().references(
        Suppliers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get purchaseOrderId => integer()
      .nullable()
      .references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.setNull,
      )();

  TextColumn get transactionType =>
      text().withLength(min: 1, max: 50)();

  RealColumn get amount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get balanceAfter =>
      real().withDefault(const Constant(0.0))();

  TextColumn get referenceNumber => text().nullable()();

  TextColumn get description => text().nullable()();

  DateTimeColumn get transactionDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}