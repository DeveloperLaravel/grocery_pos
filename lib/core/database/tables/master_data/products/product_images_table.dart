
import 'package:drift/drift.dart';

import 'products_table.dart';

@DataClassName('ProductImageDb')
class ProductImages extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Local file path or remote image path
  TextColumn get imagePath => text().withLength(
        min: 1,
        max: 500,
      )();

  TextColumn get imageName => text().nullable()();

  BoolColumn get isPrimary =>
      boolean().withDefault(const Constant(false))();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (sortOrder >= 0)',
      ];
}