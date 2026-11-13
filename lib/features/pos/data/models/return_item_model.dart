
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item_model.freezed.dart';
part 'return_item_model.g.dart';

@freezed
abstract class ReturnItemModel with _$ReturnItemModel {
  const factory ReturnItemModel({
    required int id,
    @JsonKey(name: 'return_id')
    required int returnId,
    @JsonKey(name: 'product_id')
    required int productId,
    required double quantity,
    @JsonKey(name: 'refund_amount')
    required double refundAmount,
  }) = _ReturnItemModel;

  factory ReturnItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemModelFromJson(json);
}
