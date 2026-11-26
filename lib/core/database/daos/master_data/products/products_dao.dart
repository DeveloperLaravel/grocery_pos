import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/brands_table.dart';
import '../../../tables/master_data/parties/categories_table.dart';
import '../../../tables/master_data/products/product_barcodes_table.dart';
import '../../../tables/master_data/products/product_images_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';
import '../../../tables/master_data/products/products_table.dart';



part 'products_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    ProductUnits,
    ProductBarcodes,
    ProductImages,
    Categories,
    Brands,
  ],
)
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  // =========================================================
  // PRODUCTS
  // =========================================================

  Future<List<ProductDb>> getAllProducts() {
    return (select(products)
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  Stream<List<ProductDb>> watchAllProducts() {
    return (select(products)
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .watch();
  }

  Future<ProductDb?> getProductById(int id) {
    return (select(products)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<ProductDb?> watchProductById(int id) {
    return (select(products)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<List<ProductDb>> searchProducts(String query) {
    return (select(products)
          ..where(
            (t) => t.name.contains(query),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  Stream<List<ProductDb>> watchProductsByCategory(int categoryId) {
    return (select(products)
          ..where((t) => t.categoryId.equals(categoryId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .watch();
  }

  Stream<List<ProductDb>> watchProductsByBrand(int brandId) {
    return (select(products)
          ..where((t) => t.brandId.equals(brandId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .watch();
  }

  Future<int> insertProduct(ProductsCompanion entry) {
    return into(products).insert(entry);
  }

Future<ProductDb> updateProduct(
  int id,
  ProductsCompanion companion,
) async {
  final rows = await (update(products)
        ..where((tbl) => tbl.id.equals(id)))
      .write(
    companion.copyWith(
      updatedAt: Value(DateTime.now()),
    ),
  );

  if (rows == 0) {
    throw Exception('Product with id $id not found');
  }

  return (select(products)
        ..where((tbl) => tbl.id.equals(id)))
      .getSingle();
}

  Future<int> deleteProduct(int id) {
    return (delete(products)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Create product + its base unit atomically.
Future<int> createProductWithBaseUnit({
  required ProductsCompanion product,
  required String unitName,
}) {
  final normalizedUnitName = unitName.trim();

  if (normalizedUnitName.isEmpty) {
    throw ArgumentError('Unit name cannot be empty.');
  }

  return transaction(() async {
    final productId = await into(products).insert(
      product.copyWith(
        baseUnit: Value(normalizedUnitName),
      ),
    );

    final cost = product.costPrice.present
        ? product.costPrice.value
        : 0.0;

    final sale = product.salePrice.present
        ? product.salePrice.value
        : 0.0;

    await into(productUnits).insert(
      ProductUnitsCompanion.insert(
        productId: productId,
        unitName: normalizedUnitName,
        conversionFactor: const Value(1.0),
        costPrice: Value(cost),
        salePrice: Value(sale),
        isBaseUnit: const Value(true),
        isDefault: const Value(true),
      ),
    );

    return productId;
  });
}
  // =========================================================
  // PRODUCT UNITS
  // =========================================================

  Future<List<ProductUnitDb>> getProductUnits(int productId) {
    return (select(productUnits)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Stream<List<ProductUnitDb>> watchProductUnits(int productId) {
    return (select(productUnits)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .watch();
  }

  Future<ProductUnitDb?> getUnitById(int id) {
    return (select(productUnits)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertProductUnit(
    ProductUnitsCompanion entry,
  ) async {
    // The product must exist.
    final product = await getProductById(entry.productId.value);

    if (product == null) {
      throw StateError('Product does not exist.');
    }

    return into(productUnits).insert(entry);
  }

Future<bool> updateProductUnit(
  int id,
  ProductUnitsCompanion entry,
) async {
  final current = await getUnitById(id);

  if (current == null) return false;

  if (entry.productId.present &&
      entry.productId.value != current.productId) {
    throw StateError(
      'Moving a unit to another product is not allowed.',
    );
  }

  return transaction(() async {
    final willBeBase = entry.isBaseUnit.present
        ? entry.isBaseUnit.value
        : current.isBaseUnit;

    final willBeDefault = entry.isDefault.present
        ? entry.isDefault.value
        : current.isDefault;

    if (current.isBaseUnit && !willBeBase) {
      throw StateError(
        'Use setBaseUnit() to change the base unit.',
      );
    }

    final newUnitName = entry.unitName.present
        ? entry.unitName.value.trim()
        : current.unitName;

    if (newUnitName.isEmpty) {
      throw ArgumentError('Unit name cannot be empty.');
    }

    if (willBeBase) {
      await (update(productUnits)
            ..where((t) =>
                t.productId.equals(current.productId) &
                t.id.isNotValue(id)))
          .write(
        ProductUnitsCompanion(
          isBaseUnit: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }

    if (willBeDefault) {
      await (update(productUnits)
            ..where((t) =>
                t.productId.equals(current.productId) &
                t.id.isNotValue(id)))
          .write(
        ProductUnitsCompanion(
          isDefault: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }

    final normalizedEntry = willBeBase
        ? entry.copyWith(
            unitName: Value(newUnitName),
            conversionFactor: const Value(1.0),
          )
        : entry.copyWith(
            unitName: Value(newUnitName),
          );

    final rows = await (update(productUnits)
          ..where((t) => t.id.equals(id)))
        .write(
      normalizedEntry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (rows > 0 && willBeBase) {
      await (update(products)
            ..where((t) => t.id.equals(current.productId)))
          .write(
        ProductsCompanion(
          baseUnit: Value(newUnitName),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }

    return rows > 0;
  });
}
  // Set the base unit and reset its conversion factor to 1.
  Future<void> setBaseUnit({
    required int productId,
    required int unitId,
  }) {
    return transaction(() async {
      final unit = await getUnitById(unitId);

      if (unit == null || unit.productId != productId) {
        throw StateError('Unit does not belong to this product.');
      }

      await (update(productUnits)
            ..where((t) => t.productId.equals(productId)))
          .write(
        ProductUnitsCompanion(
          isBaseUnit: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(productUnits)
            ..where((t) => t.id.equals(unitId)))
          .write(
        ProductUnitsCompanion(
          isBaseUnit: const Value(true),
          conversionFactor: const Value(1.0),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(products)
            ..where((t) => t.id.equals(productId)))
          .write(
        ProductsCompanion(
          baseUnit: Value(unit.unitName),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<void> _syncProductBaseUnit(
    int productId,
    String unitName,
  ) async {
    await (update(products)
          ..where((t) => t.id.equals(productId)))
        .write(
      ProductsCompanion(
        baseUnit: Value(unitName),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Set default unit.
  Future<void> setDefaultUnit({
    required int productId,
    required int unitId,
  }) {
    return transaction(() async {
      final unit = await getUnitById(unitId);

      if (unit == null || unit.productId != productId) {
        throw StateError('Unit does not belong to this product.');
      }

      await (update(productUnits)
            ..where((t) => t.productId.equals(productId)))
          .write(
        ProductUnitsCompanion(
          isDefault: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(productUnits)
            ..where((t) => t.id.equals(unitId)))
          .write(
        ProductUnitsCompanion(
          isDefault: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<int> deleteProductUnit(int id) {
    return (delete(productUnits)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // PRODUCT BARCODES
  // =========================================================

  Future<List<ProductBarcodeDb>> getProductBarcodes(
    int productId,
  ) {
    return (select(productBarcodes)
          ..where((t) => t.productId.equals(productId)))
        .get();
  }

  Stream<List<ProductBarcodeDb>> watchProductBarcodes(
    int productId,
  ) {
    return (select(productBarcodes)
          ..where((t) => t.productId.equals(productId)))
        .watch();
  }

  Future<ProductBarcodeDb?> getBarcode(String barcode) {
    return (select(productBarcodes)
          ..where((t) => t.barcode.equals(barcode)))
        .getSingleOrNull();
  }

  Future<ProductDb?> getProductByBarcode(String barcode) async {
    final barcodeRecord = await getBarcode(barcode);

    if (barcodeRecord == null || !barcodeRecord.isActive) {
      return null;
    }

    return getProductById(barcodeRecord.productId);
  }

  Future<int> insertProductBarcode(
    ProductBarcodesCompanion entry,
  ) async {
    // Validate product.
    final product = await getProductById(entry.productId.value);

    if (product == null) {
      throw StateError('Product does not exist.');
    }

    // Validate unit-product relationship.
    if (entry.productUnitId.present &&
        entry.productUnitId.value != null) {
      final unit = await getUnitById(
        entry.productUnitId.value!,
      );

      if (unit == null ||
          unit.productId != entry.productId.value) {
        throw StateError(
          'Barcode unit does not belong to this product.',
        );
      }
    }

    return into(productBarcodes).insert(entry);
  }

  Future<void> setDefaultBarcode({
    required int productId,
    required int barcodeId,
  }) {
    return transaction(() async {
      final barcode = await (select(productBarcodes)
            ..where((t) =>
                t.id.equals(barcodeId) &
                t.productId.equals(productId)))
          .getSingleOrNull();

      if (barcode == null) {
        throw StateError('Barcode does not belong to this product.');
      }

      await (update(productBarcodes)
            ..where((t) => t.productId.equals(productId)))
          .write(
        ProductBarcodesCompanion(
          isDefault: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(productBarcodes)
            ..where((t) => t.id.equals(barcodeId)))
          .write(
        ProductBarcodesCompanion(
          isDefault: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<int> deleteProductBarcode(int id) {
    return (delete(productBarcodes)
          ..where((t) => t.id.equals(id)))
        .go();
  }

Future<void> toggleProductBarcode({
  required int id,
  required bool isActive,
}) async {
  await (update(productBarcodes)
        ..where((b) => b.id.equals(id)))
      .write(
    ProductBarcodesCompanion(
      isActive: Value(isActive),
      updatedAt: Value(DateTime.now()),
    ),
  );
}
  // =========================================================
  // PRODUCT IMAGES
  // =========================================================

  Future<List<ProductImageDb>> getProductImages(
    int productId,
  ) {
    return (select(productImages)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Stream<List<ProductImageDb>> watchProductImages(
    int productId,
  ) {
    return (select(productImages)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .watch();
  }

  Future<int> insertProductImage(
    ProductImagesCompanion entry,
  ) async {
    final product = await getProductById(entry.productId.value);

    if (product == null) {
      throw StateError('Product does not exist.');
    }

    if (entry.isPrimary.present && entry.isPrimary.value) {
      return transaction(() async {
        await (update(productImages)
              ..where((t) => t.productId.equals(entry.productId.value)))
            .write(
          ProductImagesCompanion(
            isPrimary: const Value(false),
            updatedAt: Value(DateTime.now()),
          ),
        );

        return into(productImages).insert(entry);
      });
    }

    return into(productImages).insert(entry);
  }

  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  }) {
    return transaction(() async {
      final image = await (select(productImages)
            ..where((t) =>
                t.id.equals(imageId) &
                t.productId.equals(productId)))
          .getSingleOrNull();

      if (image == null) {
        throw StateError('Image does not belong to this product.');
      }

      await (update(productImages)
            ..where((t) => t.productId.equals(productId)))
          .write(
        ProductImagesCompanion(
          isPrimary: const Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (update(productImages)
            ..where((t) => t.id.equals(imageId)))
          .write(
        ProductImagesCompanion(
          isPrimary: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<int> deleteProductImage(int id) {
    return (delete(productImages)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // CATEGORIES
  // =========================================================

  Future<List<CategoryDb>> getAllCategories() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Stream<List<CategoryDb>> watchAllCategories() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .watch();
  }

  Future<List<CategoryDb>> getRootCategories() {
    return (select(categories)
          ..where((t) => t.parentId.isNull())
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Future<List<CategoryDb>> getChildCategories(int parentId) {
    return (select(categories)
          ..where((t) => t.parentId.equals(parentId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Future<int> insertCategory(CategoriesCompanion entry) {
    return into(categories).insert(entry);
  }

  Future<bool> updateCategory(
    int id,
    CategoriesCompanion entry,
  ) async {
    final rows = await (update(categories)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  Future<int> deleteCategory(int id) {
    return (delete(categories)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // BRANDS
  // =========================================================

  Future<List<BrandDb>> getAllBrands() {
    return (select(brands)
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  Stream<List<BrandDb>> watchAllBrands() {
    return (select(brands)
          ..orderBy([
            (t) => OrderingTerm(expression: t.name),
          ]))
        .watch();
  }

  Future<int> insertBrand(BrandsCompanion entry) {
    return into(brands).insert(entry);
  }

  Future<bool> updateBrand(
    int id,
    BrandsCompanion entry,
  ) async {
    final rows = await (update(brands)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  Future<int> deleteBrand(int id) {
    return (delete(brands)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}