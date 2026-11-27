import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stores_table.dart';
import '../../../tables/sales_inventory/pos/cash_registers_table.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'cash_registers_dao.g.dart';

@DriftAccessor(tables: [CashRegisters, PosTerminals, Stores])
class CashRegistersDao extends DatabaseAccessor<AppDatabase>
    with _$CashRegistersDaoMixin {
  CashRegistersDao(super.db);

  Future<List<CashRegisterDb>> getAllRegisters({
    int? storeId,
    int? terminalId,
    bool activeOnly = false,
  }) {
    final query = select(cashRegisters);
    if (storeId != null) {
      query.where((t) => t.storeId.equals(storeId));
    }
    if (terminalId != null) {
      query.where((t) => t.terminalId.equals(terminalId));
    }
    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return query.get();
  }

  Stream<List<CashRegisterDb>> watchRegisters({
    int? storeId,
    int? terminalId,
    bool activeOnly = false,
  }) {
    final query = select(cashRegisters);
    if (storeId != null) {
      query.where((t) => t.storeId.equals(storeId));
    }
    if (terminalId != null) {
      query.where((t) => t.terminalId.equals(terminalId));
    }
    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return query.watch();
  }

  Future<CashRegisterDb?> getRegisterById(int id) {
    return (select(cashRegisters)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertRegister(CashRegistersCompanion register) async {
    final terminalId = register.terminalId.value;
    final storeId = register.storeId.value;

    final terminal = await (select(posTerminals)
          ..where((t) => t.id.equals(terminalId)))
        .getSingleOrNull();

    if (terminal == null) {
      throw StateError('جهاز نقطة البيع غير موجود.');
    }
    if (terminal.storeId != storeId) {
      throw StateError('المخزن المحدد لا يطابق مخزن جهاز نقطة البيع.');
    }

    return into(cashRegisters).insert(register);
  }

  Future<bool> updateRegister(CashRegisterDb register) async {
    final terminal = await (select(posTerminals)
          ..where((t) => t.id.equals(register.terminalId)))
        .getSingleOrNull();

    if (terminal == null || terminal.storeId != register.storeId) {
      throw StateError('الجهاز والمخزن المرتبطان بالصندوق غير متطابقين.');
    }

    return update(cashRegisters).replace(
      register.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<int> setRegisterActive(int id, {required bool isActive}) {
    return (update(cashRegisters)..where((t) => t.id.equals(id))).write(
      CashRegistersCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> setDefaultRegister({
    required int terminalId,
    required int registerId,
  }) {
    return transaction(() async {
      final register = await (select(cashRegisters)
            ..where((t) =>
                t.id.equals(registerId) & t.terminalId.equals(terminalId)))
          .getSingleOrNull();

      if (register == null) {
        throw StateError('الصندوق غير تابع لجهاز نقطة البيع المحدد.');
      }

      await (update(cashRegisters)
            ..where((t) => t.terminalId.equals(terminalId)))
          .write(
        CashRegistersCompanion(
          isDefault: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return (update(cashRegisters)
            ..where((t) => t.id.equals(registerId)))
          .write(
        CashRegistersCompanion(
          isDefault: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<int> deleteRegister(int id) {
    return (delete(cashRegisters)..where((t) => t.id.equals(id))).go();
  }
}
