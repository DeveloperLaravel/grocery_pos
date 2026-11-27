import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/cash_movements_table.dart';
import '../../../tables/sales_inventory/pos/cash_registers_table.dart';
import '../../../tables/sales_inventory/pos/cashier_shifts_table.dart';
import '../../../tables/sales_inventory/pos/pos_settings_table.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'cashier_shifts_dao.g.dart';

@DriftAccessor(
  tables: [
    CashierShifts,
    CashRegisters,
    PosTerminals,
    PosSettings,
    CashMovements,
  ],
)
class CashierShiftsDao extends DatabaseAccessor<AppDatabase>
    with _$CashierShiftsDaoMixin {
  CashierShiftsDao(super.db);

  Future<List<CashierShiftDb>> getShifts({
    int? registerId,
    int? terminalId,
    int? cashierId,
    String? status,
    DateTime? from,
    DateTime? to,
  }) {
    final query = select(cashierShifts);
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (terminalId != null) {
      query.where((t) => t.terminalId.equals(terminalId));
    }
    if (cashierId != null) {
      query.where((t) => t.cashierId.equals(cashierId));
    }
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (from != null) {
      query.where((t) => t.openedAt.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((t) => t.openedAt.isSmallerOrEqualValue(to));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.openedAt)]);
    return query.get();
  }

  Stream<List<CashierShiftDb>> watchShifts({
    int? registerId,
    int? cashierId,
    String? status,
  }) {
    final query = select(cashierShifts);
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (cashierId != null) {
      query.where((t) => t.cashierId.equals(cashierId));
    }
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.openedAt)]);
    return query.watch();
  }

  Future<CashierShiftDb?> getShiftById(int id) {
    return (select(cashierShifts)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<CashierShiftDb?> getOpenShiftForRegister(int registerId) {
    return (select(cashierShifts)
          ..where((t) =>
              t.registerId.equals(registerId) & t.status.equals('open'))
          ..orderBy([(t) => OrderingTerm.desc(t.openedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// يفتح وردية مع التحقق من تطابق الصندوق والجهاز.
  /// allowMultipleShifts في PosSettings هو الذي يحدد سياسة تعدد الورديات.
  Future<int> openShift({
    required int registerId,
    required int terminalId,
    required int cashierId,
    required String shiftNumber,
    required double openingCash,
    int? openedBy,
    String? openingNote,
  }) {
    return transaction(() async {
      if (openingCash < 0) {
        throw ArgumentError('الرصيد الافتتاحي لا يمكن أن يكون سالباً.');
      }

      final register = await (select(cashRegisters)
            ..where((t) => t.id.equals(registerId)))
          .getSingleOrNull();
      if (register == null) {
        throw StateError('الصندوق غير موجود.');
      }
      if (!register.isActive) {
        throw StateError('لا يمكن فتح وردية لصندوق غير نشط.');
      }
      if (register.terminalId != terminalId) {
        throw StateError('الصندوق لا يتبع جهاز نقطة البيع المحدد.');
      }

      final terminal = await (select(posTerminals)
            ..where((t) => t.id.equals(terminalId)))
          .getSingleOrNull();
      if (terminal == null || !terminal.isActive) {
        throw StateError('جهاز نقطة البيع غير موجود أو غير نشط.');
      }

      final settings = await (select(posSettings)
            ..where((t) => t.terminalId.equals(terminalId)))
          .getSingleOrNull();
      final allowMultiple = settings?.allowMultipleShifts ?? false;

      if (!allowMultiple) {
        final openShift = await getOpenShiftForRegister(registerId);
        if (openShift != null) {
          throw StateError('يوجد بالفعل وردية مفتوحة لهذا الصندوق.');
        }
      }

      final duplicateNumber = await (select(cashierShifts)
            ..where((t) => t.shiftNumber.equals(shiftNumber)))
          .getSingleOrNull();
      if (duplicateNumber != null) {
        throw StateError('رقم الوردية مستخدم مسبقاً.');
      }

      return into(cashierShifts).insert(
        CashierShiftsCompanion.insert(
          registerId: registerId,
          terminalId: terminalId,
          cashierId: cashierId,
          shiftNumber: shiftNumber,
          openingCash: Value(openingCash),
          openedBy: Value(openedBy),
          openingNote: Value(openingNote),
          status: const Value('open'),
        ),
      );
    });
  }

  /// إغلاق الوردية وحساب الرصيد المتوقع والفرق.
  /// الحركات adjustment لا تدخل في الحساب تلقائياً؛ سجل التسوية كـ cash_in أو cash_out.
  Future<CashierShiftDb> closeShift({
    required int shiftId,
    required double countedCash,
    int? closedBy,
    String? closingNote,
  }) {
    return transaction(() async {
      if (countedCash < 0) {
        throw ArgumentError('النقد المعدود لا يمكن أن يكون سالباً.');
      }

      final shift = await (select(cashierShifts)
            ..where((t) => t.id.equals(shiftId)))
          .getSingleOrNull();

      if (shift == null) {
        throw StateError('الوردية غير موجودة.');
      }
      if (shift.status != 'open') {
        throw StateError('لا يمكن إغلاق وردية ليست مفتوحة.');
      }

      final movements = await (select(cashMovements)
            ..where((t) =>
                t.shiftId.equals(shiftId) & t.status.equals('completed')))
          .get();

      var netCash = 0.0;
      for (final movement in movements) {
        switch (movement.movementType) {
          case 'cash_in':
          case 'sale':
          case 'customer_payment':
            netCash += movement.amount;
            break;
          case 'cash_out':
          case 'expense':
          case 'refund':
            netCash -= movement.amount;
            break;
          case 'adjustment':
            // يجب تسجيل التسوية باتجاه واضح كـ cash_in أو cash_out.
            break;
        }
      }

      final expectedCash = shift.openingCash + netCash;
      final difference = countedCash - expectedCash;

      await (update(cashierShifts)..where((t) => t.id.equals(shiftId))).write(
        CashierShiftsCompanion(
          status: const Value('closed'),
          closedAt: Value(DateTime.now()),
          expectedCash: Value(expectedCash),
          countedCash: Value(countedCash),
          cashDifference: Value(difference),
          closedBy: Value(closedBy),
          closingNote: Value(closingNote),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return (select(cashierShifts)..where((t) => t.id.equals(shiftId)))
          .getSingle();
    });
  }

  Future<int> cancelShift({
    required int shiftId,
    required String reason,
  }) {
    return transaction(() async {
      final shift = await (select(cashierShifts)
            ..where((t) => t.id.equals(shiftId)))
          .getSingleOrNull();
      if (shift == null) {
        throw StateError('الوردية غير موجودة.');
      }
      if (shift.status != 'open') {
        throw StateError('يمكن إلغاء الورديات المفتوحة فقط.');
      }

      // جدول CashierShifts الحالي لا يحتوي على cancelledBy؛ نخزن السبب في closingNote.
      return (update(cashierShifts)..where((t) => t.id.equals(shiftId))).write(
        CashierShiftsCompanion(
          status: const Value('cancelled'),
          closedAt: Value(DateTime.now()),
          closingNote: Value(reason),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
