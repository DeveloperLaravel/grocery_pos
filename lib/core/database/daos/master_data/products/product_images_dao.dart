
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_images_table.dart';

part 'product_images_dao.g.dart';

@DriftAccessor(tables: [Products, ProductImages])
class ProductImagesDao extends DatabaseAccessor<AppDatabase>
    with _$ProductImagesDaoMixin {
  ProductImagesDao(super.db);

  // إضافة صورة
  Future<int> createImage(
    ProductImagesCompanion companion,
  ) async {
    final productId = companion.productId.value;
    final isPrimary = companion.isPrimary.present
        ? companion.isPrimary.value
        : false;

    return transaction(() async {
      if (isPrimary) {
        await (update(productImages)
              ..where((t) => t.productId.equals(productId)))
            .write(
          const ProductImagesCompanion(
            isPrimary: Value(false),
          ),
        );
      }

      return into(productImages).insert(companion);
    });
  }

  // تعديل صورة
  Future<bool> updateImage({
    required int imageId,
    required ProductImagesCompanion companion,
  }) async {
    return transaction(() async {
      final current = await getImageById(imageId);

      if (current == null) return false;

      final productId = companion.productId.present
          ? companion.productId.value
          : current.productId;

      final isPrimary = companion.isPrimary.present
          ? companion.isPrimary.value
          : current.isPrimary;

      if (isPrimary) {
        await (update(productImages)
              ..where(
                (t) =>
                    t.productId.equals(productId) &
                    t.id.isNotValue(imageId),
              ))
            .write(
          const ProductImagesCompanion(
            isPrimary: Value(false),
          ),
        );
      }

      final rows = await (update(productImages)
            ..where((t) => t.id.equals(imageId)))
          .write(
        companion.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return rows > 0;
    });
  }

  // جلب صورة حسب ID
  Future<ProductImageDb?> getImageById(int imageId) {
    return (select(productImages)
          ..where((t) => t.id.equals(imageId)))
        .getSingleOrNull();
  }

  // جلب جميع صور المنتج
  Future<List<ProductImageDb>> getImagesByProduct(int productId) {
    return (select(productImages)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.isPrimary),
            (t) => OrderingTerm.asc(t.sortOrder),
          ]))
        .get();
  }

  // جلب الصورة الرئيسية
  Future<ProductImageDb?> getPrimaryImage(int productId) {
    return (select(productImages)
          ..where(
            (t) =>
                t.productId.equals(productId) &
                t.isPrimary.equals(true),
          ))
        .getSingleOrNull();
  }

  // مراقبة صور المنتج
  Stream<List<ProductImageDb>> watchImagesByProduct(
    int productId,
  ) {
    return (select(productImages)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.isPrimary),
            (t) => OrderingTerm.asc(t.sortOrder),
          ]))
        .watch();
  }

  // تعيين صورة رئيسية
  Future<bool> setPrimaryImage({
    required int productId,
    required int imageId,
  }) async {
    return transaction(() async {
      final image = await (select(productImages)
            ..where(
              (t) =>
                  t.id.equals(imageId) &
                  t.productId.equals(productId),
            ))
          .getSingleOrNull();

      if (image == null) return false;

      await (update(productImages)
            ..where((t) => t.productId.equals(productId)))
          .write(
        const ProductImagesCompanion(
          isPrimary: Value(false),
        ),
      );

      final rows = await (update(productImages)
            ..where((t) => t.id.equals(imageId)))
          .write(
        ProductImagesCompanion(
          isPrimary: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return rows > 0;
    });
  }

  // تحديث ترتيب صورة
  Future<bool> updateImageSortOrder({
    required int imageId,
    required int sortOrder,
  }) async {
    if (sortOrder < 0) {
      throw ArgumentError('Sort order cannot be negative.');
    }

    final rows = await (update(productImages)
          ..where((t) => t.id.equals(imageId)))
        .write(
      ProductImagesCompanion(
        sortOrder: Value(sortOrder),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // حذف صورة
  Future<int> deleteImage(int imageId) {
    return (delete(productImages)
          ..where((t) => t.id.equals(imageId)))
        .go();
  }

  // حذف جميع صور المنتج
  Future<int> deleteImagesByProduct(int productId) {
    return (delete(productImages)
          ..where((t) => t.productId.equals(productId)))
        .go();
  }
}
