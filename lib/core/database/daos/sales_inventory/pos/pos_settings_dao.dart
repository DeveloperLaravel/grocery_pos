
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/pos_settings_table.dart';

part 'pos_settings_dao.g.dart';

@DriftAccessor(tables: [PosSettings])
class PosSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$PosSettingsDaoMixin {
  PosSettingsDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<PosSettingDb>> getAll() {
    return select(posSettings).get();
  }

  Stream<List<PosSettingDb>> watchAll() {
    return select(posSettings).watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<PosSettingDb?> getById(int id) {
    return (select(posSettings)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // Get Global Settings
  // =====================================================

  Future<PosSettingDb?> getGlobalSettings() {
    return (select(posSettings)
          ..where((t) => t.storeId.isNull()))
        .getSingleOrNull();
  }

  Stream<PosSettingDb?> watchGlobalSettings() {
    return (select(posSettings)
          ..where((t) => t.storeId.isNull()))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Store
  // =====================================================

  Future<PosSettingDb?> getByStoreId(int storeId) {
    return (select(posSettings)
          ..where((t) => t.storeId.equals(storeId)))
        .getSingleOrNull();
  }

  Stream<PosSettingDb?> watchByStoreId(int storeId) {
    return (select(posSettings)
          ..where((t) => t.storeId.equals(storeId)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get Effective Settings
  // =====================================================

  Future<PosSettingDb?> getEffectiveSettings(
    int storeId,
  ) async {
    final storeSettings = await getByStoreId(storeId);

    if (storeSettings != null) {
      return storeSettings;
    }

    return getGlobalSettings();
  }

  // =====================================================
  // Save Global Settings
  // =====================================================

  Future<int> saveGlobalSettings(
    PosSettingsCompanion data,
  ) {
    return _saveSettings(
      storeId: null,
      data: data,
    );
  }

  // =====================================================
  // Save Store Settings
  // =====================================================

  Future<int> saveStoreSettings({
    required int storeId,
    required PosSettingsCompanion data,
  }) {
    return _saveSettings(
      storeId: storeId,
      data: data,
    );
  }

  // =====================================================
  // Internal Save
  // =====================================================

  Future<int> _saveSettings({
    required int? storeId,
    required PosSettingsCompanion data,
  }) {
    return attachedDatabase.transaction(() async {
      final existing = storeId == null
          ? await getGlobalSettings()
          : await getByStoreId(storeId);

      final settings = data.copyWith(
        storeId: Value(storeId),
        updatedAt: Value(DateTime.now()),
      );

      if (existing == null) {
        return into(posSettings).insert(settings);
      }

      await (update(posSettings)
            ..where((t) => t.id.equals(existing.id)))
          .write(settings);

      return existing.id;
    });
  }

  // =====================================================
  // Delete Store Settings
  // =====================================================

  Future<int> deleteStoreSettings(int storeId) {
    return (delete(posSettings)
          ..where((t) => t.storeId.equals(storeId)))
        .go();
  }

  // =====================================================
  // Reset Global Settings
  // =====================================================

  Future<int> resetGlobalSettings() {
    return (delete(posSettings)
          ..where((t) => t.storeId.isNull()))
        .go();
  }

  // =====================================================
  // Exists
  // =====================================================

  Future<bool> existsForStore(int storeId) async {
    final result = await getByStoreId(storeId);
    return result != null;
  }
}
