import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stores_table.dart';
import '../../../tables/sales_inventory/pos/pos_settings_table.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'pos_settings_dao.g.dart';

@DriftAccessor(tables: [PosSettings, PosTerminals, Stores])
class PosSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$PosSettingsDaoMixin {
  PosSettingsDao(super.db);

  Future<PosSettingDb?> getSettingsByTerminal(int terminalId) {
    return (select(posSettings)
          ..where((t) => t.terminalId.equals(terminalId)))
        .getSingleOrNull();
  }

  Stream<PosSettingDb?> watchSettingsByTerminal(int terminalId) {
    return (select(posSettings)
          ..where((t) => t.terminalId.equals(terminalId)))
        .watchSingleOrNull();
  }

  Future<int> saveSettings(PosSettingsCompanion settings) {
    return transaction(() async {
      final terminalId = settings.terminalId.value;
      final storeId = settings.storeId.value;

      final terminal = await (select(posTerminals)
            ..where((t) => t.id.equals(terminalId)))
          .getSingleOrNull();

      if (terminal == null) {
        throw StateError('جهاز نقطة البيع غير موجود.');
      }
      if (terminal.storeId != storeId) {
        throw StateError('المخزن المحدد لا يطابق مخزن الجهاز.');
      }

      final maxDiscount = settings.maxDiscountPercent.present
          ? settings.maxDiscountPercent.value
          : 100.0;
      if (maxDiscount < 0 || maxDiscount > 100) {
        throw ArgumentError('نسبة الخصم القصوى يجب أن تكون بين 0 و100.');
      }

      return into(posSettings).insertOnConflictUpdate(
        settings.copyWith(updatedAt: Value(DateTime.now())),
      );
    });
  }

  Future<int> updateSettings(PosSettingDb settings) async {
    final terminal = await (select(posTerminals)
          ..where((t) => t.id.equals(settings.terminalId)))
        .getSingleOrNull();

    if (terminal == null || terminal.storeId != settings.storeId) {
      throw StateError('الجهاز والمخزن المرتبطان بالإعدادات غير متطابقين.');
    }
    if (settings.maxDiscountPercent < 0 ||
        settings.maxDiscountPercent > 100) {
      throw ArgumentError('نسبة الخصم القصوى يجب أن تكون بين 0 و100.');
    }

    return (update(posSettings)..where((t) => t.id.equals(settings.id))).write(
      settings
          .toCompanion(true)
          .copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<int> deleteSettings(int terminalId) {
    return (delete(posSettings)..where((t) => t.terminalId.equals(terminalId)))
        .go();
  }
}
