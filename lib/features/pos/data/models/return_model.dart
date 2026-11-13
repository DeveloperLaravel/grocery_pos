
import 'package:freezed_annotation/freezed_annotation.dart';

import 'return_item_model.dart';

part 'return_model.freezed.dart';
part 'return_model.g.dart';

@freezed
abstract class ReturnModel with _$ReturnModel {
  const factory ReturnModel({
    required int id,
    @JsonKey(name: 'sale_id')
    required int saleId,
    required double total,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @Default([])
    List<ReturnItemModel> items,
  }) = _ReturnModel;

  factory ReturnModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelFromJson(json);
}
