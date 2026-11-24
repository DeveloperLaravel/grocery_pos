import 'package:freezed_annotation/freezed_annotation.dart';

import 'purchase_receipt_model.dart';
import 'purchase_receipt_item_model.dart';

part 'purchase_receipt_details_model.freezed.dart';
part 'purchase_receipt_details_model.g.dart';

@freezed
abstract class PurchaseReceiptDetailsModel
    with _$PurchaseReceiptDetailsModel {
  const PurchaseReceiptDetailsModel._();

  const factory PurchaseReceiptDetailsModel({
    required PurchaseReceiptModel receipt,

    @Default([])
    List<PurchaseReceiptItemModel> items,
  }) = _PurchaseReceiptDetailsModel;

  factory PurchaseReceiptDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseReceiptDetailsModelFromJson(json);

  // =====================================================
  // CALCULATIONS
  // =====================================================

  double get totalQuantity {
    return items.fold(
      0.0,
      (sum, item) => sum + item.quantity,
    );
  }

  double get totalBaseQuantity {
    return items.fold(
      0.0,
      (sum, item) => sum + item.baseQuantity,
    );
  }

  double get totalAmount {
    return items.fold(
      0.0,
      (sum, item) => sum + item.total,
    );
  }

  int get itemsCount => items.length;
}