import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';
import '../tables/master_data/products/products_table.dart';
import '../tables/sales_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/sales_inventory/inventory/stock_movements_table.dart';
import '../tables/sales_inventory/inventory/stores_table.dart';

part 'sales_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    Sales,
    SaleItems,
    StockMovements,
    Stores,
  ],
)
@lazySingleton
class SalesDao extends DatabaseAccessor<AppDatabase> with _$SalesDaoMixin {
  SalesDao(super.db);

  double _money(double value) {
    return (value * 100).roundToDouble() / 100;
  }

  /// إنشاء فاتورة وخصم المخزون في Transaction واحدة.
  Future<int> createSale({
    required String invoiceNumber,
    required Map<int, double> quantities,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  }) async {
    if (quantities.isEmpty) {
      throw ArgumentError('لا توجد منتجات في الفاتورة.');
    }

    if (discount < 0 || paidAmount < 0) {
      throw ArgumentError('قيمة الخصم أو المبلغ المدفوع غير صالحة.');
    }

    if (invoiceNumber.trim().isEmpty) {
      throw ArgumentError('رقم الفاتورة مطلوب.');
    }

    if (paymentMethod.trim().isEmpty) {
      throw ArgumentError('طريقة الدفع مطلوبة.');
    }

    return attachedDatabase.transaction(() async {
      final now = DateTime.now();

      final mainStore = await (select(stores)
            ..where(
              (table) =>
                  table.isMain.equals(true) & table.isActive.equals(true),
            )
            ..orderBy([(table) => OrderingTerm.asc(table.id)])
            ..limit(1))
          .getSingleOrNull();

      if (mainStore == null) {
        throw StateError('يجب تحديد مخزن رئيسي نشط قبل تسجيل المبيعات.');
      }

      var subtotal = 0.0;

      final productsToSell = <ProductDb>[];

      // 1. التحقق من المنتجات والكميات والأسعار من قاعدة البيانات.
      for (final entry in quantities.entries) {
        final productId = entry.key;
        final quantity = entry.value;

        if (productId <= 0 || quantity <= 0) {
          throw ArgumentError('معرف المنتج أو كميته غير صالحة.');
        }

        final product = await (select(products)
              ..where(
                (tbl) => tbl.id.equals(productId) & tbl.isActive.equals(true),
              ))
            .getSingleOrNull();

        if (product == null) {
          throw StateError('المنتج رقم $productId غير موجود أو غير نشط.');
        }

        if (product.salePrice < 0 || product.costPrice < 0) {
          throw StateError(
            'أسعار المنتج ${product.name} غير صالحة.',
          );
        }

        productsToSell.add(product);

        subtotal += product.salePrice * quantity;
      }

      subtotal = _money(subtotal);

      if (discount > subtotal) {
        throw ArgumentError('الخصم أكبر من إجمالي الفاتورة.');
      }

      final total = _money(subtotal - discount);

      // 2. إنشاء رأس الفاتورة.
      final saleId = await into(sales).insert(
        SalesCompanion.insert(
          invoiceNumber: invoiceNumber.trim(),
          subtotal: subtotal,
          discount: Value(discount),
          total: total,
          paidAmount: Value(paidAmount),
          paymentMethod: Value(paymentMethod.trim()),
          createdAt: Value(now),
        ),
      );

      // 3. إنشاء تفاصيل الفاتورة وتحديث المخزون.
      for (final product in productsToSell) {
        final quantity = quantities[product.id]!;

        final itemTotal = _money(
          product.salePrice * quantity,
        );

        // حفظ بيانات المنتج كما كانت وقت البيع.
        await into(saleItems).insert(
          SaleItemsCompanion.insert(
            saleId: saleId,
            productId: product.id,
            productName: product.name,
            quantity: quantity,
            unitPrice: product.salePrice,
            costPrice: product.costPrice,
            total: itemTotal,
          ),
        );

        await attachedDatabase.stockMovementsDao.recordMovementInTransaction(
          storeId: mainStore.id,
          productId: product.id,
          movementNumber: 'SALE-$saleId-${product.id}',
          movementType: 'sale',
          referenceType: 'sale',
          referenceId: saleId,
          enteredQuantity: quantity,
          unitCost: product.costPrice,
          note: 'بيع من الفاتورة $invoiceNumber',
          movementDate: now,
        );
      }

      return saleId;
    });
  }

