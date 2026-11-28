// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_sequences_dao.dart';

// ignore_for_file: type=lint
mixin _$NumberSequencesDaoMixin on DatabaseAccessor<AppDatabase> {
  $NumberSequencesTable get numberSequences => attachedDatabase.numberSequences;
  NumberSequencesDaoManager get managers => NumberSequencesDaoManager(this);
}

class NumberSequencesDaoManager {
  final _$NumberSequencesDaoMixin _db;
  NumberSequencesDaoManager(this._db);
  $$NumberSequencesTableTableManager get numberSequences =>
      $$NumberSequencesTableTableManager(
          _db.attachedDatabase, _db.numberSequences);
}
