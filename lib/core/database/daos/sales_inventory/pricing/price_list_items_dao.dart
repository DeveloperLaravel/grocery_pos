
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/price_list_items_table.dart';

part 'price_list_items_dao.g.dart';

@DriftAccessor(tables: [PriceListItems])
class PriceListItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PriceListItemsDaoMixin {
  PriceListItemsDao(super.db);

  Future<List<PriceListItemDb>> getAll() {
    return (select(priceListItems)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  Stream<List<PriceListItemDb>> watchAll() {
    return select(priceListItems).watch();
  }

  Future<List<PriceListItemDb>> getByPriceList(
    int priceListId,
  ) {
    return (select(priceListItems)
          ..where((t) => t.priceListId.equals(priceListId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.productId),
          ]))
        .get();
  }

  Stream<List<PriceListItemDb>> watchByPriceList(
    int priceListId,
  ) {
    return (select(priceListItems)
          ..where((t) => t.priceListId.equals(priceListId)))
        .watch();
  }

  Future<List<PriceListItemDb>> getByProduct(
    int productId,
  ) {
    return (select(priceListItems)
          ..where((t) => t.productId.equals(productId)))
        .get();
  }

  Future<PriceListItemDb?> getById(int id) {
    return (select(priceListItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Find the applicable price for product, unit and quantity.
  Future<PriceListItemDb?> getApplicablePrice({
    required int priceListId,
    required int productId,
    required double quantity,
    int? productUnitId,
  }) async {
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than zero.');
    }

    final now = DateTime.now();

    final query = select(priceListItems)
      ..where((t) =>
          t.priceListId.equals(priceListId) &
          t.productId.equals(productId) &
          t.isActive.equals(true) &
          t.minimumQuantity.isSmallerOrEqualValue(quantity) &
          (t.maximumQuantity.isNull() |
              t.maximumQuantity.isBiggerOrEqualValue(quantity)) &
          (t.startsAt.isNull() |
              t.startsAt.isSmallerOrEqualValue(now)) &
          (t.endsAt.isNull() |
              t.endsAt.isBiggerOrEqualValue(now)));

    if (productUnitId == null) {
      query.where((t) => t.productUnitId.isNull());
    } else {
      query.where(
        (t) => t.productUnitId.equals(productUnitId),
      );
    }

    query
      ..orderBy([
        (t) => OrderingTerm.desc(t.minimumQuantity),
      ])
      ..limit(1);

    return query.getSingleOrNull();
  }

  Future<bool> exists({
    required int priceListId,
    required int productId,
    int? productUnitId,
  }) async {
    final query = select(priceListItems)
      ..where((t) =>
          t.priceListId.equals(priceListId) &
          t.productId.equals(productId));

    if (productUnitId == null) {
      query.where((t) => t.productUnitId.isNull());
    } else {
      query.where(
        (t) => t.productUnitId.equals(productUnitId),
      );
    }

    return (await query.getSingleOrNull()) != null;
  }

  // Insert a new price.
  Future<int> insertPrice(
    PriceListItemsCompanion entry,
  ) async {
    _validate(entry);

    final priceListId = entry.priceListId.value;
    final productId = entry.productId.value;
    final unitId = entry.productUnitId.present
        ? entry.productUnitId.value
        : null;

    if (await exists(
      priceListId: priceListId,
      productId: productId,
      productUnitId: unitId,
    )) {
      throw StateError(
        'Price already exists for this product and unit.',
      );
    }

    return into(priceListItems).insert(entry);
  }

  // Update an existing price.
  Future<bool> updatePrice(
    int id,
    PriceListItemsCompanion entry,
  ) async {
    _validate(entry);

    if (entry.price.present) {
      final affected = await (update(priceListItems)
            ..where((t) => t.id.equals(id)))
          .write(
        entry.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return affected > 0;
    }

    return false;
  }

  Future<bool> setActive(int id, bool active) async {
    final affected = await (update(priceListItems)
          ..where((t) => t.id.equals(id)))
        .write(
      PriceListItemsCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  Future<int> deletePrice(int id) {
    return (delete(priceListItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<int> deleteByPriceList(int priceListId) {
    return (delete(priceListItems)
          ..where((t) => t.priceListId.equals(priceListId)))
        .go();
  }

  void _validate(PriceListItemsCompanion entry) {
    if (!entry.priceListId.present ||
        !entry.productId.present ||
        !entry.price.present) {
      throw ArgumentError(
        'Price list, product and price are required.',
      );
    }

    if (entry.price.value < 0) {
      throw ArgumentError('Price cannot be negative.');
    }

    if (entry.minimumQuantity.present &&
        entry.minimumQuantity.value <= 0) {
      throw ArgumentError(
        'Minimum quantity must be greater than zero.',
      );
    }

    if (entry.maximumQuantity.present &&
        entry.maximumQuantity.value != null &&
        entry.minimumQuantity.present &&
        entry.maximumQuantity.value! <
            entry.minimumQuantity.value) {
      throw ArgumentError(
        'Maximum quantity cannot be less than minimum quantity.',
      );
    }
  }
}
