
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/purchase_line_input.dart';

part 'purchase_line_input_model.freezed.dart';
part 'purchase_line_input_model.g.dart';

@freezed
abstract class PurchaseLineInputModel
    with _$PurchaseLineInputModel {
  const PurchaseLineInputModel._();

  const factory PurchaseLineInputModel({
    required int productId,
    required int productUnitId,
    required String productName,
    required String unitName,
    required double quantity,
    required double conversionFactor,
    required double unitPrice,
    String? notes,
  }) = _PurchaseLineInputModel;

  factory PurchaseLineInputModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseLineInputModelFromJson(json);

  // =====================================================
  // ENTITY -> MODEL
  // =====================================================

  factory PurchaseLineInputModel.fromEntity(
    PurchaseLineInput entity,
  ) {
    return PurchaseLineInputModel(
      productId: entity.productId,
      productUnitId: entity.productUnitId,
      productName: entity.productName,
      unitName: entity.unitName,
      quantity: entity.quantity,
      conversionFactor: entity.conversionFactor,
      unitPrice: entity.unitPrice,
      notes: entity.notes,
    );
  }

  // =====================================================
  // MODEL -> ENTITY
  // =====================================================

  PurchaseLineInput toEntity() {
    return PurchaseLineInput(
      productId: productId,
      productUnitId: productUnitId,
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: conversionFactor,
      unitPrice: unitPrice,
      notes: notes,
    );
  }

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
