
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

  static PurchaseOrderStatus fromValue(String? value) {
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

  static PurchasePaymentStatus fromValue(String? value) {
    return PurchasePaymentStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PurchasePaymentStatus.unpaid,
    );
  }
}

enum PurchasePaymentMethod {
  cash,
  bankTransfer,
  cheque,
  card;

  String get value {
    switch (this) {
      case PurchasePaymentMethod.cash:
        return 'cash';
      case PurchasePaymentMethod.bankTransfer:
        return 'bank_transfer';
      case PurchasePaymentMethod.cheque:
        return 'cheque';
      case PurchasePaymentMethod.card:
        return 'card';
    }
  }

  static PurchasePaymentMethod fromValue(String? value) {
    return PurchasePaymentMethod.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PurchasePaymentMethod.bankTransfer,
    );
  }
}
