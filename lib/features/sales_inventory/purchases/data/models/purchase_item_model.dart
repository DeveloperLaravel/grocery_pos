
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/purchase_item.dart';

part 'purchase_item_model.freezed.dart';
part 'purchase_item_model.g.dart';

@freezed
abstract class PurchaseItemModel with _$PurchaseItemModel {
  const PurchaseItemModel._();

  const factory PurchaseItemModel({
    required int id,
    required int purchaseOrderId,
    required int productId,
    int? productUnitId,

    // Product snapshot
    required String productName,
    required String unitName,

    // Quantity
    required double quantity,
    required double conversionFactor,
    required double baseQuantity,

    // Pricing
    required double unitPrice,
    required double baseUnitCost,
    required double total,

    String? notes,
  }) = _PurchaseItemModel;

  factory PurchaseItemModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseItemModelFromJson(json);

  // =====================================================
  // Entity -> Model
  // =====================================================

  factory PurchaseItemModel.fromEntity(
    PurchaseItem entity,
  ) {
    return PurchaseItemModel(
      id: entity.id,
      purchaseOrderId: entity.purchaseOrderId,
      productId: entity.productId,
      productUnitId: entity.productUnitId,
      productName: entity.productName,
      unitName: entity.unitName,
      quantity: entity.quantity,
      conversionFactor: entity.conversionFactor,
      baseQuantity: entity.baseQuantity,
      unitPrice: entity.unitPrice,
      baseUnitCost: entity.baseUnitCost,
      total: entity.total,
      notes: entity.notes,
    );
  }

  // =====================================================
  // Model -> Entity
  // =====================================================

  PurchaseItem toEntity() {
    return PurchaseItem(
      id: id,
      purchaseOrderId: purchaseOrderId,
      productId: productId,
      productUnitId: productUnitId,
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: conversionFactor,
      baseQuantity: baseQuantity,
      unitPrice: unitPrice,
      baseUnitCost: baseUnitCost,
      total: total,
      notes: notes,
    );
  }
  factory PurchaseItemModel.fromDb(PurchaseItemDb db) {
  return PurchaseItemModel(
    id: db.id,
    purchaseOrderId: db.purchaseOrderId,
    productId: db.productId,
    productUnitId: db.productUnitId,
    productName: db.productName,
    unitName: db.unitName,
    quantity: db.quantity,
    conversionFactor: db.conversionFactor,
    baseQuantity: db.baseQuantity,
    unitPrice: db.unitPrice,
    baseUnitCost: db.baseUnitCost,
    total: db.total,
    notes: db.notes,
  );
}
}
