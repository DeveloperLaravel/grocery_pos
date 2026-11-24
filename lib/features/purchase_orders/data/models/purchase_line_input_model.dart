
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/purchase_line_input.dart';

part 'purchase_line_input_model.freezed.dart';
part 'purchase_line_input_model.g.dart';

@freezed
abstract class PurchaseLineInputModel with _$PurchaseLineInputModel {
  const factory PurchaseLineInputModel({
    required int productId,
    int? productUnitId,
    required double quantity,
    double? unitPrice,
    String? notes,
  }) = _PurchaseLineInputModel;

  factory PurchaseLineInputModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PurchaseLineInputModelFromJson(json);

  factory PurchaseLineInputModel.fromEntity(
    PurchaseLineInput entity,
  ) {
    return PurchaseLineInputModel(
      productId: entity.productId,
      productUnitId: entity.productUnitId,
      quantity: entity.quantity,
      unitPrice: entity.unitPrice,
      notes: entity.notes,
    );
  }
}
