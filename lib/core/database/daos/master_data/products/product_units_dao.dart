
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';

part 'product_units_dao.g.dart';

@DriftAccessor(tables: [Products, ProductUnits])
class ProductUnitsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductUnitsDaoMixin {
  ProductUnitsDao(super.db);

  // إضافة وحدة للمنتج
  Future<int> createUnit(ProductUnitsCompanion companion) async {
    final productId = companion.productId.value;
    final factor = companion.conversionFactor.present
        ? companion.conversionFactor.value
        : 1.0;
    final isBase = companion.isBaseUnit.present
        ? companion.isBaseUnit.value
        : false;

    if (factor <= 0) {
      throw ArgumentError('Conversion factor must be greater than zero.');
    }

    if (isBase && factor != 1.0) {
      throw ArgumentError('Base unit conversion factor must equal 1.');
    }

    return transaction(() async {
      if (isBase) {
        await (update(productUnits)
              ..where((t) => t.productId.equals(productId)))
            .write(
          const ProductUnitsCompanion(
            isBaseUnit: Value(false),
          ),
        );
      }

      return into(productUnits).insert(companion);
    });
  }

  // تعديل وحدة
  Future<bool> updateUnit({
    required int unitId,
    required ProductUnitsCompanion companion,
  }) async {
    return transaction(() async {
      final current = await getUnitById(unitId);

      if (current == null) return false;

      final factor = companion.conversionFactor.present
          ? companion.conversionFactor.value
          : current.conversionFactor;

      final isBase = companion.isBaseUnit.present
          ? companion.isBaseUnit.value
          : current.isBaseUnit;

      if (factor <= 0) {
        throw ArgumentError('Conversion factor must be greater than zero.');
      }

      if (isBase && factor != 1.0) {
        throw ArgumentError('Base unit conversion factor must equal 1.');
      }

      if (isBase) {
        await (update(productUnits)
              ..where(
                (t) =>
                    t.productId.equals(current.productId) &
                    t.id.isNotValue(unitId),
              ))
            .write(
          const ProductUnitsCompanion(
            isBaseUnit: Value(false),
          ),
        );
      }

      final rows = await (update(productUnits)
            ..where((t) => t.id.equals(unitId)))
          .write(
        companion.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return rows > 0;
    });
  }

  // جلب وحدة حسب ID
  Future<ProductUnitDb?> getUnitById(int unitId) {
    return (select(productUnits)
          ..where((t) => t.id.equals(unitId)))
        .getSingleOrNull();
  }

  // جلب وحدات منتج معين
  Future<List<ProductUnitDb>> getUnitsByProduct(int productId) {
    return (select(productUnits)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // جلب الوحدات النشطة لمنتج
  Future<List<ProductUnitDb>> getActiveUnitsByProduct(
    int productId,
  ) {
    return (select(productUnits)
          ..where(
            (t) =>
                t.productId.equals(productId) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // جلب الوحدة الأساسية
  Future<ProductUnitDb?> getBaseUnit(int productId) {
    return (select(productUnits)
          ..where(
            (t) =>
                t.productId.equals(productId) &
                t.isBaseUnit.equals(true),
          ))
        .getSingleOrNull();
  }

  // مراقبة وحدات المنتج
  Stream<List<ProductUnitDb>> watchUnitsByProduct(int productId) {
    return (select(productUnits)
          ..where((t) => t.productId.equals(productId)))
        .watch();
  }

  // حذف وحدة
  Future<int> deleteUnit(int unitId) {
    return (delete(productUnits)
          ..where((t) => t.id.equals(unitId)))
        .go();
  }
}
