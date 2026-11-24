
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item.freezed.dart';

@freezed
abstract class SaleItem with _$SaleItem {
  const factory SaleItem({
    required int id,
    required int saleId,
    required int productId,
    int? productUnitId,

    required String productName,
    required String unitName,

    required double quantity,
    @Default(1) double conversionFactor,
    required double baseQuantity,

    required double unitPrice,
    @Default(0) double costPrice,

    @Default(0) double discountAmount,
    @Default(0) double taxRate,
    @Default(0) double taxAmount,

    required double totalAmount,

    String? notes,
    required DateTime createdAt,
  }) = _SaleItem;
}
