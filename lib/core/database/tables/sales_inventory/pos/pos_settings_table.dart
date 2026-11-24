
import 'package:drift/drift.dart';

import '../../inventory/stores_table.dart';

@DataClassName('PosSettingDb')
class PosSettings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get storeId => integer()
      .nullable()
      .references(
        Stores,
        #id,
        onDelete: KeyAction.cascade,
      )();

  BoolColumn get allowNegativeStock =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get requireCustomer =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get allowDiscount =>
      boolean().withDefault(const Constant(true))();

  RealColumn get maxDiscountPercentage =>
      real().withDefault(const Constant(100.0))();

  BoolColumn get autoPrintReceipt =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get allowHeldSales =>
      boolean().withDefault(const Constant(true))();

  TextColumn get currencyCode =>
      text().withDefault(const Constant('LYD'))();

  TextColumn get currencySymbol =>
      text().withDefault(const Constant('د.ل'))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (max_discount_percentage >= 0 AND max_discount_percentage <= 100)',
      ];
}
