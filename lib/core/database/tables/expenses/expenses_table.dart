
import 'package:drift/drift.dart';

import '../expense_categories_table.dart';
import '../sales_inventory/pos/cash_registers_table.dart';
import '../sales_inventory/pos/cashier_shifts_table.dart';

@DataClassName('ExpenseDb')
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get expenseNumber => text().unique()();

  IntColumn get categoryId => integer().references(
        ExpenseCategories,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get cashRegisterId => integer()
      .nullable()
      .references(
        CashRegisters,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get shiftId => integer()
      .nullable()
      .references(
        CashierShifts,
        #id,
        onDelete: KeyAction.setNull,
      )();

  RealColumn get amount => real()();

  TextColumn get paymentMethod =>
      text().withDefault(const Constant('cash'))();

  DateTimeColumn get description => dateTime().nullable()();

  DateTimeColumn get expenseDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get createdBy => integer().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
      ];
}
