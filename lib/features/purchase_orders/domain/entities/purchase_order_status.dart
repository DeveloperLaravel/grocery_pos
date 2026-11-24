enum PurchaseOrderStatus {
  draft,
  confirmed,
  partiallyReceived,
  received,
  cancelled;

  String get value {
    switch (this) {
      case PurchaseOrderStatus.draft:
        return 'draft';
      case PurchaseOrderStatus.confirmed:
        return 'confirmed';
      case PurchaseOrderStatus.partiallyReceived:
        return 'partially_received';
      case PurchaseOrderStatus.received:
        return 'received';
      case PurchaseOrderStatus.cancelled:
        return 'cancelled';
    }
  }

  static PurchaseOrderStatus fromValue(String value) {
    return PurchaseOrderStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PurchaseOrderStatus.draft,
    );
  }
}

enum PurchasePaymentStatus {
  unpaid,
  partiallyPaid,
  paid;

  String get value {
    switch (this) {
      case PurchasePaymentStatus.unpaid:
        return 'unpaid';
      case PurchasePaymentStatus.partiallyPaid:
        return 'partially_paid';
      case PurchasePaymentStatus.paid:
        return 'paid';
    }
  }
}