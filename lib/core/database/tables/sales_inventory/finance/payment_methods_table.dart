
import 'package:drift/drift.dart';

@DataClassName('PaymentMethodDb')
class PaymentMethods extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Basic Information
  TextColumn get name => text().withLength(
        min: 1,
        max: 100,
      )();

  TextColumn get code => text()
      .withLength(min: 1, max: 30)
      .unique()();

  TextColumn get description => text().nullable()();

  // Payment Type
  TextColumn get type => text()
      .withDefault(const Constant('cash'))();

  // cash, card, bank_transfer, cheque, wallet, other

  // Additional Information
  TextColumn get accountName => text().nullable()();

  TextColumn get accountNumber => text().nullable()();

  TextColumn get bankName => text().nullable()();

  // Configuration
  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {code},
      ];
}
