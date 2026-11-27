import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/inventory/stock_transfers_table.dart';
import '../../../tables/sales_inventory/inventory/stock_transfer_items_table.dart';

import '../../../tables/sales_inventory/inventory/stores_table.dart';
import '../../../tables/sales_inventory/inventory/product_stocks_table.dart';

import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';

part 'stock_transfers_dao.g.dart';

@DriftAccessor(
  tables: [
    StockTransfers,
    StockTransferItems,
    Stores,
    ProductStocks,
    Products,
    ProductUnits,
  ],
)
class StockTransfersDao extends DatabaseAccessor<AppDatabase>
    with _$StockTransfersDaoMixin {
  StockTransfersDao(super.db);

  static const double _epsilon = 0.000001;

  static const List<String> _statuses = [
    'draft',
    'approved',
    'shipped',
    'partially_received',
    'received',
    'cancelled',
  ];

  // =========================================================
  // Helpers
  // =========================================================

  void _validatePositive(int value, String field) {
    if (value <= 0) {
      throw ArgumentError('$field يجب أن يكون أكبر من صفر.');
    }
  }

  void _validateQuantity(double value, String field) {
    if (!value.isFinite || value <= 0) {
      throw ArgumentError('$field يجب أن تكون أكبر من صفر.');
    }
  }

  String _normalizeText(String value, String field) {
    final result = value.trim();

    if (result.isEmpty) {
      throw ArgumentError('$field مطلوب.');
    }

    return result;
  }

  Future<StoreDb> _getActiveStore(int storeId) async {
    final result = await (select(stores)
          ..where((t) => t.id.equals(storeId) & t.isActive.equals(true)))
        .getSingleOrNull();

    if (result == null) {
      throw StateError('المخزن رقم $storeId غير موجود أو غير نشط.');
    }

    return result;
  }

  Future<void> _validateStores(int fromStoreId, int toStoreId) async {
    _validatePositive(fromStoreId, 'المخزن المصدر');
    _validatePositive(toStoreId, 'المخزن المستلم');

    if (fromStoreId == toStoreId) {
      throw ArgumentError('لا يمكن تحويل المخزون إلى نفس المخزن.');
    }

    await _getActiveStore(fromStoreId);
    await _getActiveStore(toStoreId);
  }

  Future<StockTransferDb> _getTransfer(int transferId) async {
    final transfer = await (select(stockTransfers)
          ..where((t) => t.id.equals(transferId)))
        .getSingleOrNull();

    if (transfer == null) {
      throw StateError('مستند التحويل غير موجود.');
    }

    return transfer;
  }

  Future<List<StockTransferItemDb>> _getTransferItems(
    int transferId,
  ) {
    return (select(stockTransferItems)
          ..where((t) => t.transferId.equals(transferId))
          ..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .get();
  }

  Future<StockTransferItemDb> _getTransferItem(int itemId) async {
    final item = await (select(stockTransferItems)
          ..where((t) => t.id.equals(itemId)))
        .getSingleOrNull();

    if (item == null) {
      throw StateError('صنف التحويل غير موجود.');
    }

    return item;
  }

  Future<void> _ensureDraft(int transferId) async {
    final transfer = await _getTransfer(transferId);

    if (transfer.status != 'draft') {
      throw StateError(
        'لا يمكن تعديل مستند التحويل إلا عندما تكون حالته مسودة.',
      );
    }
  }

  // =========================================================
  // Create Transfer
  // =========================================================

  Future<int> createTransfer({
    required String transferNumber,
    required int fromStoreId,
    required int toStoreId,
    required DateTime transferDate,
    DateTime? expectedArrivalDate,
    String? note,
    int? createdBy,
  }) async {
    final number = _normalizeText(transferNumber, 'رقم التحويل');
    if (number.length > 50) {
      throw ArgumentError('رقم التحويل يجب ألا يتجاوز 50 حرفاً.');
    }

    if (expectedArrivalDate != null &&
        expectedArrivalDate.isBefore(transferDate)) {
      throw ArgumentError(
        'تاريخ الوصول المتوقع لا يمكن أن يسبق تاريخ التحويل.',
      );
    }

    return transaction(() async {
      await _validateStores(fromStoreId, toStoreId);

      final existing = await (select(stockTransfers)
            ..where((t) => t.transferNumber.equals(number)))
          .getSingleOrNull();

      if (existing != null) {
        throw StateError('رقم التحويل مستخدم مسبقاً.');
      }

      return into(stockTransfers).insert(
        StockTransfersCompanion.insert(
          transferNumber: number,
          fromStoreId: fromStoreId,
          toStoreId: toStoreId,
          transferDate: Value(transferDate),
          expectedArrivalDate: Value(expectedArrivalDate),
          note: Value(note?.trim()),
          createdBy: Value(createdBy?.toString()),
        ),
      );
    });
  }

  // =========================================================
  // Add Item
  // =========================================================

  Future<int> addTransferItem({
    required int transferId,
    required int productId,
    int? productUnitId,
    required String unitName,
    required double enteredQuantity,
    double conversionFactor = 1,
    double unitCost = 0,
    String? note,
  }) async {
    _validatePositive(transferId, 'رقم التحويل');
    _validatePositive(productId, 'المنتج');
    _validateQuantity(enteredQuantity, 'الكمية');

    if (!conversionFactor.isFinite || conversionFactor <= 0) {
      throw ArgumentError('معامل التحويل يجب أن يكون أكبر من صفر.');
    }

    if (!unitCost.isFinite || unitCost < 0) {
      throw ArgumentError('تكلفة الوحدة غير صحيحة.');
    }

    final normalizedUnit = _normalizeText(unitName, 'اسم الوحدة');
    if (normalizedUnit.length > 100) {
      throw ArgumentError('اسم الوحدة يجب ألا يتجاوز 100 حرف.');
    }
    if (productUnitId != null) {
      _validatePositive(productUnitId, 'رقم وحدة المنتج');
    }

    return transaction(() async {
      await _ensureDraft(transferId);

      final product = await (select(products)
            ..where((t) => t.id.equals(productId) & t.isActive.equals(true)))
          .getSingleOrNull();

      if (product == null) {
        throw StateError('المنتج غير موجود أو غير نشط.');
      }

      if (productUnitId != null) {
        final unit = await (select(productUnits)
              ..where(
                (t) =>
                    t.id.equals(productUnitId) &
                    t.productId.equals(productId) &
                    t.isActive.equals(true),
              ))
            .getSingleOrNull();

        if (unit == null) {
          throw StateError('وحدة المنتج غير موجودة أو غير نشطة.');
        }

        if ((unit.conversionFactor - conversionFactor).abs() > _epsilon) {
          throw ArgumentError(
            'معامل التحويل لا يطابق معامل الوحدة المسجل للمنتج.',
          );
        }
      }

      final existing = await (select(stockTransferItems)
            ..where(
              (t) =>
                  t.transferId.equals(transferId) &
                  t.productId.equals(productId),
            ))
          .getSingleOrNull();

      if (existing != null) {
        throw StateError('المنتج موجود مسبقاً في مستند التحويل.');
      }

      final baseQuantity = enteredQuantity * conversionFactor;

      return into(stockTransferItems).insert(
        StockTransferItemsCompanion.insert(
          transferId: transferId,
          productId: productId,
          productUnitId: Value(productUnitId),
          unitName: normalizedUnit,
          enteredQuantity: enteredQuantity,
          conversionFactor: Value(conversionFactor),
          baseQuantity: baseQuantity,
          unitCost: Value(unitCost),
          totalCost: Value(baseQuantity * (unitCost / conversionFactor)),
          note: Value(note?.trim()),
        ),
      );
    });
  }

  // =========================================================
  // Update Item
  // =========================================================

  Future<bool> updateTransferItem({
    required int itemId,
    required double enteredQuantity,
    required double unitCost,
    String? note,
  }) async {
    _validateQuantity(enteredQuantity, 'الكمية');

    if (!unitCost.isFinite || unitCost < 0) {
      throw ArgumentError('تكلفة الوحدة غير صحيحة.');
    }

    return transaction(() async {
      final item = await _getTransferItem(itemId);

      await _ensureDraft(item.transferId);

      final baseQuantity = enteredQuantity * item.conversionFactor;

      final updated = await (update(stockTransferItems)
            ..where((t) => t.id.equals(itemId)))
          .write(
        StockTransferItemsCompanion(
          enteredQuantity: Value(enteredQuantity),
          baseQuantity: Value(baseQuantity),
          unitCost: Value(unitCost),
          totalCost: Value(
            baseQuantity * (unitCost / item.conversionFactor),
          ),
          note: Value(note?.trim()),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return updated > 0;
    });
  }

  // =========================================================
  // Remove Item
  // =========================================================

  Future<bool> removeTransferItem(int itemId) async {
    return transaction(() async {
      final item = await _getTransferItem(itemId);

      await _ensureDraft(item.transferId);

      final deleted = await (delete(stockTransferItems)
            ..where((t) => t.id.equals(itemId)))
          .go();

      return deleted > 0;
    });
  }

  // =========================================================
  // Approve Transfer
  // =========================================================

  Future<void> approveTransfer({
    required int transferId,
    int? approvedBy,
  }) async {
    await transaction(() async {
      final transfer = await _getTransfer(transferId);

      if (transfer.status != 'draft') {
        throw StateError('لا يمكن اعتماد هذا المستند.');
      }

      final items = await _getTransferItems(transferId);

      if (items.isEmpty) {
        throw StateError('لا يمكن اعتماد تحويل بدون أصناف.');
      }

      await (update(stockTransfers)..where((t) => t.id.equals(transferId)))
          .write(
        StockTransfersCompanion(
          status: const Value('approved'),
          approvedBy: Value(approvedBy?.toString()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =========================================================
  // Ship Transfer
  // =========================================================

  Future<void> shipTransfer({
    required int transferId,
    int? shippedBy,
    DateTime? shippedAt,
  }) async {
    await transaction(() async {
      final transfer = await _getTransfer(transferId);

      if (transfer.status != 'approved') {
        throw StateError('يجب اعتماد التحويل قبل شحنه.');
      }

      final items = await _getTransferItems(transferId);

      if (items.isEmpty) {
        throw StateError('لا توجد أصناف لشحنها.');
      }

      final date = shippedAt ?? DateTime.now();

      for (final item in items) {
        await db.stockMovementsDao.recordMovement(
          storeId: transfer.fromStoreId,
          productId: item.productId,
          productUnitId: item.productUnitId,
          movementNumber: 'TRF-${transfer.id}-L${item.id}-OUT',
          movementType: 'transfer_out',
          referenceType: 'stock_transfer',
          referenceId: transferId,
          enteredQuantity: item.enteredQuantity,
          conversionFactor: item.conversionFactor,
          unitName: item.unitName,
          unitCost: item.unitCost,
          note: 'شحن تحويل مخزون رقم ${transfer.transferNumber}',
          createdBy: shippedBy,
          movementDate: date,
        );

        await (update(stockTransferItems)..where((t) => t.id.equals(item.id)))
            .write(
          StockTransferItemsCompanion(
            shippedQuantity: Value(item.baseQuantity),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }

      await (update(stockTransfers)..where((t) => t.id.equals(transferId)))
          .write(
        StockTransfersCompanion(
          status: const Value('shipped'),
          shippedAt: Value(date),
          shippedBy: Value(shippedBy?.toString()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =========================================================
  // Receive Item - Supports Partial Receiving
  // =========================================================

  Future<void> receiveTransferItem({
    required int itemId,
    required double receivedEnteredQuantity,
    int? receivedBy,
    DateTime? receivedAt,
    String? note,
  }) async {
    _validateQuantity(
      receivedEnteredQuantity,
      'الكمية المستلمة',
    );

    await transaction(() async {
      final item = await _getTransferItem(itemId);
      final transfer = await _getTransfer(item.transferId);

      if (!['shipped', 'partially_received'].contains(transfer.status)) {
        throw StateError('لا يمكن استلام هذا التحويل في حالته الحالية.');
      }

      final baseReceived = receivedEnteredQuantity * item.conversionFactor;

      final remaining = item.shippedQuantity - item.receivedQuantity;

      if (baseReceived - remaining > _epsilon) {
        throw StateError('الكمية المستلمة أكبر من الكمية المشحونة المتبقية.');
      }

      final date = receivedAt ?? DateTime.now();

      final transferMovements =
          await db.stockMovementsDao.getMovementsByReference(
        referenceType: 'stock_transfer',
        referenceId: transfer.id,
      );
      final receiptSequence = transferMovements
              .where(
                (movement) =>
                    movement.movementType == 'transfer_in' &&
                    movement.productId == item.productId,
              )
              .length +
          1;
      final movementNumber =
          'TRF-${transfer.id}-L${item.id}-IN-$receiptSequence';

      await db.stockMovementsDao.recordMovement(
        storeId: transfer.toStoreId,
        productId: item.productId,
        productUnitId: item.productUnitId,
        movementNumber: movementNumber,
        movementType: 'transfer_in',
        referenceType: 'stock_transfer',
        referenceId: transfer.id,
        enteredQuantity: receivedEnteredQuantity,
        conversionFactor: item.conversionFactor,
        unitName: item.unitName,
        unitCost: item.unitCost,
        note:
            note?.trim() ?? 'استلام تحويل مخزون رقم ${transfer.transferNumber}',
        createdBy: receivedBy,
        movementDate: date,
      );

      final newReceived = item.receivedQuantity + baseReceived;

      await (update(stockTransferItems)..where((t) => t.id.equals(item.id)))
          .write(
        StockTransferItemsCompanion(
          receivedQuantity: Value(newReceived),
          updatedAt: Value(DateTime.now()),
        ),
      );

      final allItems = await _getTransferItems(transfer.id);

      final allReceived = allItems.every(
        (line) => line.id == item.id
            ? (newReceived + _epsilon >= line.shippedQuantity)
            : (line.receivedQuantity + _epsilon >= line.shippedQuantity),
      );

      final anyReceived = allItems.any(
        (line) => line.id == item.id
            ? newReceived > _epsilon
            : line.receivedQuantity > _epsilon,
      );

      final newStatus = allReceived
          ? 'received'
          : anyReceived
              ? 'partially_received'
              : 'shipped';

      await (update(stockTransfers)..where((t) => t.id.equals(transfer.id)))
          .write(
        StockTransfersCompanion(
          status: Value(newStatus),
          receivedAt: allReceived ? Value(date) : const Value.absent(),
          receivedBy: Value(receivedBy?.toString()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =========================================================
  // Cancel Transfer
  // =========================================================

  Future<void> cancelTransfer(int transferId) async {
    await transaction(() async {
      final transfer = await _getTransfer(transferId);

      if (!['draft', 'approved'].contains(transfer.status)) {
        throw StateError(
          'لا يمكن إلغاء تحويل تم شحنه أو استلامه.',
        );
      }

      await (update(stockTransfers)..where((t) => t.id.equals(transferId)))
          .write(
        StockTransfersCompanion(
          status: const Value('cancelled'),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =========================================================
  // Delete Draft Transfer
  // =========================================================

  Future<bool> deleteDraftTransfer(int transferId) async {
    return transaction(() async {
      final transfer = await _getTransfer(transferId);

      if (transfer.status != 'draft') {
        throw StateError('يمكن حذف مستند التحويل المسودة فقط.');
      }

      final deleted = await (delete(stockTransfers)
            ..where((t) => t.id.equals(transferId)))
          .go();

      return deleted > 0;
    });
  }

  // =========================================================
  // Read Operations
  // =========================================================

  Future<List<StockTransferDb>> getAllTransfers() {
    return (select(stockTransfers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Future<StockTransferDb?> getTransferById(int id) {
    return (select(stockTransfers)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<StockTransferDb?> getTransferByNumber(String number) {
    return (select(stockTransfers)
          ..where((t) => t.transferNumber.equals(number.trim())))
        .getSingleOrNull();
  }

  Future<List<StockTransferItemDb>> getTransferItems(int transferId) {
    return _getTransferItems(transferId);
  }

  Future<List<StockTransferDb>> getTransfersByStatus(String status) {
    if (!_statuses.contains(status)) {
      throw ArgumentError('حالة التحويل غير صحيحة.');
    }

    return (select(stockTransfers)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Future<List<StockTransferDb>> getTransfersByStore(int storeId) {
    _validatePositive(storeId, 'المخزن');

    return (select(stockTransfers)
          ..where(
            (t) => t.fromStoreId.equals(storeId) | t.toStoreId.equals(storeId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =========================================================
  // Watch Operations
  // =========================================================

  Stream<List<StockTransferDb>> watchAllTransfers() {
    return (select(stockTransfers)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Stream<List<StockTransferDb>> watchTransfersByStatus(
    String status,
  ) {
    if (!_statuses.contains(status)) {
      throw ArgumentError('حالة التحويل غير صحيحة.');
    }

    return (select(stockTransfers)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Stream<List<StockTransferItemDb>> watchTransferItems(
    int transferId,
  ) {
    return (select(stockTransferItems)
          ..where((t) => t.transferId.equals(transferId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =========================================================
  // Statistics
  // =========================================================

  Future<int> countTransfers() async {
    final count = countAll();
    final query = selectOnly(stockTransfers)..addColumns([count]);
    return (await query.getSingle()).read(count) ?? 0;
  }

  Future<int> countTransfersByStatus(String status) async {
    if (!_statuses.contains(status)) {
      throw ArgumentError('حالة التحويل غير صحيحة.');
    }

    final count = countAll();

    final query = selectOnly(stockTransfers)
      ..addColumns([count])
      ..where(stockTransfers.status.equals(status));

    return (await query.getSingle()).read(count) ?? 0;
  }

}
