
import 'package:equatable/equatable.dart';

class PurchaseReceipt extends Equatable {
  final int id;
  final int purchaseOrderId;
  final String receiptNumber;
  final DateTime receivedAt;
  final String? notes;
  final DateTime createdAt;

  const PurchaseReceipt({
    required this.id,
    required this.purchaseOrderId,
    required this.receiptNumber,
    required this.receivedAt,
    this.notes,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        purchaseOrderId,
        receiptNumber,
        receivedAt,
        notes,
        createdAt,
      ];
}
