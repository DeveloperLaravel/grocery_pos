import 'package:drift/drift.dart';

@DataClassName('ReferenceTestParentDb')
class ReferenceTestParents extends Table {
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName('ReferenceTestChildDb')
class ReferenceTestChildren extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get parentId => integer().references(
        ReferenceTestParents,
        #id,
      )();
}