  /// إلغاء فاتورة وإرجاع المنتجات إلى المخزون.
  ///
  /// تتم جميع العمليات داخل Transaction واحدة:
  /// 1. التحقق من وجود الفاتورة.
  /// 2. التأكد من أنها لم تلغَ سابقاً.
  /// 3. استرجاع تفاصيل الفاتورة.
  /// 4. إعادة الكميات للمخزون.
  /// 5. تسجيل حركة إرجاع.
  ///
  /// ترجع false إذا لم توجد الفاتورة أو سبق إلغاؤها.
  Future<bool> cancelSale(int saleId) async {
    if (saleId <= 0) {
      throw ArgumentError('رقم الفاتورة غير صالح.');
    }

    return attachedDatabase.transaction(() async {
      // 1. البحث عن الفاتورة.
      final sale = await (select(sales)..where((tbl) => tbl.id.equals(saleId)))
          .getSingleOrNull();

      if (sale == null) {
        return false;
      }

      // 2. منع إلغاء الفاتورة أكثر من مرة.
      // وجود حركة إرجاع مرتبطة بالفاتورة
      // يعني أن عملية الإلغاء سبق تنفيذها.
      final existingReturn = await (select(stockMovements)
            ..where(
              (tbl) =>
                  tbl.movementType.equals('return') &
                  tbl.referenceType.equals('sale_cancel') &
                  tbl.referenceId.equals(saleId),
            )
            ..limit(1))
          .getSingleOrNull();

      if (existingReturn != null) {
        return false;
      }

      // 3. جلب تفاصيل الفاتورة.
      final items = await (select(saleItems)
            ..where((tbl) => tbl.saleId.equals(saleId)))
          .get();

      if (items.isEmpty) {
        throw StateError(
          'لا يمكن إلغاء فاتورة لا تحتوي على منتجات.',
        );
      }

      final now = DateTime.now();

      // 4. إعادة المنتجات إلى المخزون وتسجيل حركة الإرجاع.
      for (final item in items) {
        final product = await (select(products)
              ..where((tbl) => tbl.id.equals(item.productId)))
            .getSingleOrNull();

        if (product == null) {
          throw StateError(
            'المنتج ${item.productName} غير موجود في المخزون.',
          );
        }

        if (item.quantity <= 0) {
          throw StateError(
            'كمية المنتج ${item.productName} غير صالحة.',
          );
        }

        final saleMovement = await (select(stockMovements)
              ..where(
                (tbl) =>
                    tbl.movementType.equals('sale') &
                    tbl.referenceType.equals('sale') &
                    tbl.referenceId.equals(saleId) &
                    tbl.productId.equals(item.productId),
              )
              ..limit(1))
            .getSingleOrNull();

        if (saleMovement == null) {
          throw StateError(
            'تعذر العثور على حركة البيع للمنتج ${item.productName}.',
          );
        }

        await attachedDatabase.stockMovementsDao.recordMovementInTransaction(
          storeId: saleMovement.storeId,
          productId: item.productId,
          movementNumber: 'SALE-RETURN-$saleId-${item.productId}',
          movementType: 'return',
          referenceType: 'sale_cancel',
          referenceId: saleId,
          enteredQuantity: item.quantity,
          unitCost: saleMovement.unitCost,
          note: 'إرجاع مخزون بسبب إلغاء الفاتورة ${sale.invoiceNumber}',
          movementDate: now,
        );
      }

      return true;
    });
  }

  Future<SaleDb?> getSaleById(int id) {
    return (select(sales)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<SaleItemDb>> getSaleItems(int saleId) {
    return (select(saleItems)..where((tbl) => tbl.saleId.equals(saleId))).get();
  }

  Future<List<SaleDb>> getAllSales({
    int limit = 100,
  }) {
    return (select(sales)
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.createdAt),
          ])
          ..limit(limit > 0 ? limit : 100))
        .get();
  }

  Stream<List<SaleDb>> watchSales({
    int limit = 100,
  }) {
    final query = select(sales)
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.createdAt),
      ])
      ..limit(limit > 0 ? limit : 100);

    return query.watch();
  }
}
