import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/sale_receipt.dart';

part 'pos_state.freezed.dart';

/// Represents the complete state of the POS feature.
///
/// Responsibilities:
/// - Products management state.
/// - Shopping cart state.
/// - Search state.
/// - Financial calculations.
/// - Checkout and receipt state.
/// - Loading, saving and error handling.
@freezed
abstract class PosState with _$PosState {
  const PosState._();

  const factory PosState({
    // ==========================================================
    // Products
    // ==========================================================

    /// Available products.
    @Default(<ProductEntity>[]) List<ProductEntity> products,

    // ==========================================================
    // Shopping Cart
    // ==========================================================

    /// Products currently added to the cart.
    @Default(<CartItem>[]) List<CartItem> cart,

    // ==========================================================
    // Search
    // ==========================================================

    /// Current search query.
    @Default('') String searchQuery,

    // ==========================================================
    // Financial
    // ==========================================================

    /// Applied discount amount.
    @Default(0.0) double discount,

    // ==========================================================
    // Loading States
    // ==========================================================

    /// Indicates whether products are being loaded.
    @Default(false) bool loading,

    /// Indicates whether checkout is being processed.
    @Default(false) bool checkingOut,

    /// Indicates whether a product or stock operation is running.
    @Default(false) bool saving,

    // ==========================================================
    // Receipt
    // ==========================================================

    /// Last successfully created receipt.
    SaleReceipt? lastReceipt,

    // ==========================================================
    // Feedback
    // ==========================================================

    /// Error message.
    String? error,

    /// Success message.
    String? success,
  }) = _PosState;

  // ============================================================
  // Financial Calculations
  // ============================================================

  /// Total amount before discount.
  double get subtotal {
    return cart.fold<double>(
      0.0,
      (sum, item) => sum + item.total,
    );
  }

  /// Total amount after discount.
  double get total {
    return (subtotal - discount).clamp(0.0, double.infinity).toDouble();
  }

  /// Total profit after discount.
  double get totalProfit {
    return cart.fold<double>(
          0.0,
          (sum, item) => sum + item.profit,
        ) -
        discount;
  }

  /// Total quantity of all products in the cart.
  double get totalItems {
    return cart.fold<double>(
      0.0,
      (sum, item) => sum + item.quantity,
    );
  }

  /// Total number of distinct products in the cart.
  int get cartProductsCount => cart.length;

  // ============================================================
  // Cart Status
  // ============================================================

  /// Whether the cart is empty.
  bool get isCartEmpty => cart.isEmpty;

  /// Whether the cart contains products.
  bool get hasCartItems => cart.isNotEmpty;

  /// Whether the cart has a valid discount.
  bool get isDiscountValid {
    return discount >= 0 && discount <= subtotal;
  }

  /// Whether the cart can be checked out.
  bool get canCheckout {
    return hasCartItems &&
        total > 0 &&
        isDiscountValid &&
        !checkingOut &&
        !saving;
  }

  // ============================================================
  // Products Statistics
  // ============================================================

  /// Total number of available products in the loaded list.
  int get productsCount => products.length;

  /// Whether products are available.
  bool get hasProducts => products.isNotEmpty;

  /// Number of products with low stock.
  int get lowStockCount {
    return products
        .where(
          (product) => product.isLowStock,
        )
        .length;
  }

  /// Number of products currently out of stock.
  int get outOfStockCount {
    return products
        .where(
          (product) => product.quantity <= 0,
        )
        .length;
  }

  /// Number of products with available stock.
  int get availableProductsCount {
    return products
        .where(
          (product) => product.quantity > 0,
        )
        .length;
  }

  // ============================================================
  // Operation Status
  // ============================================================

  /// Whether any major operation is running.
  bool get isBusy {
    return loading || checkingOut || saving;
  }

  /// Whether the state contains an error.
  bool get hasError => error != null && error!.isNotEmpty;

  /// Whether the state contains a success message.
  bool get hasSuccess => success != null && success!.isNotEmpty;

  /// Whether a receipt is available.
  bool get hasReceipt => lastReceipt != null;

  /// Whether the screen is initially loading.
  bool get isInitialLoading {
    return loading && products.isEmpty;
  }

  /// Whether the product list is empty after loading.
  bool get isProductsEmpty {
    return !loading && products.isEmpty;
  }
}
