
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
    required String productType,
    required String baseUnit,
    required bool allowDecimalQuantity,
    required double costPrice,
    required double salePrice,
    required double minStock,
    required double quantity,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
