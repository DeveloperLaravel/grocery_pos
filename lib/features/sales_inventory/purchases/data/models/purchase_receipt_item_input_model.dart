
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_receipt_item_input_model.freezed.dart';
part 'purchase_receipt_item_input_model.g.dart';

@freezed
abstract class PurchaseReceiptItemInputModel
    with _$PurchaseReceiptItemInputModel {
  const PurchaseReceiptItemInputModel._();

  const factory PurchaseReceiptItemInputModel({
    required int purchaseItemId,
    required int productId,
    int? productUnitId,

    required String productName,
    required String unitName,

    required double quantity,
    required double conversionFactor,

    required double unitPrice,

  }) = _PurchaseReceiptItemInputModel;

  factory PurchaseReceiptItemInputModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseReceiptItemInputModelFromJson(json);

  // =====================================================
  // CALCULATIONS
  // =====================================================

  double get baseQuantity => quantity * conversionFactor;

  double get baseUnitCost {
    return conversionFactor > 0
        ? unitPrice / conversionFactor
        : 0.0;
  }

  double get total => quantity * unitPrice;
}
