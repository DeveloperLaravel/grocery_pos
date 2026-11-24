
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/database/app_database.dart';
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

    required String productName,
    String? unitName,

    @Default(0.0) double quantity,
    @Default(1.0) double conversionFactor,
    @Default(0.0) double baseQuantity,

    @Default(0.0) double unitPrice,
    @Default(0.0) double baseUnitCost,
    @Default(0.0) double total,

    String? notes,
  }) = _PurchaseItemModel;

  factory PurchaseItemModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PurchaseItemModelFromJson(json);

  // DRIFT -> MODEL
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

  // MODEL -> ENTITY
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

  // ENTITY -> MODEL
  factory PurchaseItemModel.fromEntity(PurchaseItem entity) {
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
}
