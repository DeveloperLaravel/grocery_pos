
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';


import '../models/checkout_item_model.dart';
import 'pos_local_data_source.dart';

@LazySingleton(as: PosLocalDataSource)
class PosLocalDataSourceImpl implements PosLocalDataSource {
  final AppDatabase _database;

  PosLocalDataSourceImpl(this._database);

  // ==================================================
  // Products
  // ==================================================

  @override
  Future<List<ProductDb>> getProducts({
    String query = '',
  }) {
    final request = _database.select(_database.products);

    final value = query.trim();

    if (value.isNotEmpty) {
      request.where(
        (tbl) =>
            tbl.name.contains(value) |
            tbl.barcode.contains(value),
      );
    }

    request.orderBy([
      (tbl) => OrderingTerm.asc(tbl.name),
    ]);

    return request.get();
  }

  @override
  Future<ProductDb?> getProductByBarcode(
    String barcode,
  ) {
    final value = barcode.trim();

    if (value.isEmpty) {
      return Future.value(null);
    }

    return (_database.select(_database.products)
          ..where((tbl) => tbl.barcode.equals(value)))
        .getSingleOrNull();
  }

  @override
  Future<ProductDb?> getProductById(int id) {
    if (id <= 0) {
      return Future.value(null);
    }

    return (_database.select(_database.products)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  @override
  Future<int> addProduct(
    ProductsCompanion product,
  ) {
    return _database.into(_database.products).insert(product);
  }

  @override
  Future<bool> updateProduct({
    required int id,
    required ProductsCompanion product,
  }) async {
    if (id <= 0) {
      throw ArgumentError('معرف المنتج غير صالح');
    }

    if (product.id.present && product.id.value != id) {
      throw ArgumentError(
        'لا يمكن تغيير معرف المنتج أثناء التحديث',
      );
    }

    final rows = await (_database.update(_database.products)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      product.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  @override
  Future<bool> deleteProduct(int id) async {
    if (id <= 0) {
      return false;
    }

    return _database.transaction(() async {
      final saleItem = await (_database.select(
        _database.saleItems,
      )
            ..where((tbl) => tbl.productId.equals(id))
            ..limit(1))
          .getSingleOrNull();

      final returnItem = await (_database.select(
        _database.returnItems,
      )
            ..where((tbl) => tbl.productId.equals(id))
            ..limit(1))
          .getSingleOrNull();

      if (saleItem != null || returnItem != null) {
        throw StateError(
          'لا يمكن حذف المنتج لارتباطه بفواتير أو مرتجعات سابقة.',
        );
      }

      await (_database.delete(_database.stockMovements)
            ..where((tbl) => tbl.productId.equals(id)))
          .go();

      final deleted = await (_database.delete(_database.products)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      return deleted > 0;
    });
  }

  // ==================================================
  // Stock
  // ==================================================

  @override
  Future<void> adjustStock({
    required int productId,
    required double delta,
    required String note,
  }) async {
    if (productId <= 0) {
      throw ArgumentError('معرف المنتج غير صالح');
    }

    if (!delta.isFinite || delta == 0) {
      throw ArgumentError('كمية التعديل غير صالحة');
    }

    await _database.transaction(() async {
      final product = await (_database.select(_database.products)
            ..where((tbl) => tbl.id.equals(productId)))
          .getSingleOrNull();

      if (product == null) {
        throw StateError('المنتج غير موجود');
      }

      final newQuantity = product.quantity + delta;

      if (newQuantity < 0) {
        throw StateError('الكمية المتوفرة غير كافية');
      }

      await (_database.update(_database.products)
            ..where((tbl) => tbl.id.equals(productId)))
          .write(
        ProductsCompanion(
          quantity: Value(newQuantity),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await _database.into(_database.stockMovements).insert(
        StockMovementsCompanion.insert(
          productId: productId,
          type: delta > 0 ? 'in' : 'out',
          quantity: delta.abs(),
          note: Value(note),
        ),
      );
    });
  }

  // ==================================================
  // Checkout
  // ==================================================

  @override
  Future<int> checkout({
    required List<CheckoutItemModel> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  }) async {
    if (items.isEmpty) {
      throw StateError('السلة فارغة');
    }

    if (!discount.isFinite || discount < 0) {
      throw ArgumentError('قيمة الخصم غير صالحة');
    }

    if (!paid.isFinite || paid < 0) {
      throw ArgumentError('المبلغ المدفوع غير صالح');
    }

    if (paymentMethod.trim().isEmpty) {
      throw ArgumentError('طريقة الدفع غير محددة');
    }

    return _database.transaction(() async {
      double subtotal = 0;

      // تجميع المنتجات المتكررة في السلة.
      final quantities = <int, double>{};

      for (final item in items) {
        if (item.productId <= 0 ||
            !item.quantity.isFinite ||
            item.quantity <= 0) {
          throw StateError('بيانات أحد المنتجات غير صالحة');
        }

        quantities.update(
          item.productId,
          (oldValue) => oldValue + item.quantity,
          ifAbsent: () => item.quantity,
        );
      }

      final preparedItems = <_PreparedSaleItem>[];

      // التحقق من المنتجات والكميات والأسعار.
      for (final entry in quantities.entries) {
        final productId = entry.key;
        final quantity = entry.value;

        if (!quantity.isFinite || quantity <= 0) {
          throw StateError('كمية المنتج غير صالحة');
        }

        final product = await (_database.select(
          _database.products,
        )
              ..where((tbl) => tbl.id.equals(productId)))
            .getSingleOrNull();

        if (product == null) {
          throw StateError(
            'المنتج رقم $productId غير موجود',
          );
        }

        if (product.quantity < quantity) {
          throw StateError(
            'الكمية المتوفرة من ${product.name} غير كافية',
          );
        }

        final lineTotal = product.salePrice * quantity;

        if (!lineTotal.isFinite || lineTotal < 0) {
          throw StateError('قيمة المنتج غير صالحة');
        }

        subtotal += lineTotal;

        preparedItems.add(
          _PreparedSaleItem(
            product: product,
            quantity: quantity,
            total: lineTotal,
          ),
        );
      }

      final total = subtotal - discount;

      if (!total.isFinite || total < 0) {
        throw StateError(
          'الخصم لا يمكن أن يتجاوز إجمالي الفاتورة',
        );
      }

      if (paid > total) {
        throw StateError(
          'المبلغ المدفوع لا يمكن أن يتجاوز إجمالي الفاتورة',
        );
      }

      // إنشاء رقم فاتورة فريد.
      final invoiceNumber =
          'INV-${DateTime.now().microsecondsSinceEpoch}';

      // إنشاء الفاتورة.
      final saleId = await _database.into(_database.sales).insert(
        SalesCompanion.insert(
          invoiceNumber: invoiceNumber,
          subtotal: subtotal,
          discount: Value(discount),
          total: total,
          paidAmount: Value(paid),
          paymentMethod: Value(paymentMethod.trim()),
        ),
      );

      // تسجيل تفاصيل الفاتورة وتحديث المخزون.
      for (final item in preparedItems) {
        final product = item.product;

        await _database.into(_database.saleItems).insert(
          SaleItemsCompanion.insert(
            saleId: saleId,
            productId: product.id,
            productName: product.name,
            quantity: item.quantity,
            unitPrice: product.salePrice,
            costPrice: product.costPrice,
            total: item.total,
          ),
        );

        final newQuantity = product.quantity - item.quantity;

        await (_database.update(_database.products)
              ..where((tbl) => tbl.id.equals(product.id)))
            .write(
          ProductsCompanion(
            quantity: Value(newQuantity),
            updatedAt: Value(DateTime.now()),
          ),
        );

        await _database.into(_database.stockMovements).insert(
          StockMovementsCompanion.insert(
            productId: product.id,
            type: 'sale',
            quantity: item.quantity,
            reference: Value(invoiceNumber),
            note: Value('بيع من فاتورة $invoiceNumber'),
          ),
        );
      }

      return saleId;
    });
  }

  // ==================================================
  // Sales
  // ==================================================

  @override
  Future<SaleDb?> getSaleById(int saleId) {
    if (saleId <= 0) {
      return Future.value(null);
    }

    return (_database.select(_database.sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .getSingleOrNull();
  }

  @override
  Future<List<SaleItemDb>> getSaleItems(int saleId) {
    if (saleId <= 0) {
      return Future.value([]);
    }

    return (_database.select(_database.saleItems)
          ..where((tbl) => tbl.saleId.equals(saleId))
          ..orderBy([
            (tbl) => OrderingTerm.asc(tbl.id),
          ]))
        .get();
  }

  // ==================================================
  // Returns
  // ==================================================

  @override
  Future<void> returnSaleItem({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) async {
    if (saleId <= 0 || productId <= 0) {
      throw ArgumentError(
        'بيانات الفاتورة أو المنتج غير صالحة',
      );
    }

    if (!quantity.isFinite ||
        quantity <= 0 ||
        !refundAmount.isFinite ||
        refundAmount < 0) {
      throw ArgumentError('بيانات المرتجع غير صالحة');
    }

    await _database.transaction(() async {
      final sale = await (_database.select(_database.sales)
            ..where((tbl) => tbl.id.equals(saleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw StateError('الفاتورة غير موجودة');
      }

      final saleItem = await (_database.select(
        _database.saleItems,
      )
            ..where(
              (tbl) =>
                  tbl.saleId.equals(saleId) &
                  tbl.productId.equals(productId),
            ))
          .getSingleOrNull();

      if (saleItem == null) {
        throw StateError(
          'المنتج غير موجود ضمن الفاتورة المحددة',
        );
      }

      // حساب الكمية التي سبق إرجاعها.
      final previousReturns = await _database.customSelect(
        '''
        SELECT COALESCE(SUM(ri.quantity), 0.0) AS returned_quantity
        FROM return_items ri
        INNER JOIN returns r ON r.id = ri.return_id
        WHERE r.sale_id = ? AND ri.product_id = ?
        ''',
        variables: [
          Variable.withInt(saleId),
          Variable.withInt(productId),
        ],
        readsFrom: {
          _database.returns,
          _database.returnItems,
        },
      ).getSingle();

      final returnedQuantity =
          previousReturns.read<double>('returned_quantity');

      final remainingQuantity =
          saleItem.quantity - returnedQuantity;

      if (quantity > remainingQuantity) {
        throw StateError(
          'الكمية المرتجعة أكبر من الكمية المتبقية للمنتج',
        );
      }

      // التحقق من وجود المنتج.
      final product = await (_database.select(_database.products)
            ..where((tbl) => tbl.id.equals(productId)))
          .getSingleOrNull();

      if (product == null) {
        throw StateError('المنتج غير موجود في المخزون');
      }

      // إنشاء سجل المرتجع.
      final returnId = await _database.into(_database.returns).insert(
        ReturnsCompanion.insert(
          saleId: saleId,
          total: refundAmount,
        ),
      );

      await _database.into(_database.returnItems).insert(
        ReturnItemsCompanion.insert(
          returnId: returnId,
          productId: productId,
          quantity: quantity,
          refundAmount: refundAmount,
        ),
      );

      // إعادة الكمية إلى المخزون.
      await (_database.update(_database.products)
            ..where((tbl) => tbl.id.equals(productId)))
          .write(
        ProductsCompanion(
          quantity: Value(product.quantity + quantity),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // تسجيل حركة المخزون.
      await _database.into(_database.stockMovements).insert(
        StockMovementsCompanion.insert(
          productId: productId,
          type: 'return',
          quantity: quantity,
          reference: Value('RETURN-$returnId'),
          note: Value('مرتجع للفاتورة ${sale.invoiceNumber}'),
        ),
      );
    });
  }
}

// ==================================================
// Internal helper
// ==================================================

class _PreparedSaleItem {
  final ProductDb product;
  final double quantity;
  final double total;

  const _PreparedSaleItem({
    required this.product,
    required this.quantity,
    required this.total,
  });
}
