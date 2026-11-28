
import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/system/number_sequences_table.dart';


part 'number_sequences_dao.g.dart';

@DriftAccessor(tables: [NumberSequences])
class NumberSequencesDao extends DatabaseAccessor<AppDatabase>
    with _$NumberSequencesDaoMixin {
  NumberSequencesDao(super.db);

  // إضافة تسلسل جديد
  Future<int> insertSequence(
    NumberSequencesCompanion data,
  ) {
    return into(numberSequences).insert(data);
  }

  // جميع التسلسلات
  Future<List<NumberSequenceDb>> getAllSequences() {
    return (select(numberSequences)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  // مراقبة التسلسلات
  Stream<List<NumberSequenceDb>> watchAllSequences() {
    return (select(numberSequences)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  // البحث بالمفتاح
  Future<NumberSequenceDb?> getByKey(String key) {
    return (select(numberSequences)
          ..where((t) => t.sequenceKey.equals(key)))
        .getSingleOrNull();
  }

  // تحديث التسلسل
  Future<bool> updateSequence(
    NumberSequenceDb data,
  ) async {
    final rows = await (update(numberSequences)
          ..where((t) => t.id.equals(data.id)))
        .write(
      NumberSequencesCompanion(
        name: Value(data.name),
        prefix: Value(data.prefix),
        suffix: Value(data.suffix),
        currentValue: Value(data.currentValue),
        paddingLength: Value(data.paddingLength),
        startValue: Value(data.startValue),
        incrementBy: Value(data.incrementBy),
        isActive: Value(data.isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // إنشاء الرقم التالي بشكل ذري
  Future<String> generateNextNumber(String key) {
    return transaction(() async {
      final sequence = await (select(numberSequences)
            ..where((t) => t.sequenceKey.equals(key)))
          .getSingleOrNull();

      if (sequence == null) {
        throw StateError('Sequence not found: $key');
      }

      if (!sequence.isActive) {
        throw StateError('Sequence is inactive: $key');
      }

      if (sequence.incrementBy <= 0 ||
          sequence.paddingLength < 0) {
        throw StateError('Invalid sequence configuration: $key');
      }

      final nextValue = sequence.currentValue == 0
          ? sequence.startValue
          : sequence.currentValue + sequence.incrementBy;

      await (update(numberSequences)
            ..where((t) => t.id.equals(sequence.id)))
          .write(
        NumberSequencesCompanion(
          currentValue: Value(nextValue),
          lastGeneratedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );

      final number = nextValue
          .toString()
          .padLeft(sequence.paddingLength, '0');

      return '${sequence.prefix ?? ''}'
          '$number'
          '${sequence.suffix ?? ''}';
    });
  }

  // تفعيل / تعطيل
  Future<bool> setActive(int id, bool active) async {
    final rows = await (update(numberSequences)
          ..where((t) => t.id.equals(id)))
        .write(
      NumberSequencesCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // إعادة ضبط العداد
  Future<bool> resetSequence(int id) async {
    final sequence = await (select(numberSequences)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    if (sequence == null) return false;
    if (sequence.incrementBy <= 0 || sequence.paddingLength < 0) {
      throw StateError(
        'Invalid sequence configuration: ${sequence.sequenceKey}',
      );
    }

    final rows = await (update(numberSequences)
          ..where((t) => t.id.equals(id)))
        .write(
      NumberSequencesCompanion(
        currentValue:
            Value(sequence.startValue - sequence.incrementBy),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // حذف التسلسل
  Future<int> deleteSequence(int id) {
    return (delete(numberSequences)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
