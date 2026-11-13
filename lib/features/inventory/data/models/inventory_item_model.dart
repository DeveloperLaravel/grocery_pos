
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item_model.freezed.dart';
part 'inventory_item_model.g.dart';

@freezed
abstract class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel({
    required int id,
    required String name,
    required String barcode,

    @JsonKey(name: 'cost_price')
    required double costPrice,

    @JsonKey(name: 'sale_price')
    required double salePrice,

    required double quantity,

    @JsonKey(name: 'min_stock')
    required double minStock,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(
    Map<String, dynamic> json,
  ) => _$InventoryItemModelFromJson(json);
}
