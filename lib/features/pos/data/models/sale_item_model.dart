
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item_model.freezed.dart';
part 'sale_item_model.g.dart';

@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    required int id,
    @JsonKey(name: 'sale_id')
    required int saleId,
    @JsonKey(name: 'product_id')
    required int productId,
    @JsonKey(name: 'product_name')
    required String productName,
    required double quantity,
    @JsonKey(name: 'unit_price')
    required double unitPrice,
    @JsonKey(name: 'cost_price')
    required double costPrice,
    required double total,
  }) = _SaleItemModel;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) =>
      _$SaleItemModelFromJson(json);
}
