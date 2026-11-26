
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
abstract class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    required int id,
    required int productId,
    required String imagePath,
    String? imageName,
    required bool isPrimary,
    required int sortOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
}
