import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

part 'pos_state.freezed.dart';

@freezed
abstract class PosState with _$PosState {
  const PosState._();
  const factory PosState({
    @Default(<ProductEntity>[]) List<ProductEntity> products,
    @Default(<CartItem>[]) List<CartItem> cart,
    @Default(false) bool loading,
    @Default(false) bool checkingOut,
    @Default(0) double discount,
    @Default('cash') String paymentMethod,
    String? error,
    String? success,
    SaleReceipt? lastReceipt,
  }) = _PosState;

  double get subtotal => cart.fold<double>(0, (sum, item) => sum + item.total);
  double get total => (subtotal - discount).clamp(0, double.infinity).toDouble();
  int get linesCount => cart.length;
  double get itemsCount => cart.fold<double>(0, (sum, item) => sum + item.quantity);
}
