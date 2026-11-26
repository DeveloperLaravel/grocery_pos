
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_unit_model.freezed.dart';
part 'product_unit_model.g.dart';

@freezed
abstract class ProductUnitModel with _$ProductUnitModel {
  const factory ProductUnitModel({
    required int id,
    required int productId,
    required String unitName,
    required double conversionFactor,
    required double costPrice,
    required double salePrice,
    required bool isBaseUnit,
    required bool isDefault,
    required bool isActive,
    required int sortOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductUnitModel;

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitModelFromJson(json);
}
