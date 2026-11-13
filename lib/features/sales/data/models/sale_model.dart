import 'package:freezed_annotation/freezed_annotation.dart';

import 'sale_item_model.dart';

part 'sale_model.freezed.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    required int id,
    required String invoiceNumber,
    required double subtotal,
    required double discount,
    required double total,
    required double paidAmount,
    required String paymentMethod,
    required DateTime createdAt,
    @Default([]) List<SaleItemModel> items,
  }) = _SaleModel;
}