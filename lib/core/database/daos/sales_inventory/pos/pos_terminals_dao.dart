import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stores_table.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'pos_terminals_dao.g.dart';

@DriftAccessor(tables: [PosTerminals, Stores])
class PosTerminalsDao extends DatabaseAccessor<AppDatabase>
    with _$PosTerminalsDaoMixin {
  PosTerminalsDao(super.db);

  Future<List<PosTerminalDb>> getAllTerminals({
    int? storeId,
    bool activeOnly = false,
  }) {
    final query = select(posTerminals);
    if (storeId != null) {
      query.where((t) => t.storeId.equals(storeId));
    }
    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return query.get();
  }

  Stream<List<PosTerminalDb>> watchAllTerminals({
    int? storeId,
    bool activeOnly = false,
  }) {
    final query = select(posTerminals);
    if (storeId != null) {
      query.where((t) => t.storeId.equals(storeId));
    }
    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return query.watch();
  }

  Future<PosTerminalDb?> getTerminalById(int id) {
    return (select(posTerminals)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<PosTerminalDb?> getTerminalByCode(String code) {
    return (select(posTerminals)..where((t) => t.terminalCode.equals(code)))
        .getSingleOrNull();
  }

  Future<PosTerminalDb?> getTerminalByDeviceId(String deviceId) {
    return (select(posTerminals)..where((t) => t.deviceId.equals(deviceId)))
        .getSingleOrNull();
  }

  Future<int> insertTerminal(PosTerminalsCompanion terminal) async {
    final storeId = terminal.storeId.value;
    final store = await (select(stores)..where((t) => t.id.equals(storeId)))
        .getSingleOrNull();
    if (store == null) {
      throw StateError('المخزن المحدد غير موجود.');
    }
    return into(posTerminals).insert(terminal);
  }

  Future<bool> updateTerminal(PosTerminalDb terminal) async {
    final store = await (select(stores)
          ..where((t) => t.id.equals(terminal.storeId)))
        .getSingleOrNull();
    if (store == null) {
      throw StateError('المخزن المحدد غير موجود.');
    }

    return update(posTerminals).replace(
      terminal.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<int> setTerminalActive(int id, {required bool isActive}) {
    return (update(posTerminals)..where((t) => t.id.equals(id))).write(
      PosTerminalsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> setDefaultTerminal({
    required int storeId,
    required int terminalId,
  }) {
    return transaction(() async {
      final terminal = await (select(posTerminals)
            ..where((t) =>
                t.id.equals(terminalId) & t.storeId.equals(storeId)))
          .getSingleOrNull();

      if (terminal == null) {
        throw StateError('الجهاز غير موجود ضمن هذا المخزن.');
      }

      await (update(posTerminals)
            ..where((t) => t.storeId.equals(storeId)))
          .write(
        PosTerminalsCompanion(
          isDefault: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return (update(posTerminals)
            ..where((t) => t.id.equals(terminalId)))
          .write(
        PosTerminalsCompanion(
          isDefault: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  /// الحذف الفعلي يظل خاضعاً لقيود Foreign Key.
  /// يفضل تعطيل الجهاز بدلاً من حذفه بعد استخدامه.
  Future<int> deleteTerminal(int id) {
    return (delete(posTerminals)..where((t) => t.id.equals(id))).go();
  }
}
