import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/cash_movements_table.dart';
import '../../../tables/sales_inventory/pos/cash_registers_table.dart';
import '../../../tables/sales_inventory/pos/cashier_shifts_table.dart';

part 'cash_movements_dao.g.dart';

@DriftAccessor(tables: [CashMovements, CashierShifts, CashRegisters])
class CashMovementsDao extends DatabaseAccessor<AppDatabase>
    with _$CashMovementsDaoMixin {
  CashMovementsDao(super.db);

  static const allowedTypes = {
    'cash_in',
    'cash_out',
    'sale',
    'customer_payment',
    'expense',
    'refund',
    'adjustment',
  };

  Future<List<CashMovementDb>> getMovements({
    int? shiftId,
    int? registerId,
    String? movementType,
    String? status,
    DateTime? from,
    DateTime? to,
  }) {
    final query = select(cashMovements);
    if (shiftId != null) {
      query.where((t) => t.shiftId.equals(shiftId));
    }
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (movementType != null) {
      query.where((t) => t.movementType.equals(movementType));
    }
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (from != null) {
      query.where((t) => t.movementDate.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((t) => t.movementDate.isSmallerOrEqualValue(to));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.movementDate)]);
    return query.get();
  }

  Stream<List<CashMovementDb>> watchMovements({
    int? shiftId,
    int? registerId,
    String? status,
  }) {
    final query = select(cashMovements);
    if (shiftId != null) {
      query.where((t) => t.shiftId.equals(shiftId));
    }
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.movementDate)]);
    return query.watch();
  }

  Future<CashMovementDb?> getMovementById(int id) {
    return (select(cashMovements)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertMovement(CashMovementsCompanion movement) {
    return transaction(() async {
      final amount = movement.amount.value;
      final type = movement.movementType.value;
      final shiftId = movement.shiftId.value;
      final registerId = movement.registerId.value;

      if (amount <= 0) {
        throw ArgumentError('قيمة الحركة النقدية يجب أن تكون أكبر من صفر.');
      }
      if (!allowedTypes.contains(type)) {
        throw ArgumentError('نوع الحركة النقدية غير مدعوم: $type');
      }

      final shift = await (select(cashierShifts)
            ..where((t) => t.id.equals(shiftId)))
          .getSingleOrNull();
      if (shift == null || shift.status != 'open') {
        throw StateError('لا يمكن تسجيل حركة على وردية غير مفتوحة.');
      }
      if (shift.registerId != registerId) {
        throw StateError('الصندوق لا يطابق صندوق الوردية.');
      }

      final register = await (select(cashRegisters)
            ..where((t) => t.id.equals(registerId)))
          .getSingleOrNull();
      if (register == null) {
        throw StateError('الصندوق غير موجود.');
      }

      return into(cashMovements).insert(movement);
    });
  }

  /// الحركات المالية لا تعدل أو تحذف بعد تسجيلها؛ يتم إلغاؤها مع الاحتفاظ بالسجل.
  Future<int> cancelMovement({
    required int movementId,
    required String reason,
    int? cancelledBy,
  }) {
    return transaction(() async {
      final movement = await (select(cashMovements)
            ..where((t) => t.id.equals(movementId)))
          .getSingleOrNull();

      if (movement == null) {
        throw StateError('الحركة النقدية غير موجودة.');
      }
      if (movement.status != 'completed') {
        throw StateError('الحركة ليست في حالة تسمح بالإلغاء.');
      }

      return (update(cashMovements)..where((t) => t.id.equals(movementId)))
          .write(
        CashMovementsCompanion(
          status: const Value('cancelled'),
          cancelledAt: Value(DateTime.now()),
          cancelledBy: Value(cancelledBy),
          cancellationReason: Value(reason),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<double> getNetCashForShift(int shiftId) async {
    final movements = await (select(cashMovements)
          ..where((t) =>
              t.shiftId.equals(shiftId) & t.status.equals('completed')))
        .get();

    var total = 0.0;
    for (final movement in movements) {
      switch (movement.movementType) {
        case 'cash_in':
        case 'sale':
        case 'customer_payment':
          total += movement.amount;
          break;
        case 'cash_out':
        case 'expense':
        case 'refund':
          total -= movement.amount;
          break;
        case 'adjustment':
          break;
      }
    }
    return total;
  }
}
