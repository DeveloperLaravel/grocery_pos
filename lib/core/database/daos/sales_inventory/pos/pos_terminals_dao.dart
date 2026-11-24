
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'pos_terminals_dao.g.dart';

@DriftAccessor(tables: [PosTerminals])
class PosTerminalsDao extends DatabaseAccessor<AppDatabase>
    with _$PosTerminalsDaoMixin {
  PosTerminalsDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<PosTerminalDb>> getAll() {
    return (select(posTerminals)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<PosTerminalDb>> watchAll() {
    return (select(posTerminals)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<PosTerminalDb?> getById(int id) {
    return (select(posTerminals)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<PosTerminalDb?> watchById(int id) {
    return (select(posTerminals)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Store
  // =====================================================

  Future<List<PosTerminalDb>> getByStoreId(int storeId) {
    return (select(posTerminals)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<PosTerminalDb>> watchByStoreId(int storeId) {
    return (select(posTerminals)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Active Terminals
  // =====================================================

  Future<List<PosTerminalDb>> getActive() {
    return (select(posTerminals)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Future<List<PosTerminalDb>> getActiveByStoreId(
    int storeId,
  ) {
    return (select(posTerminals)
          ..where(
            (t) =>
                t.storeId.equals(storeId) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // =====================================================
  // Search
  // =====================================================

  Future<List<PosTerminalDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(posTerminals)
          ..where(
            (t) =>
                t.name.like(value) |
                t.code.like(value),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // Create
  // =====================================================

  Future<int> create(PosTerminalsCompanion data) {
    return into(posTerminals).insert(data);
  }

  // =====================================================
  // Update
  // =====================================================

  Future<bool> updateById(
    int id,
    PosTerminalsCompanion data,
  ) async {
    final count = await (update(posTerminals)
          ..where((t) => t.id.equals(id)))
        .write(data);

    return count > 0;
  }

  // =====================================================
  // Toggle Active
  // =====================================================

  Future<bool> setActive({
    required int id,
    required bool isActive,
  }) async {
    final count = await (update(posTerminals)
          ..where((t) => t.id.equals(id)))
        .write(
      PosTerminalsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return count > 0;
  }

  // =====================================================
  // Exists
  // =====================================================

  Future<bool> existsByCode(String code) async {
    final result = await (select(posTerminals)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();

    return result != null;
  }

  // =====================================================
  // Delete
  // =====================================================

  Future<int> deleteById(int id) {
    return (delete(posTerminals)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
