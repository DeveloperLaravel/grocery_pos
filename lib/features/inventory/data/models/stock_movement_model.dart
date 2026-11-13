
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_movement_model.freezed.dart';
part 'stock_movement_model.g.dart';

@freezed
abstract class StockMovementModel
    with _$StockMovementModel {
  const factory StockMovementModel({
    required int id,

    @JsonKey(name: 'product_id')
    required int productId,

    required String type,

    required double quantity,

    String? reference,

    String? note,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _StockMovementModel;

  factory StockMovementModel.fromJson(
    Map<String, dynamic> json,
  ) => _$StockMovementModelFromJson(json);
}
