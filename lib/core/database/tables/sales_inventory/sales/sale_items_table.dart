
import 'package:drift/drift.dart';
import 'package:grocery_pos/core/database/tables/master_data/products/products_table.dart';
import 'package:grocery_pos/core/database/tables/sales_inventory/sales/sales_table.dart';

import '../../master_data/products/product_units_table.dart';


@DataClassName('SaleItemDb')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // الفاتورة
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // المنتج
  IntColumn get productId => integer().references(
        Products,
        #id,
      )();

  // وحدة البيع المختارة
  IntColumn get productUnitId => integer()
      .nullable()
      .references(ProductUnits, #id)();

  // حفظ الاسم وقت البيع حتى لا يتغير تاريخياً
  TextColumn get productName => text()();

  TextColumn get unitName => text()();

  // الكمية بوحدة البيع
  RealColumn get quantity => real()();

  // معامل التحويل إلى الوحدة الأساسية
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  // الكمية الأساسية المخصومة من المخزون
  RealColumn get baseQuantity => real()();

  // السعر والتكلفة وقت البيع
  RealColumn get unitPrice => real()();

  RealColumn get costPrice => real().withDefault(
        const Constant(0),
      )();

  // الخصم
  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  // الضريبة
  RealColumn get taxRate =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  // إجمالي السطر بعد الخصم والضريبة
  RealColumn get totalAmount => real()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
