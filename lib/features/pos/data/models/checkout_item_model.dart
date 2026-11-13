import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_item_model.freezed.dart';
part 'checkout_item_model.g.dart';

@freezed
abstract class CheckoutItemModel with _$CheckoutItemModel {
  const factory CheckoutItemModel({
    @JsonKey(name: 'product_id')
    required int productId,
    required double quantity,
  }) = _CheckoutItemModel;

  factory CheckoutItemModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CheckoutItemModelFromJson(json);
}