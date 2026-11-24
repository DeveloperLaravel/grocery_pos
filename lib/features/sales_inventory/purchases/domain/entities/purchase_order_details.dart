
import 'package:equatable/equatable.dart';

import 'purchase_order.dart';
import 'purchase_item.dart';
import 'purchase_payment.dart';
import 'purchase_receipt.dart';

class PurchaseOrderDetails extends Equatable {
  final PurchaseOrder order;
  final String supplierName;

  final List<PurchaseItem> items;
  final List<PurchasePayment> payments;
  final List<PurchaseReceipt> receipts;

  const PurchaseOrderDetails({
    required this.order,
    required this.supplierName,
    this.items = const [],
    this.payments = const [],
    this.receipts = const [],
  });

  // =====================================================
  // CALCULATIONS
  // =====================================================

  double get totalItems {
    return items.fold(
      0.0,
      (sum, item) => sum + item.total,
    );
  }

  int get totalItemsCount => items.length;

  int get totalPaymentsCount => payments.length;

  int get totalReceiptsCount => receipts.length;

  // =====================================================
  // EQUATABLE
  // =====================================================

  @override
  List<Object?> get props => [
        order,
        supplierName,
        items,
        payments,
        receipts,
      ];
}
