
import 'package:drift/drift.dart';

@DataClassName('SaleDb')
class Sales extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Invoice Information
  TextColumn get invoiceNumber => text().unique()();

  // Financial Information
  RealColumn get subtotal => real()();

  RealColumn get discount => real().withDefault(
        const Constant(0.0),
      )();

  RealColumn get total => real()();

  RealColumn get paidAmount => real().withDefault(
        const Constant(0.0),
      )();

  // Payment Information
  TextColumn get paymentMethod => text().withDefault(
        const Constant('cash'),
      )();

  // Timestamp
  DateTimeColumn get createdAt => dateTime().withDefault(
        currentDateAndTime,
      )();
}
