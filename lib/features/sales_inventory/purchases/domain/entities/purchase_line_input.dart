
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_line_input.freezed.dart';

@freezed
abstract class PurchaseLineInput
    with _$PurchaseLineInput {
  const PurchaseLineInput._();

  const factory PurchaseLineInput({
    required int productId,
    required int productUnitId,
    required String productName,
    required String unitName,
    required double quantity,
    required double conversionFactor,
    required double unitPrice,
    String? notes,
  }) = _PurchaseLineInput;

  double get baseQuantity => quantity * conversionFactor;

  double get baseUnitCost {
    return conversionFactor > 0
        ? unitPrice / conversionFactor
        : 0.0;
  }

  double get total => quantity * unitPrice;
}
