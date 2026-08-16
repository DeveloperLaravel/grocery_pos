import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/database/app_database.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';
import 'package:grocery_pos/features/pos/domain/pos_repository.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

@LazySingleton(as: PosRepository)
class PosRepositoryImpl implements PosRepository {
  final AppDatabase db;
  PosRepositoryImpl(this.db);

  ProductEntity _map(ProductDb p) => ProductEntity(id: p.id, name: p.name, barcode: p.barcode, costPrice: p.costPrice, salePrice: p.salePrice, quantity: p.quantity, minStock: p.minStock);

  @override
  TaskEither<Failure, List<ProductEntity>> getProducts({String query = ''}) => TaskEither.tryCatch(() async {
    // await db.seedIfEmpty();
    final q = db.select(db.products);
    if (query.trim().isNotEmpty) {
      q.where((t) => t.name.contains(query.trim()) | t.barcode.contains(query.trim()));
    }
    q.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return (await q.get()).map(_map).toList();
  }, (e, st) => Failure('تعذر تحميل المنتجات', e));

  @override
  TaskEither<Failure, ProductEntity?> findByBarcode(String barcode) => TaskEither.tryCatch(() async {
    final row = await (db.select(db.products)..where((t) => t.barcode.equals(barcode))).getSingleOrNull();
    return row == null ? null : _map(row);
  }, (e, st) => Failure('تعذر قراءة الباركود', e));

  @override
  TaskEither<Failure, ProductEntity> saveProduct(ProductEntity product) => TaskEither.tryCatch(() async {
    if (product.id == 0) {
      final id = await db.into(db.products).insert(ProductsCompanion.insert(
        name: product.name, barcode: product.barcode, salePrice: product.salePrice,
        costPrice: Value(product.costPrice), quantity: Value(product.quantity), minStock: Value(product.minStock),
      ));
      return product.copyWithId(id);
    }
    await (db.update(db.products)..where((t) => t.id.equals(product.id))).write(ProductsCompanion(
      name: Value(product.name), barcode: Value(product.barcode), costPrice: Value(product.costPrice), salePrice: Value(product.salePrice), quantity: Value(product.quantity), minStock: Value(product.minStock), updatedAt: Value(DateTime.now()),
    ));
    return product;
  }, (e, st) => Failure('تعذر حفظ المنتج. تحقق من عدم تكرار الباركود.', e));

  @override
  TaskEither<Failure, Unit> deleteProduct(int id) => TaskEither.tryCatch(() async {
    await (db.delete(db.products)..where((t) => t.id.equals(id))).go();
    return unit;
  }, (e, st) => Failure('تعذر حذف المنتج', e));

  @override
  TaskEither<Failure, Unit> adjustStock(int productId, double delta, String note) => TaskEither.tryCatch(() async {
    await db.transaction(() async {
      final p = await (db.select(db.products)..where((t) => t.id.equals(productId))).getSingle();
      final next = p.quantity + delta;
      if (next < 0) throw StateError('المخزون لا يمكن أن يكون سالباً');
      await (db.update(db.products)..where((t) => t.id.equals(productId))).write(ProductsCompanion(quantity: Value(next), updatedAt: Value(DateTime.now())));
      await db.into(db.stockMovements).insert(StockMovementsCompanion.insert(productId: productId, type: 'adjustment', quantity: delta, note: Value(note)));
    });
    return unit;
  }, (e, st) => Failure('تعذر تحديث المخزون: $e', e));

  @override
  TaskEither<Failure, SaleReceipt> checkout(List<CartItem> items, double discount, double paid, String paymentMethod) => TaskEither.tryCatch(() async {
    if (items.isEmpty) throw StateError('السلة فارغة');
    final subtotal = items.fold<double>(0, (s, i) => s + i.total);
    final total = (subtotal - discount).clamp(0, double.infinity).toDouble();
    if (paid < total) throw StateError('المبلغ المدفوع أقل من الإجمالي');
    final now = DateTime.now();
    final invoice = 'INV-${now.millisecondsSinceEpoch}';
    late int saleId;
    await db.transaction(() async {
      for (final item in items) {
        final p = await (db.select(db.products)..where((t) => t.id.equals(item.product.id))).getSingle();
        if (p.quantity < item.quantity) throw StateError('الكمية غير كافية للمنتج ${p.name}');
      }
      saleId = await db.into(db.sales).insert(SalesCompanion.insert(invoiceNumber: invoice, subtotal: subtotal, discount: Value(discount), total: total, paidAmount: paid, paymentMethod: Value(paymentMethod), createdAt: Value(now)));
      for (final item in items) {
        final p = await (db.select(db.products)..where((t) => t.id.equals(item.product.id))).getSingle();
        await db.into(db.saleItems).insert(SaleItemsCompanion.insert(saleId: saleId, productId: p.id, productName: p.name, quantity: item.quantity, unitPrice: item.product.salePrice, costPrice: p.costPrice, total: item.total));
        await (db.update(db.products)..where((t) => t.id.equals(p.id))).write(ProductsCompanion(quantity: Value(p.quantity - item.quantity), updatedAt: Value(now)));
        await db.into(db.stockMovements).insert(StockMovementsCompanion.insert(productId: p.id, type: 'sale', quantity: -item.quantity, reference: Value(invoice)));
      }
    });
    return SaleReceipt(saleId: saleId, invoiceNumber: invoice, date: now, items: items, subtotal: subtotal, discount: discount, total: total, paid: paid);
  }, (e, st) => Failure('فشل إتمام البيع: $e', e));

  @override
  TaskEither<Failure, Unit> returnSaleItem({required int saleId, required int productId, required double quantity, required double refundAmount}) => TaskEither.tryCatch(() async {
    await db.transaction(() async {
      final sale = await (db.select(db.sales)..where((t) => t.id.equals(saleId))).getSingle();
      final p = await (db.select(db.products)..where((t) => t.id.equals(productId))).getSingle();
      final returnId = await db.into(db.returns).insert(ReturnsCompanion.insert(saleId: saleId, total: refundAmount));
      await db.into(db.returnItems).insert(ReturnItemsCompanion.insert(returnId: returnId, productId: productId, quantity: quantity, refundAmount: refundAmount));
      await (db.update(db.products)..where((t) => t.id.equals(productId))).write(ProductsCompanion(quantity: Value(p.quantity + quantity), updatedAt: Value(DateTime.now())));
      await db.into(db.stockMovements).insert(StockMovementsCompanion.insert(productId: productId, type: 'return', quantity: quantity, reference: Value(sale.invoiceNumber)));
    });
    return unit;
  }, (e, st) => Failure('تعذر تنفيذ المرتجع: $e', e));
}

extension on ProductEntity {
  ProductEntity copyWithId(int id) => ProductEntity(id: id, name: name, barcode: barcode, costPrice: costPrice, salePrice: salePrice, quantity: quantity, minStock: minStock);
}
