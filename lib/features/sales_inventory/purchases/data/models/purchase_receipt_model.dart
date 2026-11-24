
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/purchase_receipt.dart';

part 'purchase_receipt_model.freezed.dart';
part 'purchase_receipt_model.g.dart';

@freezed
abstract class PurchaseReceiptModel
    with _$PurchaseReceiptModel {
  const PurchaseReceiptModel._();

  const factory PurchaseReceiptModel({
    required int id,
    required int purchaseOrderId,
    required String receiptNumber,
    required DateTime receivedAt,
    String? notes,
    required DateTime createdAt,
  }) = _PurchaseReceiptModel;

  factory PurchaseReceiptModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseReceiptModelFromJson(json);

  // =====================================================
  // DRIFT -> MODEL
  // =====================================================

  factory PurchaseReceiptModel.fromDb(
    PurchaseReceiptDb db,
  ) {
    return PurchaseReceiptModel(
      id: db.id,
      purchaseOrderId: db.purchaseOrderId,
      receiptNumber: db.receiptNumber,
      receivedAt: db.receivedAt,
      notes: db.notes,
      createdAt: db.createdAt,
    );
  }

  // =====================================================
  // ENTITY -> MODEL
  // =====================================================

  factory PurchaseReceiptModel.fromEntity(
    PurchaseReceipt entity,
  ) {
    return PurchaseReceiptModel(
      id: entity.id,
      purchaseOrderId: entity.purchaseOrderId,
      receiptNumber: entity.receiptNumber,
      receivedAt: entity.receivedAt,
      notes: entity.notes,
      createdAt: entity.createdAt,
    );
  }

  // =====================================================
  // MODEL -> ENTITY
  // =====================================================

  PurchaseReceipt toEntity() {
    return PurchaseReceipt(
      id: id,
      purchaseOrderId: purchaseOrderId,
      receiptNumber: receiptNumber,
      receivedAt: receivedAt,
      notes: notes,
      createdAt: createdAt,
    );
  }
}
