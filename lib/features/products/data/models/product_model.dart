
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,

    String? description,

    int? categoryId,
    int? brandId,

    String? barcode,

    @Default('piece')
    String productType,

    @Default('piece')
    String baseUnit,

    @Default(false)
    bool allowDecimalQuantity,

    @Default(0.0)
    double costPrice,

    @Default(0.0)
    double salePrice,

    @Default(0.0)
    double quantity,

    @Default(5.0)
    double minStock,

    String? imagePath,
    String? imageName,
    DateTime? imageUpdatedAt,

    @Default(true)
    bool isActive,

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
