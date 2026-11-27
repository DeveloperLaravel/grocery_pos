import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/products/product_units_table.dart';
import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/sales_inventory/pos/pos_held_sale_items_table.dart';
import '../../../tables/sales_inventory/pos/pos_held_sales_table.dart';

part 'pos_held_sale_items_dao.g.dart';

@DriftAccessor(
  tables: [
    PosHeldSaleItems,
    PosHeldSales,
    Products,
    ProductUnits,
  ],
)
class PosHeldSaleItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PosHeldSaleItemsDaoMixin {
  PosHeldSaleItemsDao(super.db);

  Future<List<PosHeldSaleItemDb>> getItemsByHeldSale(int heldSaleId) {
    return (select(posHeldSaleItems)
          ..where((t) => t.heldSaleId.equals(heldSaleId))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
  }

  Stream<List<PosHeldSaleItemDb>> watchItemsByHeldSale(int heldSaleId) {
    return (select(posHeldSaleItems)
          ..where((t) => t.heldSaleId.equals(heldSaleId))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .watch();
  }

  Future<int> insertItem(PosHeldSaleItemsCompanion item) {
    return transaction(() async {
      final heldSaleId = item.heldSaleId.value;
      final heldSale = await (select(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .getSingleOrNull();

      if (heldSale == null || heldSale.status != 'held') {
        throw StateError('لا يمكن إضافة منتج إلا إلى فاتورة معلقة.');
      }

      await _validateItem(item);
      return into(posHeldSaleItems).insert(item);
    });
  }

  Future<bool> updateItem(PosHeldSaleItemDb item) {
    return transaction(() async {
      final heldSale = await (select(posHeldSales)
            ..where((t) => t.id.equals(item.heldSaleId)))
          .getSingleOrNull();

      if (heldSale == null || heldSale.status != 'held') {
        throw StateError('لا يمكن تعديل تفاصيل فاتورة غير معلقة.');
      }
      if (item.quantity <= 0 ||
          item.conversionFactor <= 0 ||
          item.baseQuantity <= 0 ||
          item.unitPrice < 0 ||
          item.discountAmount < 0 ||
          item.taxAmount < 0 ||
          item.total < 0) {
        throw ArgumentError('بيانات المنتج أو الكميات أو الأسعار غير صحيحة.');
      }

      return update(posHeldSaleItems).replace(
        item.copyWith(updatedAt: Value(DateTime.now())),
      );
    });
  }

  Future<int> deleteItem(int itemId) {
    return transaction(() async {
      final item = await (select(posHeldSaleItems)
            ..where((t) => t.id.equals(itemId)))
          .getSingleOrNull();

      if (item == null) return 0;

      final sale = await (select(posHeldSales)
            ..where((t) => t.id.equals(item.heldSaleId)))
          .getSingleOrNull();

      if (sale == null || sale.status != 'held') {
        throw StateError('لا يمكن حذف منتج من فاتورة غير معلقة.');
      }

      return (delete(posHeldSaleItems)..where((t) => t.id.equals(itemId))).go();
    });
  }

  Future<void> _validateItem(PosHeldSaleItemsCompanion item) async {
    final conversionFactor =
        item.conversionFactor.present ? item.conversionFactor.value : 1.0;
    final discountAmount =
        item.discountAmount.present ? item.discountAmount.value : 0.0;
    final taxAmount = item.taxAmount.present ? item.taxAmount.value : 0.0;
    final total = item.total.present ? item.total.value : 0.0;

    if (item.quantity.value <= 0 ||
        conversionFactor <= 0 ||
        item.baseQuantity.value <= 0 ||
        item.unitPrice.value < 0 ||
        discountAmount < 0 ||
        taxAmount < 0 ||
        total < 0) {
      throw ArgumentError('بيانات المنتج أو الكميات أو الأسعار غير صحيحة.');
    }

    final product = await (select(products)
          ..where((t) => t.id.equals(item.productId.value)))
        .getSingleOrNull();

    if (product == null) {
      throw StateError('المنتج المحدد غير موجود.');
    }

    final productUnitId =
        item.productUnitId.present ? item.productUnitId.value : null;

    if (productUnitId != null) {
      final unit = await (select(productUnits)
            ..where((t) => t.id.equals(productUnitId)))
          .getSingleOrNull();

      if (unit == null || unit.productId != item.productId.value) {
        throw StateError('الوحدة المحددة لا تتبع المنتج.');
      }
    }
  }
}
