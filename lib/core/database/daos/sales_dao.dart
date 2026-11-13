import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/products_table.dart';
import '../tables/sales_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/stock_movements_table.dart';

part 'sales_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    Sales,
    SaleItems,
    StockMovements,
  ],
)
class SalesDao extends DatabaseAccessor<AppDatabase>
    with _$SalesDaoMixin {
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
              ..where((tbl) => tbl.id.equals(productId)))
            .getSingleOrNull();

        if (product == null) {
          throw StateError('المنتج رقم $productId غير موجود.');
        }

        if (product.quantity < quantity) {
          throw StateError(
            'الكمية غير كافية للمنتج: ${product.name}. '
            'المتاح: ${product.quantity}',
          );
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

        // خصم الكمية من المخزون.
        final newQuantity = product.quantity - quantity;

        await (update(products)
              ..where((tbl) => tbl.id.equals(product.id)))
            .write(
          ProductsCompanion(
            quantity: Value(newQuantity),
            updatedAt: Value(now),
          ),
        );

        // تسجيل حركة البيع.
        await into(stockMovements).insert(
          StockMovementsCompanion.insert(
            productId: product.id,
            type: 'sale',
            quantity: quantity,
            reference: Value(invoiceNumber.trim()),
            note: Value('بيع من الفاتورة $invoiceNumber'),
            createdAt: Value(now),
          ),
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
      final sale = await (select(sales)
            ..where((tbl) => tbl.id.equals(saleId)))
          .getSingleOrNull();

      if (sale == null) {
        return false;
      }

      // 2. منع إلغاء الفاتورة أكثر من مرة.
      // وجود حركة sale_return لنفس رقم الفاتورة
      // يعني أن عملية الإلغاء سبق تنفيذها.
      final existingReturn = await (select(stockMovements)
            ..where(
              (tbl) =>
                  tbl.type.equals('sale_return') &
                  tbl.reference.equals(sale.invoiceNumber),
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

        final restoredQuantity = product.quantity + item.quantity;

        // إعادة الكمية.
        await (update(products)
              ..where((tbl) => tbl.id.equals(item.productId)))
            .write(
          ProductsCompanion(
            quantity: Value(restoredQuantity),
            updatedAt: Value(now),
          ),
        );

        // تسجيل حركة عكسية للبيع.
        await into(stockMovements).insert(
          StockMovementsCompanion.insert(
            productId: item.productId,
            type: 'sale_return',
            quantity: item.quantity,
            reference: Value(sale.invoiceNumber),
            note: Value(
              'إرجاع مخزون بسبب إلغاء الفاتورة ${sale.invoiceNumber}',
            ),
            createdAt: Value(now),
          ),
        );
      }

      return true;
    });
  }

  Future<SaleDb?> getSaleById(int id) {
    return (select(sales)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<SaleItemDb>> getSaleItems(int saleId) {
    return (select(saleItems)
          ..where((tbl) => tbl.saleId.equals(saleId)))
        .get();
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