
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/purchase_payment.dart';

part 'purchase_payment_model.freezed.dart';
part 'purchase_payment_model.g.dart';

@freezed
abstract class PurchasePaymentModel
    with _$PurchasePaymentModel {
  const PurchasePaymentModel._();

  const factory PurchasePaymentModel({
    required int id,
    required int purchaseOrderId,
    required String paymentNumber,
    required double amount,
    required DateTime paymentDate,
    required String paymentMethod,
    String? referenceNumber,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PurchasePaymentModel;

  factory PurchasePaymentModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchasePaymentModelFromJson(json);

  // Drift -> Model

  factory PurchasePaymentModel.fromDb(
    PurchasePaymentDb db,
  ) {
    return PurchasePaymentModel(
      id: db.id,
      purchaseOrderId: db.purchaseOrderId,
      paymentNumber: db.paymentNumber,
      amount: db.amount,
      paymentDate: db.paymentDate,
      paymentMethod: db.paymentMethod,
      referenceNumber: db.referenceNumber,
      notes: db.notes,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // Entity -> Model

  factory PurchasePaymentModel.fromEntity(
    PurchasePayment entity,
  ) {
    return PurchasePaymentModel(
      id: entity.id,
      purchaseOrderId: entity.purchaseOrderId,
      paymentNumber: entity.paymentNumber,
      amount: entity.amount,
      paymentDate: entity.paymentDate,
      paymentMethod: entity.paymentMethod,
      referenceNumber: entity.referenceNumber,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // Model -> Entity

  PurchasePayment toEntity() {
    return PurchasePayment(
      id: id,
      purchaseOrderId: purchaseOrderId,
      paymentNumber: paymentNumber,
      amount: amount,
      paymentDate: paymentDate,
      paymentMethod: paymentMethod,
      referenceNumber: referenceNumber,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
