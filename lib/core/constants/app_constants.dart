
class AppConstants {
  const AppConstants._();

  // Database
  static const String databaseName = 'grocery_pos';

  // Payment Methods
  static const String cashPayment = 'cash';
  static const String cardPayment = 'card';
  static const String transferPayment = 'transfer';

  // Payment Statuses
  static const String paymentPaid = 'paid';
  static const String paymentPartial = 'partial';
  static const String paymentUnpaid = 'unpaid';

  // Stock Movement Types
  static const String stockSale = 'sale';
  static const String stockReturn = 'return';
  static const String stockPurchase = 'purchase';
  static const String stockAdjustment = 'adjustment';
  static const String stockOpening = 'opening';

  // General Statuses
  static const String statusActive = 'active';
  static const String statusInactive = 'inactive';

  // Return Statuses
  static const String returnCompleted = 'completed';
  static const String returnPending = 'pending';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Product Validation
  static const int minProductNameLength = 1;
  static const int maxProductNameLength = 150;
  static const int maxBarcodeLength = 100;
}
