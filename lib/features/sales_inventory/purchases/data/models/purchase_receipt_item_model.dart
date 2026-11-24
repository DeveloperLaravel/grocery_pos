
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_receipt_item_model.freezed.dart';
part 'purchase_receipt_item_model.g.dart';

@freezed
abstract class PurchaseReceiptItemModel
    with _$PurchaseReceiptItemModel {
  const factory PurchaseReceiptItemModel({
    required int id,
    required int purchaseReceiptId,
    required int purchaseItemId,
    required int productId,
    int? productUnitId,

    required String productName,
    required String unitName,

    required double quantity,
    required double conversionFactor,
    required double baseQuantity,

    required double unitPrice,
    required double baseUnitCost,
    required double total,
  }) = _PurchaseReceiptItemModel;

  factory PurchaseReceiptItemModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PurchaseReceiptItemModelFromJson(json);
}
