
import 'package:freezed_annotation/freezed_annotation.dart';

part 'low_stock_product_model.freezed.dart';

@freezed
abstract class LowStockProductModel
    with _$LowStockProductModel {
  const factory LowStockProductModel({
    required int id,
    required String name,
    required String barcode,
    required double quantity,
    required double minStock,
    required double salePrice,
  }) = _LowStockProductModel;
}
