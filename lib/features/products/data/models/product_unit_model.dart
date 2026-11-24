
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_unit_model.freezed.dart';
part 'product_unit_model.g.dart';

@freezed
abstract class ProductUnitModel with _$ProductUnitModel {
  const factory ProductUnitModel({
    required int id,
    required int productId,

    required String unitName,
    String? unitSymbol,

    @Default(1.0)
    double conversionFactor,

    @Default(0.0)
    double salePrice,

    @Default(0.0)
    double purchasePrice,

    @Default(false)
    bool isBaseUnit,

    @Default(false)
    bool isDefault,

    @Default(true)
    bool isActive,

    @Default(0)
    int sortOrder,

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductUnitModel;

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitModelFromJson(json);
}
