
// import 'package:drift/drift.dart';

// import 'returns_table.dart';

// @DataClassName('ReturnPaymentDb')
// class ReturnPayments extends Table {
//   IntColumn get id => integer().autoIncrement()();

//   IntColumn get returnId => integer().references(
//         Returns,
//         #id,
//         onDelete: KeyAction.restrict,
//       )();

//   TextColumn get paymentMethod =>
//       text().withDefault(const Constant('cash'))();

//   RealColumn get amount => real()();

//   TextColumn get transactionReference => text().nullable()();

//   DateTimeColumn get refundDate =>
//       dateTime().withDefault(currentDateAndTime)();

//   TextColumn get notes => text().nullable()();

//   DateTimeColumn get createdAt =>
//       dateTime().withDefault(currentDateAndTime)();

//   @override
//   List<String> get customConstraints => [
//         'CHECK (amount > 0)',
//       ];
// }
