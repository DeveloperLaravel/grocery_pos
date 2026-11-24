
import 'package:drift/drift.dart';

import '../../../inventory/stores_table.dart';
import '../../../master_data/parties/customers_table.dart';
import '../../../master_data/parties/suppliers_table.dart';
import '../../purchases/purchase_receipts_table.dart';
import '../../sales/sales_table.dart';

@DataClassName('ReturnDb')
class Returns extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Return type: sales_return / purchase_return
  TextColumn get returnType => text().withLength(
        min: 1,
        max: 30,
      )();

  // Original document
  IntColumn get saleId => integer()
      .nullable()
      .references(Sales, #id)();

  IntColumn get purchaseReceiptId => integer()
      .nullable()
      .references(PurchaseReceipts, #id)();

  // Customer or Supplier
  IntColumn get customerId => integer()
      .nullable()
      .references(Customers, #id)();

  IntColumn get supplierId => integer()
      .nullable()
      .references(Suppliers, #id)();

  // Store receiving or sending returned goods
  IntColumn get storeId => integer()
      .references(Stores, #id)();

  TextColumn get returnNumber =>
      text().withLength(min: 1, max: 50)();

  DateTimeColumn get returnDate => dateTime()();

  // draft / posted / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  RealColumn get subtotal =>
      real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get totalAmount =>
      real().withDefault(const Constant(0))();

  TextColumn get reason => text().nullable()();

  TextColumn get notes => text().nullable()();

  IntColumn get createdBy => integer().nullable()();

  IntColumn get postedBy => integer().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK ('
    '(returnType = \'sales_return\' AND saleId IS NOT NULL '
    'AND purchaseReceiptId IS NULL AND customerId IS NOT NULL '
    'AND supplierId IS NULL) OR '
    '(returnType = \'purchase_return\' AND purchaseReceiptId IS NOT NULL '
    'AND saleId IS NULL AND supplierId IS NOT NULL '
    'AND customerId IS NULL)'
    ')',
    'CHECK (status IN (\'draft\', \'posted\', \'cancelled\'))',
    'CHECK (subtotal >= 0)',
    'CHECK (discountAmount >= 0)',
    'CHECK (taxAmount >= 0)',
    'CHECK (totalAmount >= 0)',
  ];
}
