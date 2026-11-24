
import 'package:equatable/equatable.dart';

class PurchasePayment extends Equatable {
  final int id;
  final int purchaseOrderId;
  final String paymentNumber;
  final double amount;
  final DateTime paymentDate;
  final String paymentMethod;
  final String? referenceNumber;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PurchasePayment({
    required this.id,
    required this.purchaseOrderId,
    required this.paymentNumber,
    required this.amount,
    required this.paymentDate,
    required this.paymentMethod,
    this.referenceNumber,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        purchaseOrderId,
        paymentNumber,
        amount,
        paymentDate,
        paymentMethod,
        referenceNumber,
        notes,
        createdAt,
        updatedAt,
      ];
}
