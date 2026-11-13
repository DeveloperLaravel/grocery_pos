import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item_model.freezed.dart';

@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    required int id,
    required int saleId,
    required int productId,
    required String productName,
    required double quantity,
    required double unitPrice,
    required double costPrice,
    required double total,
  }) = _SaleItemModel;
}