
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/cash_movements_table.dart';

part 'cash_movements_dao.g.dart';

@DriftAccessor(tables: [CashMovements])
class CashMovementsDao extends DatabaseAccessor<AppDatabase>
    with _$CashMovementsDaoMixin {
  CashMovementsDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<CashMovementDb>> getAll() {
    return (select(cashMovements)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Stream<List<CashMovementDb>> watchAll() {
    return (select(cashMovements)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<CashMovementDb?> getById(int id) {
    return (select(cashMovements)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // Get By Register
  // =====================================================

  Future<List<CashMovementDb>> getByRegisterId(
    int cashRegisterId,
  ) {
    return (select(cashMovements)
          ..where(
            (t) => t.cashRegisterId.equals(cashRegisterId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Stream<List<CashMovementDb>> watchByRegisterId(
    int cashRegisterId,
  ) {
    return (select(cashMovements)
          ..where(
            (t) => t.cashRegisterId.equals(cashRegisterId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get By Shift
  // =====================================================

  Future<List<CashMovementDb>> getByShiftId(
    int shiftId,
  ) {
    return (select(cashMovements)
          ..where((t) => t.shiftId.equals(shiftId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // Get By Type
  // =====================================================

  Future<List<CashMovementDb>> getByType(
    String type,
  ) {
    if (type != 'cash_in' && type != 'cash_out') {
      throw ArgumentError('نوع الحركة غير صحيح');
    }

    return (select(cashMovements)
          ..where((t) => t.type.equals(type))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // Create Movement
  // =====================================================

  Future<int> create(
    CashMovementsCompanion data,
  ) {
    return attachedDatabase.transaction(() async {
      if (!data.cashRegisterId.present ||
          !data.userId.present ||
          !data.type.present ||
          !data.amount.present) {
        throw ArgumentError(
          'بيانات الحركة النقدية غير مكتملة',
        );
      }

      if (data.amount.value <= 0) {
        throw ArgumentError(
          'يجب أن تكون قيمة الحركة أكبر من صفر',
        );
      }

      if (!['cash_in', 'cash_out'].contains(data.type.value)) {
        throw ArgumentError('نوع الحركة غير صحيح');
      }

      if (data.shiftId.present &&
          data.shiftId.value != null) {
        final shift = await (select(
          attachedDatabase.cashierShifts,
        )..where(
          (t) =>
              t.id.equals(data.shiftId.value!) &
              t.status.equals('open') &
              t.cashRegisterId.equals(
                data.cashRegisterId.value,
              ),
        )).getSingleOrNull();

        if (shift == null) {
          throw StateError(
            'الوردية غير مفتوحة أو لا تتبع هذا الصندوق',
          );
        }
      }

      return into(cashMovements).insert(data);
    });
  }

  // =====================================================
  // Totals By Register
  // =====================================================

  Future<({double cashIn, double cashOut, double balance})>
      getTotalsByRegister(int cashRegisterId) async {
    final movements = await getByRegisterId(cashRegisterId);

    var cashIn = 0.0;
    var cashOut = 0.0;

    for (final movement in movements) {
      if (movement.type == 'cash_in') {
        cashIn += movement.amount;
      } else if (movement.type == 'cash_out') {
        cashOut += movement.amount;
      }
    }

    return (
      cashIn: cashIn,
      cashOut: cashOut,
      balance: cashIn - cashOut,
    );
  }

  // =====================================================
  // Totals By Shift
  // =====================================================

  Future<({double cashIn, double cashOut})>
      getTotalsByShift(int shiftId) async {
    final movements = await getByShiftId(shiftId);

    var cashIn = 0.0;
    var cashOut = 0.0;

    for (final movement in movements) {
      if (movement.type == 'cash_in') {
        cashIn += movement.amount;
      } else if (movement.type == 'cash_out') {
        cashOut += movement.amount;
      }
    }

    return (
      cashIn: cashIn,
      cashOut: cashOut,
    );
  }

  // =====================================================
  // Search By Reference
  // =====================================================

  Future<List<CashMovementDb>> getByReference({
    required String referenceType,
    required int referenceId,
  }) {
    return (select(cashMovements)
          ..where(
            (t) =>
                t.referenceType.equals(referenceType) &
                t.referenceId.equals(referenceId),
          ))
        .get();
  }

  // =====================================================
  // Count
  // =====================================================

  Future<int> countByRegister(int cashRegisterId) async {
    final count = cashMovements.id.count();

    final query = selectOnly(cashMovements)
      ..addColumns([count])
      ..where(
        cashMovements.cashRegisterId.equals(cashRegisterId),
      );

    return await query.map((row) => row.read(count) ?? 0).getSingle();
  }
}
