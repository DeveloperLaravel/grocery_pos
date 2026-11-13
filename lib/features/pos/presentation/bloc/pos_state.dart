import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/sale_receipt.dart';

part 'pos_state.freezed.dart';

@freezed
abstract class PosState with _$PosState {
  const PosState._();

  const factory PosState({
    @Default([]) List<ProductEntity> products,
    @Default([]) List<CartItem> cart,

    @Default('') String searchQuery,

    @Default(0.0) double discount,

    @Default(false) bool loading,
    @Default(false) bool checkingOut,
    @Default(false) bool saving,

    SaleReceipt? lastReceipt,

    String? error,
    String? success,
  }) = _PosState;

  double get subtotal {
    return cart.fold(
      0.0,
      (sum, item) => sum + item.total,
    );
  }

  double get total {
    return (subtotal - discount)
        .clamp(0.0, double.infinity)
        .toDouble();
  }

  double get totalItems {
    return cart.fold(
      0.0,
      (sum, item) => sum + item.quantity,
    );
  }

  double get totalProfit {
    return cart.fold(
      0.0,
      (sum, item) => sum + item.profit,
    ) - discount;
  }

  double get isDiscountValid {
    return discount >= 0 && discount <= subtotal ? 1 : 0;
  }

  bool get isCartEmpty => cart.isEmpty;

  bool get canCheckout {
    return cart.isNotEmpty &&
        total > 0 &&
        discount >= 0 &&
        discount <= subtotal &&
        !checkingOut;
  }

  int get cartProductsCount => cart.length;

  int get lowStockCount {
    return products.where((product) => product.isLowStock).length;
  }
}