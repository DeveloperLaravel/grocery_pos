import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cashier_shifts/domain/entities/product_entity.dart';

part 'pos_event.freezed.dart';

/// All events handled by the POS feature.
///
/// Events are grouped by their responsibility:
/// - Products
/// - Search and barcode
/// - Cart
/// - Checkout and receipt
/// - Inventory
/// - Product management
/// - Sales returns
@freezed
sealed class PosEvent with _$PosEvent {
  // ============================================================
  // Products
  // ============================================================

  /// Load products from the local database.
  const factory PosEvent.loadRequested() = PosLoadRequested;

  // ============================================================
  // Search
  // ============================================================

  /// Search products by name or barcode.
  const factory PosEvent.searchChanged({
    required String query,
  }) = PosSearchChanged;

  /// Find a product using its barcode.
  const factory PosEvent.barcodeScanned({
    required String barcode,
  }) = PosBarcodeScanned;

  // ============================================================
  // Shopping Cart
  // ============================================================

  /// Add a product to the shopping cart.
  const factory PosEvent.cartProductAdded({
    required ProductEntity product,
  }) = PosCartProductAdded;

  /// Remove a product from the shopping cart.
  const factory PosEvent.cartProductRemoved({
    required int productId,
  }) = PosCartProductRemoved;

  /// Increase or decrease a product quantity.
  ///
  /// Positive delta: increase quantity.
  /// Negative delta: decrease quantity.
  const factory PosEvent.cartQuantityChanged({
    required int productId,
    required double delta,
  }) = PosCartQuantityChanged;

  /// Clear all cart items and reset the discount.
  const factory PosEvent.cartCleared() = PosCartCleared;

  // ============================================================
  // Discounts
  // ============================================================

  /// Apply or update the cart discount.
  const factory PosEvent.discountChanged({
    required double discount,
  }) = PosDiscountChanged;

  // ============================================================
  // Checkout
  // ============================================================

  /// Complete a sale.
  ///
  /// Supported payment methods:
  /// - cash
  /// - card
  const factory PosEvent.checkoutRequested({
    required double paid,
    required String paymentMethod,
  }) = PosCheckoutRequested;

  /// Dismiss the last receipt.
  const factory PosEvent.receiptDismissed() = PosReceiptDismissed;

  // ============================================================
  // Inventory
  // ============================================================

  /// Adjust product stock quantity.
  const factory PosEvent.stockAdjustmentRequested({
    required int productId,
    required double delta,
    required String note,
  }) = PosStockAdjustmentRequested;

  // ============================================================
  // Product Management
  // ============================================================

  /// Create a new product.
  const factory PosEvent.productCreated({
    required ProductEntity product,
  }) = PosProductCreated;

  /// Update an existing product.
  const factory PosEvent.productUpdated({
    required int id,
    required ProductEntity product,
  }) = PosProductUpdated;

  /// Delete a product.
  const factory PosEvent.productDeleted({
    required int productId,
  }) = PosProductDeleted;

  // ============================================================
  // Sales Returns
  // ============================================================

  /// Return a previously sold product.
  const factory PosEvent.returnSaleItemRequested({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) = PosReturnSaleItemRequested;
}
