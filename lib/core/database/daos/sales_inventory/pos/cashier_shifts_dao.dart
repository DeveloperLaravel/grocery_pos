
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/cashier_shifts_table.dart';

part 'cashier_shifts_dao.g.dart';

@DriftAccessor(tables: [CashierShifts])
class CashierShiftsDao extends DatabaseAccessor<AppDatabase>
    with _$CashierShiftsDaoMixin {
  CashierShiftsDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<CashierShiftDb>> getAll() {
    return (select(cashierShifts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ]))
        .get();
  }

  Stream<List<CashierShiftDb>> watchAll() {
    return (select(cashierShifts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<CashierShiftDb?> getById(int id) {
    return (select(cashierShifts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<CashierShiftDb?> watchById(int id) {
    return (select(cashierShifts)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Register
  // =====================================================

  Future<List<CashierShiftDb>> getByRegisterId(
    int cashRegisterId,
  ) {
    return (select(cashierShifts)
          ..where(
            (t) => t.cashRegisterId.equals(cashRegisterId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ]))
        .get();
  }

  // =====================================================
  // Get By Cashier
  // =====================================================

  Future<List<CashierShiftDb>> getByCashierId(
    int cashierId,
  ) {
    return (select(cashierShifts)
          ..where(
            (t) => t.cashierId.equals(cashierId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ]))
        .get();
  }

  // =====================================================
  // Get Open Shifts
  // =====================================================

  Future<List<CashierShiftDb>> getOpenShifts() {
    return (select(cashierShifts)
          ..where((t) => t.status.equals('open'))
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ]))
        .get();
  }

  // =====================================================
  // Get Open Shift By Register
  // =====================================================

  Future<CashierShiftDb?> getOpenShiftByRegister(
    int cashRegisterId,
  ) {
    return (select(cashierShifts)
          ..where(
            (t) =>
                t.cashRegisterId.equals(cashRegisterId) &
                t.status.equals('open'),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // Get Open Shift By Cashier
  // =====================================================

  Future<CashierShiftDb?> getOpenShiftByCashier(
    int cashierId,
  ) {
    return (select(cashierShifts)
          ..where(
            (t) =>
                t.cashierId.equals(cashierId) &
                t.status.equals('open'),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.openedAt),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  // =====================================================
  // Watch Open Shift
  // =====================================================

  Stream<CashierShiftDb?> watchOpenShiftByRegister(
    int cashRegisterId,
  ) {
    return (select(cashierShifts)
          ..where(
            (t) =>
                t.cashRegisterId.equals(cashRegisterId) &
                t.status.equals('open'),
          ))
        .watchSingleOrNull();
  }

  // =====================================================
  // Open Shift
  // =====================================================

  Future<int> openShift(
    CashierShiftsCompanion data,
  ) {
    return attachedDatabase.transaction(() async {
      if (!data.cashRegisterId.present ||
          !data.cashierId.present) {
        throw ArgumentError(
          'يجب تحديد الصندوق والكاشير',
        );
      }

      if (data.status.present && data.status.value != 'open') {
        throw ArgumentError(
          'يجب أن تبدأ الوردية بحالة open',
        );
      }

      final registerId = data.cashRegisterId.value;

      final existing = await getOpenShiftByRegister(
        registerId,
      );

      if (existing != null) {
        throw StateError(
          'يوجد وردية مفتوحة بالفعل لهذا الصندوق',
        );
      }

      return into(cashierShifts).insert(
        data.copyWith(
          status: const Value('open'),
          openedAt: data.openedAt.present
              ? data.openedAt
              : Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // Update Shift Totals
  // =====================================================

  Future<bool> updateTotals({
    required int shiftId,
    required double totalSales,
    required double totalReturns,
    required double totalCashIn,
    required double totalCashOut,
    required double expectedCash,
  }) async {
    if (totalSales < 0 ||
        totalReturns < 0 ||
        totalCashIn < 0 ||
        totalCashOut < 0 ||
        expectedCash < 0) {
      throw ArgumentError(
        'لا يمكن تسجيل قيم مالية سالبة',
      );
    }

    final count = await (update(cashierShifts)
          ..where(
            (t) =>
                t.id.equals(shiftId) &
                t.status.equals('open'),
          ))
        .write(
      CashierShiftsCompanion(
        totalSales: Value(totalSales),
        totalReturns: Value(totalReturns),
        totalCashIn: Value(totalCashIn),
        totalCashOut: Value(totalCashOut),
        expectedCash: Value(expectedCash),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return count > 0;
  }

  // =====================================================
  // Close Shift
  // =====================================================

  Future<bool> closeShift({
    required int shiftId,
    required double actualCash,
    String? notes,
  }) {
    if (actualCash < 0) {
      throw ArgumentError(
        'النقدية الفعلية لا يمكن أن تكون سالبة',
      );
    }

    return attachedDatabase.transaction(() async {
      final shift = await getById(shiftId);

      if (shift == null) {
        throw StateError('الوردية غير موجودة');
      }

      if (shift.status != 'open') {
        throw StateError('الوردية ليست مفتوحة');
      }

      final difference = actualCash - shift.expectedCash;

      final count = await (update(cashierShifts)
            ..where(
              (t) =>
                  t.id.equals(shiftId) &
                  t.status.equals('open'),
            ))
          .write(
        CashierShiftsCompanion(
          actualCash: Value(actualCash),
          cashDifference: Value(difference),
          closedAt: Value(DateTime.now()),
          status: const Value('closed'),
          notes: Value(notes),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return count > 0;
    });
  }

  // =====================================================
  // Update Notes
  // =====================================================

  Future<bool> updateNotes({
    required int shiftId,
    required String notes,
  }) async {
    final count = await (update(cashierShifts)
          ..where((t) => t.id.equals(shiftId)))
        .write(
      CashierShiftsCompanion(
        notes: Value(notes),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return count > 0;
  }

  // =====================================================
  // Delete
  // =====================================================

  Future<int> deleteById(int id) {
    return (delete(cashierShifts)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('open'),
          ))
        .go();
  }
}
