import 'package:drift/drift.dart';

import 'cash_registers_table.dart';
import 'cashier_shifts_table.dart';

@DataClassName('CashMovementDb')
class CashMovements extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get shiftId => integer().references(
        CashierShifts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get registerId => integer().references(
        CashRegisters,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Movement Information
  TextColumn get movementNumber => text()
      .withLength(min: 1, max: 40)
      .unique()();

  // cash_in / cash_out

  TextColumn get movementType => text()();

  // sale / customer_payment / cash_in / cash_out
  // expense / refund / adjustment

  // Amount
  RealColumn get amount =>
      real()();

  // Reason
  TextColumn get reason => text()
      .withLength(min: 1, max: 250)();

  TextColumn get description => text().nullable()();

  // Reference
  TextColumn get referenceType => text().nullable()();

  IntColumn get referenceId => integer().nullable()();

  // For example:
  // referenceType = sale
  // referenceId = sale.id

  // Payment Method
  TextColumn get paymentMethod => text()
      .withDefault(const Constant('cash'))();

  // cash / card / bank_transfer / other

  // Employee
  IntColumn get createdBy => integer().nullable()();

  // Transaction Date
  DateTimeColumn get movementDate =>
      dateTime().withDefault(currentDateAndTime)();

  // Status
  TextColumn get status => text()
      .withDefault(const Constant('completed'))();

  // completed / cancelled

  // Cancellation
  IntColumn get cancelledBy => integer().nullable()();

  DateTimeColumn get cancelledAt => dateTime().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}