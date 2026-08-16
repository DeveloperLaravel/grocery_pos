import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';
import 'package:grocery_pos/features/pos/domain/usecases/checkout_sale.dart';
import 'package:grocery_pos/features/pos/domain/usecases/find_product_by_barcode.dart';
import 'package:grocery_pos/features/pos/domain/usecases/get_pos_products.dart';
import 'package:grocery_pos/features/pos/presentation/bloc/pos_state.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

sealed class PosEvent {}
class LoadProducts extends PosEvent { final String query; LoadProducts([this.query = '']); }
class AddProductToCart extends PosEvent { final ProductEntity product; AddProductToCart(this.product); }
class ScanBarcode extends PosEvent { final String barcode; ScanBarcode(this.barcode); }
class ChangeQty extends PosEvent { final int productId; final double delta; ChangeQty(this.productId, this.delta); }
class RemoveCartLine extends PosEvent { final int productId; RemoveCartLine(this.productId); }
class SetDiscount extends PosEvent { final double value; SetDiscount(this.value); }
class SetPaymentMethod extends PosEvent { final String value; SetPaymentMethod(this.value); }
class ClearCart extends PosEvent {}
class ClearPosMessage extends PosEvent {}
class Checkout extends PosEvent { final double paid; final String method; final void Function(SaleReceipt)? onSuccess; Checkout(this.paid, this.method, {this.onSuccess}); }

@injectable
class PosBloc extends Bloc<PosEvent, PosState> {
  final GetPosProducts getProducts;
  final FindProductByBarcode findByBarcode;
  final CheckoutSale checkoutSale;

  PosBloc(this.getProducts, this.findByBarcode, this.checkoutSale) : super(const PosState()) {
    on<LoadProducts>(_load);
    on<AddProductToCart>(_add);
    on<ScanBarcode>(_scan);
    on<ChangeQty>(_qty);
    on<RemoveCartLine>(_remove);
    on<SetDiscount>(_discount);
    on<SetPaymentMethod>((e, emit) => emit(state.copyWith(paymentMethod: e.value)));
    on<ClearCart>((e, emit) => emit(state.copyWith(cart: const [], discount: 0, error: null, success: null)));
    on<ClearPosMessage>((e, emit) => emit(state.copyWith(error: null, success: null)));
    on<Checkout>(_checkout);
  }

  Future<void> _load(LoadProducts e, Emitter<PosState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    final result = await getProducts(e.query).run();
    result.match(
      (f) => emit(state.copyWith(loading: false, error: f.message)),
      (products) => emit(state.copyWith(loading: false, products: products)),
    );
  }

  void _add(AddProductToCart e, Emitter<PosState> emit) {
    final product = e.product;
    if (product.quantity <= 0) {
      emit(state.copyWith(error: 'المنتج ${product.name} غير متوفر في المخزون'));
      return;
    }
    final cart = [...state.cart];
    final index = cart.indexWhere((x) => x.product.id == product.id);
    if (index == -1) {
      cart.add(CartItem(product: product, quantity: 1));
    } else {
      final next = cart[index].quantity + 1;
      if (next > product.quantity) {
        emit(state.copyWith(error: 'لا توجد كمية كافية من ${product.name}'));
        return;
      }
      cart[index] = cart[index].copyWith(quantity: next);
    }
    emit(state.copyWith(cart: cart, error: null, success: null));
  }

  Future<void> _scan(ScanBarcode e, Emitter<PosState> emit) async {
    final barcode = e.barcode.trim();
    if (barcode.isEmpty) return;
    final result = await findByBarcode(barcode).run();
    result.match(
      (f) => emit(state.copyWith(error: f.message)),
      (product) {
        if (product == null) {
          emit(state.copyWith(error: 'الباركود $barcode غير موجود'));
        } else {
          add(AddProductToCart(product));
        }
      },
    );
  }

  void _qty(ChangeQty e, Emitter<PosState> emit) {
    final cart = [...state.cart];
    final index = cart.indexWhere((x) => x.product.id == e.productId);
    if (index < 0) return;
    final item = cart[index];
    final next = item.quantity + e.delta;
    if (next <= 0) {
      cart.removeAt(index);
    } else if (next <= item.product.quantity) {
      cart[index] = item.copyWith(quantity: next);
    } else {
      emit(state.copyWith(error: 'المتاح من ${item.product.name}: ${item.product.quantity}'));
      return;
    }
    emit(state.copyWith(cart: cart, error: null));
  }

  void _remove(RemoveCartLine e, Emitter<PosState> emit) {
    emit(state.copyWith(cart: state.cart.where((x) => x.product.id != e.productId).toList(), error: null));
  }

  void _discount(SetDiscount e, Emitter<PosState> emit) {
    final value = e.value.clamp(0, state.subtotal).toDouble();
    emit(state.copyWith(discount: value, error: null));
  }

  Future<void> _checkout(Checkout e, Emitter<PosState> emit) async {
    if (state.cart.isEmpty) {
      emit(state.copyWith(error: 'السلة فارغة'));
      return;
    }
    if (e.paid < state.total) {
      emit(state.copyWith(error: 'المبلغ المدفوع أقل من الإجمالي'));
      return;
    }
    emit(state.copyWith(checkingOut: true, error: null, success: null));
    final result = await checkoutSale(CheckoutParams(
      items: state.cart,
      discount: state.discount,
      paid: e.paid,
      paymentMethod: e.method,
    )).run();
    result.match(
      (f) => emit(state.copyWith(checkingOut: false, error: f.message)),
      (receipt) {
        e.onSuccess?.call(receipt);
        emit(state.copyWith(
          checkingOut: false,
          cart: const [],
          discount: 0,
          lastReceipt: receipt,
          success: 'تمت عملية البيع وحفظ ${receipt.invoiceNumber}',
        ));
        add(LoadProducts());
      },
    );
  }
}
