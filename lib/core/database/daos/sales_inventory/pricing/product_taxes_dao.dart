
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/product_taxes_table.dart';
import '../../../tables/sales_inventory/pricing/taxes_table.dart';


part 'product_taxes_dao.g.dart';

@DriftAccessor(tables: [ProductTaxes, Taxes])
class ProductTaxesDao extends DatabaseAccessor<AppDatabase>
    with _$ProductTaxesDaoMixin {
  ProductTaxesDao(super.db);

  Future<List<ProductTaxDb>> getAll() {
    return select(productTaxes).get();
  }

  Stream<List<ProductTaxDb>> watchAll() {
    return select(productTaxes).watch();
  }

  Future<List<ProductTaxDb>> getByProduct(int productId) {
    return (select(productTaxes)
          ..where((t) => t.productId.equals(productId)))
        .get();
  }

  Stream<List<ProductTaxDb>> watchByProduct(int productId) {
    return (select(productTaxes)
          ..where((t) => t.productId.equals(productId)))
        .watch();
  }

  Future<List<ProductTaxDb>> getByTax(int taxId) {
    return (select(productTaxes)
          ..where((t) => t.taxId.equals(taxId)))
        .get();
  }

  Future<bool> hasTax(int productId, int taxId) async {
    final result = await (select(productTaxes)
          ..where((t) =>
              t.productId.equals(productId) &
              t.taxId.equals(taxId))
          ..limit(1))
        .getSingleOrNull();

    return result != null;
  }

  // Add tax to product
  Future<int> assignTax({
    required int productId,
    required int taxId,
  }) async {
    final tax = await (select(taxes)
          ..where((t) =>
              t.id.equals(taxId) &
              t.isActive.equals(true)))
        .getSingleOrNull();

    if (tax == null) {
      throw StateError('Tax does not exist or is inactive.');
    }

    if (await hasTax(productId, taxId)) {
      throw StateError('Tax already assigned to this product.');
    }

    return into(productTaxes).insert(
      ProductTaxesCompanion.insert(
        productId: productId,
        taxId: taxId,
      ),
    );
  }

  // Assign multiple taxes
  Future<void> assignTaxes({
    required int productId,
    required List<int> taxIds,
  }) async {
    await transaction(() async {
      for (final taxId in taxIds.toSet()) {
        final tax = await (select(taxes)
              ..where((t) =>
                  t.id.equals(taxId) &
                  t.isActive.equals(true)))
            .getSingleOrNull();

        if (tax == null) {
          throw StateError('Invalid tax ID: $taxId');
        }

        await into(productTaxes).insert(
          ProductTaxesCompanion.insert(
            productId: productId,
            taxId: taxId,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }

  // Remove one tax
  Future<int> removeTax({
    required int productId,
    required int taxId,
  }) {
    return (delete(productTaxes)
          ..where((t) =>
              t.productId.equals(productId) &
              t.taxId.equals(taxId)))
        .go();
  }

  // Remove all taxes from product
  Future<int> removeAllByProduct(int productId) {
    return (delete(productTaxes)
          ..where((t) => t.productId.equals(productId)))
        .go();
  }

  // Activate / Deactivate assignment
  Future<bool> setActive(int id, bool active) async {
    final affected = await (update(productTaxes)
          ..where((t) => t.id.equals(id)))
        .write(
      ProductTaxesCompanion(
        isActive: Value(active),
      ),
    );

    return affected > 0;
  }
}
