
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item_model.freezed.dart';

@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    required int id,
    required int saleId,
    required int productId,
    int? productUnitId,
    required String productName,
    required String unitName,
    required double quantity,
    required double conversionFactor,
    required double baseQuantity,
    required double unitPrice,
    required double costPrice,
    required double discountAmount,
    required double taxRate,
    required double taxAmount,
    required double totalAmount,
    String? notes,
    required DateTime createdAt,
  }) = _SaleItemModel;
}
