
import 'package:injectable/injectable.dart';


import '../../../../core/database/daos/master_data/products/product_images_dao.dart';
import '../mapper/product_image_mapper.dart';
import '../models/product_image_model.dart';
import 'product_images_local_data_source.dart';

@LazySingleton(as: ProductImagesLocalDataSource)
class ProductImagesLocalDataSourceImpl
    implements ProductImagesLocalDataSource {
  final ProductImagesDao dao;

  ProductImagesLocalDataSourceImpl({
    required this.dao,
  });

  /// جلب صور المنتج وتحويل Drift إلى Freezed Model.
  @override
  Future<List<ProductImageModel>> getByProductId(
    int productId,
  ) async {
    final images = await dao.getByProductId(productId);

    return images
        .map(ProductImageMapper.fromDb)
        .toList();
  }

  /// جلب الصورة الرئيسية.
  @override
  Future<ProductImageModel?> getPrimaryImage(
    int productId,
  ) async {
    final image = await dao.getPrimaryImage(productId);

    if (image == null) {
      return null;
    }

    return ProductImageMapper.fromDb(image);
  }

  /// إضافة صورة جديدة.
  @override
  Future<int> addImage({
    required int productId,
    required String imagePath,
    String? imageName,
    bool isPrimary = false,
    int sortOrder = 0,
  }) {
    final path = imagePath.trim();

    if (path.isEmpty) {
      throw ArgumentError('مسار الصورة لا يمكن أن يكون فارغاً');
    }

    return dao.addImage(
      productId: productId,
      imagePath: path,
      imageName: imageName?.trim(),
      isPrimary: isPrimary,
      sortOrder: sortOrder,
    );
  }

  /// تعيين صورة كرئيسية.
  @override
  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  }) {
    return dao.setPrimaryImage(
      productId: productId,
      imageId: imageId,
    );
  }

  /// حذف صورة.
  @override
  Future<bool> deleteImage(int id) {
    return dao.deleteImage(id);
  }
}
