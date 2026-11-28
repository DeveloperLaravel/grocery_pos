import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/returns/returns_table.dart';
import '../../../tables/sales_inventory/returns/return_items_table.dart';

part 'return_items_dao.g.dart';

@DriftAccessor(
  tables: [
    Returns,
    ReturnItems,
  ],
)
class ReturnItemsDao extends DatabaseAccessor<AppDatabase>
    with _$ReturnItemsDaoMixin {
  ReturnItemsDao(super.db);

  // =====================================================
  // 1. Get All Items
  // =====================================================

  Future<List<ReturnItemDb>> getAllItems() {
    return select(returnItems).get();
  }

  // =====================================================
  // 2. Get Item By ID
  // =====================================================

  Future<ReturnItemDb?> getItemById(int id) {
    return (select(returnItems)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 3. Get Items By Return ID
  // =====================================================

  Future<List<ReturnItemDb>> getItemsByReturnId(int returnId) {
    return (select(returnItems)
          ..where((t) => t.returnId.equals(returnId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Watch Items By Return ID
  // =====================================================

  Stream<List<ReturnItemDb>> watchItemsByReturnId(int returnId) {
    return (select(returnItems)
          ..where((t) => t.returnId.equals(returnId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 5. Check Draft Return
  // =====================================================

  Future<ReturnDb> _requireDraftReturn(int returnId) async {
    final result = await (select(returns)..where((t) => t.id.equals(returnId)))
        .getSingleOrNull();

    if (result == null) {
      throw StateError('Return not found.');
    }

    if (result.status != 'draft') {
      throw StateError(
        'Items can only be modified in draft returns.',
      );
    }

    return result;
  }

  // =====================================================
  // 6. Get Previously Returned Quantity
  // =====================================================

  Future<double> getPreviouslyReturnedQuantity({
    required int saleItemId,
    required int saleId,
  }) async {
    final rows = await (select(returnItems).join([
      innerJoin(
        returns,
        returns.id.equalsExp(returnItems.returnId),
      ),
    ])
          ..where(
            returnItems.saleItemId.equals(saleItemId) &
                returns.saleId.equals(saleId) &
                returns.status.equals('confirmed'),
          ))
        .get();

    return rows.fold<double>(
      0,
      (sum, row) => sum + row.readTable(returnItems).quantity,
    );
  }

  // =====================================================
  // 7. Get Available Quantity
  // =====================================================

  Future<double> getAvailableQuantity({
    required int saleItemId,
    required int saleId,
    required double originalQuantity,
  }) async {
    final returned = await getPreviouslyReturnedQuantity(
      saleItemId: saleItemId,
      saleId: saleId,
    );

    final available = originalQuantity - returned;

    return available > 0 ? available : 0;
  }

  // =====================================================
  // 8. Add Return Item
  // =====================================================

  Future<int> addItem({
    required int returnId,
    required int saleItemId,
    required int productId,
    int? productUnitId,
    required String productName,
    required String unitName,
    required double quantity,
    required double conversionFactor,
    required double baseQuantity,
    required String baseUnit,
    required double unitPrice,
    required double originalQuantity,
    required double originalBaseQuantity,
    double discountPercentage = 0,
    double discountAmount = 0,
    double taxPercentage = 0,
    double taxAmount = 0,
    required double subtotal,
    required double totalAmount,
    String itemCondition = 'good',
    String inventoryDisposition = 'restock',
    bool addedToStock = false,
    String? reason,
    String? notes,
  }) async {
    return transaction(() async {
      final parent = await _requireDraftReturn(returnId);

      // Prevent duplicate sale item in the same return.
      final existing = await (select(returnItems)
            ..where(
              (t) =>
                  t.returnId.equals(returnId) & t.saleItemId.equals(saleItemId),
            ))
          .getSingleOrNull();

      if (existing != null) {
        throw StateError(
          'This sale item already exists in this return.',
        );
      }

      if (quantity <= 0 ||
          conversionFactor <= 0 ||
          baseQuantity <= 0 ||
          originalQuantity <= 0 ||
          originalBaseQuantity <= 0) {
        throw ArgumentError('Invalid quantity or conversion factor.');
      }

      if (discountPercentage < 0 ||
          discountPercentage > 100 ||
          discountAmount < 0 ||
          taxPercentage < 0 ||
          taxAmount < 0 ||
          unitPrice < 0 ||
          subtotal < 0 ||
          totalAmount < 0) {
        throw ArgumentError('Invalid financial values.');
      }

      if (itemCondition == 'good' && inventoryDisposition == 'scrapped') {
        // Allowed only if explicitly intended.
      }

      final available = await getAvailableQuantity(
        saleItemId: saleItemId,
        saleId: parent.saleId,
        originalQuantity: originalQuantity,
      );

      if (quantity > available + 0.000001) {
        throw StateError(
          'Quantity exceeds available return quantity. '
          'Available: $available',
        );
      }

      return into(returnItems).insert(
        ReturnItemsCompanion.insert(
          returnId: returnId,
          saleItemId: saleItemId,
          productId: productId,
          productUnitId: Value(productUnitId),
          productName: productName,
          unitName: unitName,
          quantity: quantity,
          conversionFactor: Value(conversionFactor),
          baseQuantity: baseQuantity,
          baseUnit: baseUnit,
          unitPrice: unitPrice,
          originalQuantity: originalQuantity,
          originalBaseQuantity: originalBaseQuantity,
          discountPercentage: Value(discountPercentage),
          discountAmount: Value(discountAmount),
          taxPercentage: Value(taxPercentage),
          taxAmount: Value(taxAmount),
          subtotal: subtotal,
          totalAmount: totalAmount,
          itemCondition: Value(itemCondition),
          inventoryDisposition: Value(inventoryDisposition),
          addedToStock: Value(addedToStock),
          reason: Value(reason),
          notes: Value(notes),
        ),
      );
    });
  }

  // =====================================================
  // 9. Update Return Item
  // =====================================================

  Future<bool> updateItem({
    required int itemId,
    required double quantity,
    required double conversionFactor,
    required double baseQuantity,
    required double unitPrice,
    required double discountPercentage,
    required double discountAmount,
    required double taxPercentage,
    required double taxAmount,
    required double subtotal,
    required double totalAmount,
    required String itemCondition,
    required String inventoryDisposition,
    String? reason,
    String? notes,
  }) async {
    return transaction(() async {
      final item = await getItemById(itemId);

      if (item == null) {
        return false;
      }

      final parent = await _requireDraftReturn(item.returnId);

      if (quantity <= 0 || conversionFactor <= 0 || baseQuantity <= 0) {
        throw ArgumentError('Invalid quantity.');
      }

      if (unitPrice < 0 ||
          discountPercentage < 0 ||
          discountPercentage > 100 ||
          discountAmount < 0 ||
          taxPercentage < 0 ||
          taxAmount < 0 ||
          subtotal < 0 ||
          totalAmount < 0) {
        throw ArgumentError('Invalid financial values.');
      }

      final previouslyReturned = await getPreviouslyReturnedQuantity(
        saleItemId: item.saleItemId,
        saleId: parent.saleId,
      );

      final available = item.originalQuantity - previouslyReturned;

      if (quantity > available + 0.000001) {
        throw StateError(
          'Quantity exceeds available return quantity. '
          'Available: $available',
        );
      }

      await (update(returnItems)..where((t) => t.id.equals(itemId))).write(
        ReturnItemsCompanion(
          quantity: Value(quantity),
          conversionFactor: Value(conversionFactor),
          baseQuantity: Value(baseQuantity),
          unitPrice: Value(unitPrice),
          discountPercentage: Value(discountPercentage),
          discountAmount: Value(discountAmount),
          taxPercentage: Value(taxPercentage),
          taxAmount: Value(taxAmount),
          subtotal: Value(subtotal),
          totalAmount: Value(totalAmount),
          itemCondition: Value(itemCondition),
          inventoryDisposition: Value(inventoryDisposition),
          reason: Value(reason),
          notes: Value(notes),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return true;
    });
  }

  // =====================================================
  // 10. Delete Return Item
  // =====================================================

  Future<bool> deleteItem(int itemId) async {
    return transaction(() async {
      final item = await getItemById(itemId);

      if (item == null) {
        return false;
      }

      await _requireDraftReturn(item.returnId);

      final affected =
          await (delete(returnItems)..where((t) => t.id.equals(itemId))).go();

      return affected > 0;
    });
  }

  // =====================================================
  // 11. Delete All Items In Draft Return
  // =====================================================

  Future<int> deleteItemsByReturnId(int returnId) async {
    await _requireDraftReturn(returnId);

    return (delete(returnItems)..where((t) => t.returnId.equals(returnId)))
        .go();
  }

  // =====================================================
  // 12. Get Items Count
  // =====================================================

  Future<int> getItemsCount(int returnId) async {
    final count = countAll();

    final query = selectOnly(returnItems)
      ..addColumns([count])
      ..where(returnItems.returnId.equals(returnId));

    return await query.map((row) => row.read(count)).getSingle() ?? 0;
  }

  // =====================================================
  // 13. Get Total Returned Quantity
  // =====================================================

  Future<double> getTotalReturnedQuantity(int returnId) async {
    final items = await getItemsByReturnId(returnId);

    return items.fold<double>(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  // =====================================================
  // 14. Get Total Base Quantity
  // =====================================================

  Future<double> getTotalBaseQuantity(int returnId) async {
    final items = await getItemsByReturnId(returnId);

    return items.fold<double>(
      0,
      (sum, item) => sum + item.baseQuantity,
    );
  }

  // =====================================================
  // 15. Get Total Amount
  // =====================================================

  Future<double> getTotalAmount(int returnId) async {
    final items = await getItemsByReturnId(returnId);

    return items.fold<double>(
      0,
      (sum, item) => sum + item.totalAmount,
    );
  }

  // =====================================================
  // 16. Get Items By Product
  // =====================================================

  Future<List<ReturnItemDb>> getItemsByProductId(
    int productId,
  ) {
    return (select(returnItems)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // 17. Get Items By Sale Item
  // =====================================================

  Future<List<ReturnItemDb>> getItemsBySaleItemId(
    int saleItemId,
  ) {
    return (select(returnItems)
          ..where((t) => t.saleItemId.equals(saleItemId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }
}
