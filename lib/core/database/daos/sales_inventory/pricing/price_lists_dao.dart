
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/price_lists_table.dart';


part 'price_lists_dao.g.dart';

@DriftAccessor(tables: [PriceLists])
class PriceListsDao extends DatabaseAccessor<AppDatabase>
    with _$PriceListsDaoMixin {
  PriceListsDao(super.db);

  Future<List<PriceListDb>> getAll() {
    return (select(priceLists)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  Stream<List<PriceListDb>> watchAll() {
    return (select(priceLists)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  Future<List<PriceListDb>> getActiveLists() {
    final now = DateTime.now();

    return (select(priceLists)
          ..where((t) =>
              t.isActive.equals(true) &
              (t.startsAt.isNull() |
                  t.startsAt.isSmallerOrEqualValue(now)) &
              (t.endsAt.isNull() |
                  t.endsAt.isBiggerOrEqualValue(now)))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Future<PriceListDb?> getById(int id) {
    return (select(priceLists)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<PriceListDb?> getByCode(String code) {
    return (select(priceLists)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();
  }

  Future<PriceListDb?> getDefault() {
    return (select(priceLists)
          ..where((t) =>
              t.isDefault.equals(true) &
              t.isActive.equals(true))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<PriceListDb>> getByCustomer(int customerId) {
    return (select(priceLists)
          ..where((t) =>
              t.customerId.equals(customerId) &
              t.isActive.equals(true)))
        .get();
  }

  Future<List<PriceListDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(priceLists)
          ..where((t) =>
              t.name.like(value) |
              t.code.like(value)))
        .get();
  }

  // Insert
  Future<int> insertPriceList(
    PriceListsCompanion entry,
  ) async {
    _validate(entry);

    return attachedDatabase.transaction(() async {
      if (entry.isDefault.present && entry.isDefault.value) {
        await _clearDefault();
      }

      return into(priceLists).insert(entry);
    });
  }

  // Update
  Future<bool> updatePriceList(
    int id,
    PriceListsCompanion entry,
  ) async {
    _validate(entry);

    return attachedDatabase.transaction(() async {
      if (entry.isDefault.present && entry.isDefault.value) {
        await _clearDefault();
      }

      final affected = await (update(priceLists)
            ..where((t) => t.id.equals(id)))
          .write(
        entry.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return affected > 0;
    });
  }

  Future<bool> setDefault(int id) async {
    return attachedDatabase.transaction(() async {
      final list = await getById(id);

      if (list == null || !list.isActive) {
        return false;
      }

      await _clearDefault();

      await (update(priceLists)
            ..where((t) => t.id.equals(id)))
          .write(
        const PriceListsCompanion(
          isDefault: Value(true),
        ),
      );

      return true;
    });
  }

  Future<bool> setActive(int id, bool active) async {
    final affected = await (update(priceLists)
          ..where((t) => t.id.equals(id)))
        .write(
      PriceListsCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  Future<int> deletePriceList(int id) {
    return (delete(priceLists)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<void> _clearDefault() async {
    await (update(priceLists)
          ..where((t) => t.isDefault.equals(true)))
        .write(
      const PriceListsCompanion(
        isDefault: Value(false),
      ),
    );
  }

  void _validate(PriceListsCompanion entry) {
    if (entry.name.present &&
        entry.name.value.trim().isEmpty) {
      throw ArgumentError('Price list name is required.');
    }

    if (entry.listType.present &&
        ![
          'retail',
          'wholesale',
          'special',
          'promotional',
        ].contains(entry.listType.value)) {
      throw ArgumentError('Invalid price list type.');
    }
  }
}
