import 'package:equatable/equatable.dart';

class PurchaseOrder extends Equatable {
  final int id;

  final int supplierId;

  final String invoiceNumber;
  final String? supplierInvoiceNumber;

  final DateTime purchaseDate;
  final DateTime? expectedDeliveryDate;
  final DateTime? completedAt;

  final double subtotal;
  final double discount;
  final double tax;
  final double shippingCost;
  final double additionalCost;
  final double total;

  final double paidAmount;
  final double remainingAmount;

  final String status;
  final String paymentStatus;
  final String paymentMethod;

  final String? notes;
  final String? internalNotes;

  final DateTime createdAt;
  final DateTime updatedAt;

  const PurchaseOrder({
    required this.id,
    required this.supplierId,
    required this.invoiceNumber,
    this.supplierInvoiceNumber,
    required this.purchaseDate,
    this.expectedDeliveryDate,
    this.completedAt,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.shippingCost,
    required this.additionalCost,
    required this.total,
    required this.paidAmount,
    required this.remainingAmount,
    required this.status,
    required this.paymentStatus,
    required this.paymentMethod,
    this.notes,
    this.internalNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isDraft => status == 'draft';

  bool get isConfirmed => status == 'confirmed';

  bool get isPartiallyReceived =>
      status == 'partially_received';

  bool get isReceived => status == 'received';

  bool get isCancelled => status == 'cancelled';

  bool get isPaid => paymentStatus == 'paid';

  bool get isUnpaid => paymentStatus == 'unpaid';

  bool get isPartiallyPaid =>
      paymentStatus == 'partially_paid';

  @override
  List<Object?> get props => [
        id,
        supplierId,
        invoiceNumber,
        supplierInvoiceNumber,
        purchaseDate,
        expectedDeliveryDate,
        completedAt,
        subtotal,
        discount,
        tax,
        shippingCost,
        additionalCost,
        total,
        paidAmount,
        remainingAmount,
        status,
        paymentStatus,
        paymentMethod,
        notes,
        internalNotes,
        createdAt,
        updatedAt,
      ];
}