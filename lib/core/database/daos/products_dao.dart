
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';

import '../tables/products_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/return_items_table.dart';
import '../tables/stock_movements_table.dart';

part 'products_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    SaleItems,
    ReturnItems,
    StockMovements,
  ],
)
@lazySingleton
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  // Get all products
  Future<List<ProductDb>> getAllProducts() {
    final query = select(products)
      ..orderBy([
        (tbl) => OrderingTerm.asc(tbl.name),
      ]);

    return query.get();
  }

  // Watch all products in real time
  Stream<List<ProductDb>> watchAllProducts() {
    final query = select(products)
      ..orderBy([
        (tbl) => OrderingTerm.asc(tbl.name),
      ]);

    return query.watch();
  }

  // Get product by ID
  Future<ProductDb?> getProductById(int id) {
    if (id <= 0) return Future.value(null);

    final query = select(products)
      ..where((tbl) => tbl.id.equals(id));

    return query.getSingleOrNull();
  }

  // Find product by barcode
  Future<ProductDb?> findProductByBarcode(
    String barcode,
  ) {
    final value = barcode.trim();

    if (value.isEmpty) {
      return Future.value(null);
    }

    final query = select(products)
      ..where((tbl) => tbl.barcode.equals(value));

    return query.getSingleOrNull();
  }

  // Insert product
  Future<int> insertProduct(
    ProductsCompanion product,
  ) {
    return into(products).insert(product);
  }

  // Update product
  Future<bool> updateProduct(
    int id,
    ProductsCompanion product,
  ) async {
    if (id <= 0) {
      throw ArgumentError.value(
        id,
        'id',
        'معرف المنتج غير صالح',
      );
    }

    if (product.id.present && product.id.value != id) {
      throw ArgumentError(
        'لا يمكن تغيير معرف المنتج أثناء التحديث.',
      );
    }

    final updatedRows = await (update(products)
          ..where((tbl) => tbl.id.equals(id)))
        .write(product);

    return updatedRows > 0;
  }

  // Delete product safely
  Future<bool> deleteProductById(
    int productId,
  ) async {
    if (productId <= 0) return false;

    return attachedDatabase.transaction(() async {
      // Check whether product is used in sales
      final saleItem = await (select(saleItems)
            ..where(
              (tbl) => tbl.productId.equals(productId),
            )
            ..limit(1))
          .getSingleOrNull();

      // Check whether product is used in returns
      final returnItem = await (select(returnItems)
            ..where(
              (tbl) => tbl.productId.equals(productId),
            )
            ..limit(1))
          .getSingleOrNull();

      if (saleItem != null || returnItem != null) {
        throw StateError(
          'لا يمكن حذف المنتج لأنه مرتبط بفواتير أو مرتجعات سابقة.',
        );
      }

      // Delete related stock movements
      await (delete(stockMovements)
            ..where(
              (tbl) => tbl.productId.equals(productId),
            ))
          .go();

      // Delete product
      final deletedRows = await (delete(products)
            ..where(
              (tbl) => tbl.id.equals(productId),
            ))
          .go();

      return deletedRows > 0;
    });
  }
}
