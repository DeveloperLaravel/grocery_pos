import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product_entity.dart';

import '../../domain/usecases/add_product_usecase.dart';
import '../../domain/usecases/adjust_stock_usecase.dart';
import '../../domain/usecases/checkout_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_product_by_barcode_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/return_sale_item_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';

import 'pos_event.dart';
import 'pos_state.dart';

@injectable
class PosBloc extends Bloc<PosEvent, PosState> {
  final GetProductsUseCase _getProducts;
  final GetProductByBarcodeUseCase _getProductByBarcode;
  final AddProductUseCase _addProduct;
  final UpdateProductUseCase _updateProduct;
  final DeleteProductUseCase _deleteProduct;
  final AdjustStockUseCase _adjustStock;
  final CheckoutUseCase _checkout;
  final ReturnSaleItemUseCase _returnSaleItem;

  PosBloc(
    this._getProducts,
    this._getProductByBarcode,
    this._addProduct,
    this._updateProduct,
    this._deleteProduct,
    this._adjustStock,
    this._checkout,
    this._returnSaleItem,
  ) : super(const PosState()) {
    on<PosLoadRequested>(_onLoadRequested);
    on<PosSearchChanged>(_onSearchChanged);
    on<PosBarcodeScanned>(_onBarcodeScanned);

    on<PosCartProductAdded>(_onCartProductAdded);
    on<PosCartProductRemoved>(_onCartProductRemoved);
    on<PosCartQuantityChanged>(_onCartQuantityChanged);
    on<PosCartCleared>(_onCartCleared);

    on<PosDiscountChanged>(_onDiscountChanged);
    on<PosCheckoutRequested>(_onCheckoutRequested);

    on<PosReceiptDismissed>(_onReceiptDismissed);

    on<PosStockAdjustmentRequested>(_onStockAdjustmentRequested);
    on<PosProductCreated>(_onProductCreated);
    on<PosProductUpdated>(_onProductUpdated);
    on<PosProductDeleted>(_onProductDeleted);

    on<PosReturnSaleItemRequested>(_onReturnSaleItemRequested);
  }

  // ---------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------

  void _setError(
    Emitter<PosState> emit,
    String message,
  ) {
    emit(state.copyWith(
      error: message,
      success: null,
    ));
  }

  // void _setSuccess(
  //   Emitter<PosState> emit,
  //   String message,
  // ) {
  //   emit(state.copyWith(
  //     success: message,
  //     error: null,
  //   ));
  // }

  // Future<void> _reloadProducts() async {
  //   final result = await _getProducts(
  //     query: state.searchQuery,
  //   ).run();

  //   result.match(
  //     (failure) {
  //       // لا نغيّر حالة الشاشة من هنا؛
  //       // تستقبل عملية التحميل التالية الخطأ بشكل طبيعي.
  //     },
  //     (products) {
  //       if (!isClosed) {
  //         add(const PosEvent.loadRequested());
  //       }
  //     },
  //   );
  // }

  // ---------------------------------------------------------
  // Products
  // ---------------------------------------------------------

