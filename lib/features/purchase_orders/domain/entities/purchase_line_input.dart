
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_line_input.freezed.dart';

@freezed
abstract class PurchaseLineInput with _$PurchaseLineInput {
  const factory PurchaseLineInput({
    required int productId,
    int? productUnitId,
    required double quantity,
    double? unitPrice,
    String? notes,
  }) = _PurchaseLineInput;
}
