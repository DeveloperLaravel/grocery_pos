
import '../models/product_image_model.dart';

abstract interface class ProductImagesLocalDataSource {
  /// جلب صور المنتج.
  Future<List<ProductImageModel>> getByProductId(int productId);

  /// جلب الصورة الرئيسية.
  Future<ProductImageModel?> getPrimaryImage(int productId);

  /// إضافة صورة جديدة.
  Future<int> addImage({
    required int productId,
    required String imagePath,
    String? imageName,
    bool isPrimary = false,
    int sortOrder = 0,
  });

  /// تعيين صورة كرئيسية.
  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  });

  /// حذف صورة.
  Future<bool> deleteImage(int id);
}