  Future<void> _onLoadRequested(
    PosLoadRequested event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: null,
      success: null,
    ));

    final result = await _getProducts(
      query: state.searchQuery,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
      (products) {
        emit(state.copyWith(
          loading: false,
          products: products,
          error: null,
        ));
      },
    );
  }

  Future<void> _onSearchChanged(
    PosSearchChanged event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(
      searchQuery: event.query,
      loading: true,
      error: null,
    ));

    final result = await _getProducts(
      query: event.query,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
      (products) {
        emit(state.copyWith(
          loading: false,
          products: products,
          error: null,
        ));
      },
    );
  }

  Future<void> _onBarcodeScanned(
    PosBarcodeScanned event,
    Emitter<PosState> emit,
  ) async {
    final barcode = event.barcode.trim();

    if (barcode.isEmpty) return;

    final result = await _getProductByBarcode(barcode).run();

    result.match(
      (failure) => _setError(emit, failure.message),
      (product) {
        if (product == null) {
          _setError(emit, 'لم يتم العثور على المنتج');
          return;
        }

        _addProductToCart(product, emit);
      },
    );
  }

  // ---------------------------------------------------------
  // Cart
  // ---------------------------------------------------------

  void _addProductToCart(
    ProductEntity product,
    Emitter<PosState> emit,
  ) {
    final productId = product.id;

    if (productId == null) {
      _setError(emit, 'لا يمكن إضافة منتج غير محفوظ في قاعدة البيانات');
      return;
    }

    if (product.quantity <= 0) {
      _setError(emit, 'المنتج غير متوفر في المخزون');
      return;
    }

    final cart = List<CartItem>.from(state.cart);

    final index = cart.indexWhere(
      (item) => item.product.id == productId,
    );

    if (index >= 0) {
      final oldItem = cart[index];
      final newQuantity = oldItem.quantity + 1;

      if (newQuantity > product.quantity) {
        _setError(emit, 'الكمية المطلوبة أكبر من المخزون المتاح');
        return;
      }

      cart[index] = oldItem.copyWith(
        quantity: newQuantity,
      );
    } else {
      cart.add(CartItem(
        product: product,
        quantity: 1,
      ));
    }

    emit(state.copyWith(
      cart: cart,
      error: null,
      success: null,
    ));
  }

  void _onCartProductAdded(
    PosCartProductAdded event,
    Emitter<PosState> emit,
  ) {
    _addProductToCart(event.product, emit);
  }

  void _onCartProductRemoved(
    PosCartProductRemoved event,
    Emitter<PosState> emit,
  ) {
    final cart = state.cart
        .where((item) => item.product.id != event.productId)
        .toList();

    emit(state.copyWith(
      cart: cart,
      error: null,
    ));
  }

  void _onCartQuantityChanged(
    PosCartQuantityChanged event,
    Emitter<PosState> emit,
  ) {
    final cart = <CartItem>[];

    for (final item in state.cart) {
      if (item.product.id != event.productId) {
        cart.add(item);
        continue;
      }

      final newQuantity = item.quantity + event.delta;

      if (newQuantity <= 0) continue;

      if (newQuantity > item.product.quantity) {
        _setError(emit, 'لا توجد كمية كافية في المخزون');
        return;
      }

      cart.add(item.copyWith(quantity: newQuantity));
    }

    emit(state.copyWith(
      cart: cart,
      error: null,
    ));
  }

  void _onCartCleared(
    PosCartCleared event,
    Emitter<PosState> emit,
  ) {
    emit(state.copyWith(
      cart: [],
      discount: 0,
      error: null,
      success: null,
    ));
  }

  // ---------------------------------------------------------
  // Discount
  // ---------------------------------------------------------

  void _onDiscountChanged(
    PosDiscountChanged event,
    Emitter<PosState> emit,
  ) {
    if (event.discount < 0 || event.discount > state.subtotal) {
      _setError(emit, 'قيمة الخصم غير صحيحة');
      return;
    }

    emit(state.copyWith(
      discount: event.discount,
      error: null,
    ));
  }

  // ---------------------------------------------------------
  // Checkout
  // ---------------------------------------------------------

  Future<void> _onCheckoutRequested(
    PosCheckoutRequested event,
    Emitter<PosState> emit,
  ) async {
    if (!state.canCheckout) {
      _setError(emit, 'يرجى مراجعة بيانات الفاتورة');
      return;
    }

    if (event.paid < state.total) {
      _setError(emit, 'المبلغ المدفوع غير كافٍ');
      return;
    }

    if (event.paid < 0) {
      _setError(emit, 'المبلغ المدفوع غير صحيح');
      return;
    }

    if (!['cash', 'card'].contains(event.paymentMethod)) {
      _setError(emit, 'طريقة الدفع غير صحيحة');
      return;
    }

    final items = List<CartItem>.from(state.cart);
    final discount = state.discount;

    emit(state.copyWith(
      checkingOut: true,
      error: null,
      success: null,
    ));

    final result = await _checkout(
      items: items,
      discount: discount,
      paid: event.paid,
      paymentMethod: event.paymentMethod,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          checkingOut: false,
          error: failure.message,
        ));
      },
      (receipt) {
        emit(state.copyWith(
          checkingOut: false,
          lastReceipt: receipt,
          cart: [],
          discount: 0,
          success: 'تمت عملية البيع بنجاح',
          error: null,
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }

  void _onReceiptDismissed(
    PosReceiptDismissed event,
    Emitter<PosState> emit,
  ) {
    emit(state.copyWith(
      lastReceipt: null,
      error: null,
      success: null,
    ));
  }

  // ---------------------------------------------------------
  // Stock
  // ---------------------------------------------------------

  Future<void> _onStockAdjustmentRequested(
    PosStockAdjustmentRequested event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(
      saving: true,
      error: null,
      success: null,
    ));

    final result = await _adjustStock(
      productId: event.productId,
      delta: event.delta,
      note: event.note,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          saving: false,
          error: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          saving: false,
          success: 'تم تعديل المخزون بنجاح',
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }

  // ---------------------------------------------------------
  // Create Product
  // ---------------------------------------------------------

  Future<void> _onProductCreated(
    PosProductCreated event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(saving: true, error: null));

    final result = await _addProduct(event.product).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          saving: false,
          error: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          saving: false,
          success: 'تمت إضافة المنتج بنجاح',
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }

  // ---------------------------------------------------------
  // Update Product
  // ---------------------------------------------------------

  Future<void> _onProductUpdated(
    PosProductUpdated event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(saving: true, error: null));

    final result = await _updateProduct(
      id: event.id,
      product: event.product,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          saving: false,
          error: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          saving: false,
          success: 'تم تحديث المنتج بنجاح',
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }

  // ---------------------------------------------------------
  // Delete Product
  // ---------------------------------------------------------

  Future<void> _onProductDeleted(
    PosProductDeleted event,
    Emitter<PosState> emit,
  ) async {
    emit(state.copyWith(saving: true, error: null));

    final result = await _deleteProduct(event.productId).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          saving: false,
          error: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          saving: false,
          success: 'تم حذف المنتج بنجاح',
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }

  // ---------------------------------------------------------
  // Returns
  // ---------------------------------------------------------

  Future<void> _onReturnSaleItemRequested(
    PosReturnSaleItemRequested event,
    Emitter<PosState> emit,
  ) async {
    if (event.quantity <= 0 || event.refundAmount < 0) {
      _setError(emit, 'بيانات المرتجع غير صحيحة');
      return;
    }

    emit(state.copyWith(
      saving: true,
      error: null,
      success: null,
    ));

    final result = await _returnSaleItem(
      saleId: event.saleId,
      productId: event.productId,
      quantity: event.quantity,
      refundAmount: event.refundAmount,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          saving: false,
          error: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          saving: false,
          success: 'تم إرجاع الصنف بنجاح',
        ));

        add(const PosEvent.loadRequested());
      },
    );
  }
}