
import 'package:freezed_annotation/freezed_annotation.dart';

import 'sale_item_model.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    required int id,
    @JsonKey(name: 'invoice_number')
    required String invoiceNumber,
    required double subtotal,
    required double discount,
    required double total,
    @JsonKey(name: 'paid_amount')
    required double paidAmount,
    @JsonKey(name: 'payment_method')
    required String paymentMethod,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @Default([])
    List<SaleItemModel> items,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}
