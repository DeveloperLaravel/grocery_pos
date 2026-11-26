
import 'package:drift/drift.dart';

@DataClassName('SaleDb')
class Sales extends Table {
  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Invoice information
  TextColumn get invoiceNumber => text().unique()();

  // Financial information
  RealColumn get subtotal => real()();

  RealColumn get discount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total => real()();

  RealColumn get paidAmount =>
      real().withDefault(const Constant(0.0))();

  // Payment method
  TextColumn get paymentMethod =>
      text().withDefault(const Constant('cash'))();

  // Payment status: paid, partial, unpaid
  TextColumn get paymentStatus =>
      text().withDefault(const Constant('unpaid'))();

  // Invoice status: completed, cancelled
  TextColumn get status =>
      text().withDefault(const Constant('completed'))();

  // Cancellation information
  DateTimeColumn get cancelledAt => dateTime().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  // Timestamp
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (subtotal >= 0)',
        'CHECK (discount >= 0)',
        'CHECK (total >= 0)',
        'CHECK (paidAmount >= 0)',
        "CHECK (paymentStatus IN ('paid', 'partial', 'unpaid'))",
        "CHECK (status IN ('completed', 'cancelled'))",
      ];
}
