
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/cash_registers_table.dart';

part 'cash_registers_dao.g.dart';

@DriftAccessor(tables: [CashRegisters])
class CashRegistersDao extends DatabaseAccessor<AppDatabase>
    with _$CashRegistersDaoMixin {
  CashRegistersDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<CashRegisterDb>> getAll() {
    return (select(cashRegisters)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<CashRegisterDb>> watchAll() {
    return (select(cashRegisters)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<CashRegisterDb?> getById(int id) {
    return (select(cashRegisters)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<CashRegisterDb?> watchById(int id) {
    return (select(cashRegisters)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Store
  // =====================================================

  Future<List<CashRegisterDb>> getByStoreId(int storeId) {
    return (select(cashRegisters)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<CashRegisterDb>> watchByStoreId(
    int storeId,
  ) {
    return (select(cashRegisters)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // Get By Terminal
  // =====================================================

  Future<List<CashRegisterDb>> getByTerminalId(
    int terminalId,
  ) {
    return (select(cashRegisters)
          ..where(
            (t) => t.terminalId.equals(terminalId),
          ))
        .get();
  }

  // =====================================================
  // Active Registers
  // =====================================================

  Future<List<CashRegisterDb>> getActiveByStoreId(
    int storeId,
  ) {
    return (select(cashRegisters)
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

  Future<List<CashRegisterDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(cashRegisters)
          ..where(
            (t) =>
                t.name.like(value) |
                t.code.like(value),
          ))
        .get();
  }

  // =====================================================
  // Create
  // =====================================================

  Future<int> create(CashRegistersCompanion data) {
    return into(cashRegisters).insert(data);
  }

  // =====================================================
  // Update
  // =====================================================

  Future<bool> updateById(
    int id,
    CashRegistersCompanion data,
  ) async {
    final count = await (update(cashRegisters)
          ..where((t) => t.id.equals(id)))
        .write(
      data.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return count > 0;
  }

  // =====================================================
  // Toggle Active
  // =====================================================

  Future<bool> setActive({
    required int id,
    required bool isActive,
  }) async {
    final count = await (update(cashRegisters)
          ..where((t) => t.id.equals(id)))
        .write(
      CashRegistersCompanion(
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
    final result = await (select(cashRegisters)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();

    return result != null;
  }

  // =====================================================
  // Delete
  // =====================================================

  Future<int> deleteById(int id) {
    return (delete(cashRegisters)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
