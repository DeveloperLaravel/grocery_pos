// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PosEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PosEvent()';
  }
}

/// @nodoc
class $PosEventCopyWith<$Res> {
  $PosEventCopyWith(PosEvent _, $Res Function(PosEvent) __);
}

/// Adds pattern-matching-related methods to [PosEvent].
extension PosEventPatterns on PosEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PosLoadRequested value)? loadRequested,
    TResult Function(PosSearchChanged value)? searchChanged,
    TResult Function(PosBarcodeScanned value)? barcodeScanned,
    TResult Function(PosCartProductAdded value)? cartProductAdded,
    TResult Function(PosCartProductRemoved value)? cartProductRemoved,
    TResult Function(PosCartQuantityChanged value)? cartQuantityChanged,
    TResult Function(PosCartCleared value)? cartCleared,
    TResult Function(PosDiscountChanged value)? discountChanged,
    TResult Function(PosCheckoutRequested value)? checkoutRequested,
    TResult Function(PosReceiptDismissed value)? receiptDismissed,
    TResult Function(PosStockAdjustmentRequested value)?
        stockAdjustmentRequested,
    TResult Function(PosProductCreated value)? productCreated,
    TResult Function(PosProductUpdated value)? productUpdated,
    TResult Function(PosProductDeleted value)? productDeleted,
    TResult Function(PosReturnSaleItemRequested value)? returnSaleItemRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case PosSearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case PosBarcodeScanned() when barcodeScanned != null:
        return barcodeScanned(_that);
      case PosCartProductAdded() when cartProductAdded != null:
        return cartProductAdded(_that);
      case PosCartProductRemoved() when cartProductRemoved != null:
        return cartProductRemoved(_that);
      case PosCartQuantityChanged() when cartQuantityChanged != null:
        return cartQuantityChanged(_that);
      case PosCartCleared() when cartCleared != null:
        return cartCleared(_that);
      case PosDiscountChanged() when discountChanged != null:
        return discountChanged(_that);
      case PosCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that);
      case PosReceiptDismissed() when receiptDismissed != null:
        return receiptDismissed(_that);
      case PosStockAdjustmentRequested() when stockAdjustmentRequested != null:
        return stockAdjustmentRequested(_that);
      case PosProductCreated() when productCreated != null:
        return productCreated(_that);
      case PosProductUpdated() when productUpdated != null:
        return productUpdated(_that);
      case PosProductDeleted() when productDeleted != null:
        return productDeleted(_that);
      case PosReturnSaleItemRequested() when returnSaleItemRequested != null:
        return returnSaleItemRequested(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PosLoadRequested value) loadRequested,
    required TResult Function(PosSearchChanged value) searchChanged,
    required TResult Function(PosBarcodeScanned value) barcodeScanned,
    required TResult Function(PosCartProductAdded value) cartProductAdded,
    required TResult Function(PosCartProductRemoved value) cartProductRemoved,
    required TResult Function(PosCartQuantityChanged value) cartQuantityChanged,
    required TResult Function(PosCartCleared value) cartCleared,
    required TResult Function(PosDiscountChanged value) discountChanged,
    required TResult Function(PosCheckoutRequested value) checkoutRequested,
    required TResult Function(PosReceiptDismissed value) receiptDismissed,
    required TResult Function(PosStockAdjustmentRequested value)
        stockAdjustmentRequested,
    required TResult Function(PosProductCreated value) productCreated,
    required TResult Function(PosProductUpdated value) productUpdated,
    required TResult Function(PosProductDeleted value) productDeleted,
    required TResult Function(PosReturnSaleItemRequested value)
        returnSaleItemRequested,
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested():
        return loadRequested(_that);
      case PosSearchChanged():
        return searchChanged(_that);
      case PosBarcodeScanned():
        return barcodeScanned(_that);
      case PosCartProductAdded():
        return cartProductAdded(_that);
      case PosCartProductRemoved():
        return cartProductRemoved(_that);
      case PosCartQuantityChanged():
        return cartQuantityChanged(_that);
      case PosCartCleared():
        return cartCleared(_that);
      case PosDiscountChanged():
        return discountChanged(_that);
      case PosCheckoutRequested():
        return checkoutRequested(_that);
      case PosReceiptDismissed():
        return receiptDismissed(_that);
      case PosStockAdjustmentRequested():
        return stockAdjustmentRequested(_that);
      case PosProductCreated():
        return productCreated(_that);
      case PosProductUpdated():
        return productUpdated(_that);
      case PosProductDeleted():
        return productDeleted(_that);
      case PosReturnSaleItemRequested():
        return returnSaleItemRequested(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PosLoadRequested value)? loadRequested,
    TResult? Function(PosSearchChanged value)? searchChanged,
    TResult? Function(PosBarcodeScanned value)? barcodeScanned,
    TResult? Function(PosCartProductAdded value)? cartProductAdded,
    TResult? Function(PosCartProductRemoved value)? cartProductRemoved,
    TResult? Function(PosCartQuantityChanged value)? cartQuantityChanged,
    TResult? Function(PosCartCleared value)? cartCleared,
    TResult? Function(PosDiscountChanged value)? discountChanged,
    TResult? Function(PosCheckoutRequested value)? checkoutRequested,
    TResult? Function(PosReceiptDismissed value)? receiptDismissed,
    TResult? Function(PosStockAdjustmentRequested value)?
        stockAdjustmentRequested,
    TResult? Function(PosProductCreated value)? productCreated,
    TResult? Function(PosProductUpdated value)? productUpdated,
    TResult? Function(PosProductDeleted value)? productDeleted,
    TResult? Function(PosReturnSaleItemRequested value)?
        returnSaleItemRequested,
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case PosSearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case PosBarcodeScanned() when barcodeScanned != null:
        return barcodeScanned(_that);
      case PosCartProductAdded() when cartProductAdded != null:
        return cartProductAdded(_that);
      case PosCartProductRemoved() when cartProductRemoved != null:
        return cartProductRemoved(_that);
      case PosCartQuantityChanged() when cartQuantityChanged != null:
        return cartQuantityChanged(_that);
      case PosCartCleared() when cartCleared != null:
        return cartCleared(_that);
      case PosDiscountChanged() when discountChanged != null:
        return discountChanged(_that);
      case PosCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that);
      case PosReceiptDismissed() when receiptDismissed != null:
        return receiptDismissed(_that);
      case PosStockAdjustmentRequested() when stockAdjustmentRequested != null:
        return stockAdjustmentRequested(_that);
      case PosProductCreated() when productCreated != null:
        return productCreated(_that);
      case PosProductUpdated() when productUpdated != null:
        return productUpdated(_that);
      case PosProductDeleted() when productDeleted != null:
        return productDeleted(_that);
      case PosReturnSaleItemRequested() when returnSaleItemRequested != null:
        return returnSaleItemRequested(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String query)? searchChanged,
    TResult Function(String barcode)? barcodeScanned,
    TResult Function(ProductEntity product)? cartProductAdded,
    TResult Function(int productId)? cartProductRemoved,
    TResult Function(int productId, double delta)? cartQuantityChanged,
    TResult Function()? cartCleared,
    TResult Function(double discount)? discountChanged,
    TResult Function(double paid, String paymentMethod)? checkoutRequested,
    TResult Function()? receiptDismissed,
    TResult Function(int productId, double delta, String note)?
        stockAdjustmentRequested,
    TResult Function(ProductEntity product)? productCreated,
    TResult Function(int id, ProductEntity product)? productUpdated,
    TResult Function(int productId)? productDeleted,
    TResult Function(
            int saleId, int productId, double quantity, double refundAmount)?
        returnSaleItemRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested() when loadRequested != null:
        return loadRequested();
      case PosSearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case PosBarcodeScanned() when barcodeScanned != null:
        return barcodeScanned(_that.barcode);
      case PosCartProductAdded() when cartProductAdded != null:
        return cartProductAdded(_that.product);
      case PosCartProductRemoved() when cartProductRemoved != null:
        return cartProductRemoved(_that.productId);
      case PosCartQuantityChanged() when cartQuantityChanged != null:
        return cartQuantityChanged(_that.productId, _that.delta);
      case PosCartCleared() when cartCleared != null:
        return cartCleared();
      case PosDiscountChanged() when discountChanged != null:
        return discountChanged(_that.discount);
      case PosCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that.paid, _that.paymentMethod);
      case PosReceiptDismissed() when receiptDismissed != null:
        return receiptDismissed();
      case PosStockAdjustmentRequested() when stockAdjustmentRequested != null:
        return stockAdjustmentRequested(
            _that.productId, _that.delta, _that.note);
      case PosProductCreated() when productCreated != null:
        return productCreated(_that.product);
      case PosProductUpdated() when productUpdated != null:
        return productUpdated(_that.id, _that.product);
      case PosProductDeleted() when productDeleted != null:
        return productDeleted(_that.productId);
      case PosReturnSaleItemRequested() when returnSaleItemRequested != null:
        return returnSaleItemRequested(
            _that.saleId, _that.productId, _that.quantity, _that.refundAmount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String query) searchChanged,
    required TResult Function(String barcode) barcodeScanned,
    required TResult Function(ProductEntity product) cartProductAdded,
    required TResult Function(int productId) cartProductRemoved,
    required TResult Function(int productId, double delta) cartQuantityChanged,
    required TResult Function() cartCleared,
    required TResult Function(double discount) discountChanged,
    required TResult Function(double paid, String paymentMethod)
        checkoutRequested,
    required TResult Function() receiptDismissed,
    required TResult Function(int productId, double delta, String note)
        stockAdjustmentRequested,
    required TResult Function(ProductEntity product) productCreated,
    required TResult Function(int id, ProductEntity product) productUpdated,
    required TResult Function(int productId) productDeleted,
    required TResult Function(
            int saleId, int productId, double quantity, double refundAmount)
        returnSaleItemRequested,
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested():
        return loadRequested();
      case PosSearchChanged():
        return searchChanged(_that.query);
      case PosBarcodeScanned():
        return barcodeScanned(_that.barcode);
      case PosCartProductAdded():
        return cartProductAdded(_that.product);
      case PosCartProductRemoved():
        return cartProductRemoved(_that.productId);
      case PosCartQuantityChanged():
        return cartQuantityChanged(_that.productId, _that.delta);
      case PosCartCleared():
        return cartCleared();
      case PosDiscountChanged():
        return discountChanged(_that.discount);
      case PosCheckoutRequested():
        return checkoutRequested(_that.paid, _that.paymentMethod);
      case PosReceiptDismissed():
        return receiptDismissed();
      case PosStockAdjustmentRequested():
        return stockAdjustmentRequested(
            _that.productId, _that.delta, _that.note);
      case PosProductCreated():
        return productCreated(_that.product);
      case PosProductUpdated():
        return productUpdated(_that.id, _that.product);
      case PosProductDeleted():
        return productDeleted(_that.productId);
      case PosReturnSaleItemRequested():
        return returnSaleItemRequested(
            _that.saleId, _that.productId, _that.quantity, _that.refundAmount);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String query)? searchChanged,
    TResult? Function(String barcode)? barcodeScanned,
    TResult? Function(ProductEntity product)? cartProductAdded,
    TResult? Function(int productId)? cartProductRemoved,
    TResult? Function(int productId, double delta)? cartQuantityChanged,
    TResult? Function()? cartCleared,
    TResult? Function(double discount)? discountChanged,
    TResult? Function(double paid, String paymentMethod)? checkoutRequested,
    TResult? Function()? receiptDismissed,
    TResult? Function(int productId, double delta, String note)?
        stockAdjustmentRequested,
    TResult? Function(ProductEntity product)? productCreated,
    TResult? Function(int id, ProductEntity product)? productUpdated,
    TResult? Function(int productId)? productDeleted,
    TResult? Function(
            int saleId, int productId, double quantity, double refundAmount)?
        returnSaleItemRequested,
  }) {
    final _that = this;
    switch (_that) {
      case PosLoadRequested() when loadRequested != null:
        return loadRequested();
      case PosSearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case PosBarcodeScanned() when barcodeScanned != null:
        return barcodeScanned(_that.barcode);
      case PosCartProductAdded() when cartProductAdded != null:
        return cartProductAdded(_that.product);
      case PosCartProductRemoved() when cartProductRemoved != null:
        return cartProductRemoved(_that.productId);
      case PosCartQuantityChanged() when cartQuantityChanged != null:
        return cartQuantityChanged(_that.productId, _that.delta);
      case PosCartCleared() when cartCleared != null:
        return cartCleared();
      case PosDiscountChanged() when discountChanged != null:
        return discountChanged(_that.discount);
      case PosCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that.paid, _that.paymentMethod);
      case PosReceiptDismissed() when receiptDismissed != null:
        return receiptDismissed();
      case PosStockAdjustmentRequested() when stockAdjustmentRequested != null:
        return stockAdjustmentRequested(
            _that.productId, _that.delta, _that.note);
      case PosProductCreated() when productCreated != null:
        return productCreated(_that.product);
      case PosProductUpdated() when productUpdated != null:
        return productUpdated(_that.id, _that.product);
      case PosProductDeleted() when productDeleted != null:
        return productDeleted(_that.productId);
      case PosReturnSaleItemRequested() when returnSaleItemRequested != null:
        return returnSaleItemRequested(
            _that.saleId, _that.productId, _that.quantity, _that.refundAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PosLoadRequested implements PosEvent {
  const PosLoadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PosLoadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PosEvent.loadRequested()';
  }
}

/// @nodoc

class PosSearchChanged implements PosEvent {
  const PosSearchChanged({required this.query});

  final String query;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosSearchChangedCopyWith<PosSearchChanged> get copyWith =>
      _$PosSearchChangedCopyWithImpl<PosSearchChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosSearchChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'PosEvent.searchChanged(query: $query)';
  }
}

/// @nodoc
abstract mixin class $PosSearchChangedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosSearchChangedCopyWith(
          PosSearchChanged value, $Res Function(PosSearchChanged) _then) =
      _$PosSearchChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$PosSearchChangedCopyWithImpl<$Res>
    implements $PosSearchChangedCopyWith<$Res> {
  _$PosSearchChangedCopyWithImpl(this._self, this._then);

  final PosSearchChanged _self;
  final $Res Function(PosSearchChanged) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(PosSearchChanged(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PosBarcodeScanned implements PosEvent {
  const PosBarcodeScanned({required this.barcode});

  final String barcode;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosBarcodeScannedCopyWith<PosBarcodeScanned> get copyWith =>
      _$PosBarcodeScannedCopyWithImpl<PosBarcodeScanned>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosBarcodeScanned &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'PosEvent.barcodeScanned(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $PosBarcodeScannedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosBarcodeScannedCopyWith(
          PosBarcodeScanned value, $Res Function(PosBarcodeScanned) _then) =
      _$PosBarcodeScannedCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class _$PosBarcodeScannedCopyWithImpl<$Res>
    implements $PosBarcodeScannedCopyWith<$Res> {
  _$PosBarcodeScannedCopyWithImpl(this._self, this._then);

  final PosBarcodeScanned _self;
  final $Res Function(PosBarcodeScanned) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(PosBarcodeScanned(
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PosCartProductAdded implements PosEvent {
  const PosCartProductAdded({required this.product});

  final ProductEntity product;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosCartProductAddedCopyWith<PosCartProductAdded> get copyWith =>
      _$PosCartProductAddedCopyWithImpl<PosCartProductAdded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosCartProductAdded &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'PosEvent.cartProductAdded(product: $product)';
  }
}

/// @nodoc
abstract mixin class $PosCartProductAddedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosCartProductAddedCopyWith(
          PosCartProductAdded value, $Res Function(PosCartProductAdded) _then) =
      _$PosCartProductAddedCopyWithImpl;
  @useResult
  $Res call({ProductEntity product});
}

/// @nodoc
class _$PosCartProductAddedCopyWithImpl<$Res>
    implements $PosCartProductAddedCopyWith<$Res> {
  _$PosCartProductAddedCopyWithImpl(this._self, this._then);

  final PosCartProductAdded _self;
  final $Res Function(PosCartProductAdded) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(PosCartProductAdded(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }
}

/// @nodoc

class PosCartProductRemoved implements PosEvent {
  const PosCartProductRemoved({required this.productId});

  final int productId;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosCartProductRemovedCopyWith<PosCartProductRemoved> get copyWith =>
      _$PosCartProductRemovedCopyWithImpl<PosCartProductRemoved>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosCartProductRemoved &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'PosEvent.cartProductRemoved(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $PosCartProductRemovedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosCartProductRemovedCopyWith(PosCartProductRemoved value,
          $Res Function(PosCartProductRemoved) _then) =
      _$PosCartProductRemovedCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$PosCartProductRemovedCopyWithImpl<$Res>
    implements $PosCartProductRemovedCopyWith<$Res> {
  _$PosCartProductRemovedCopyWithImpl(this._self, this._then);

  final PosCartProductRemoved _self;
  final $Res Function(PosCartProductRemoved) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(PosCartProductRemoved(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class PosCartQuantityChanged implements PosEvent {
  const PosCartQuantityChanged({required this.productId, required this.delta});

  final int productId;
  final double delta;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosCartQuantityChangedCopyWith<PosCartQuantityChanged> get copyWith =>
      _$PosCartQuantityChangedCopyWithImpl<PosCartQuantityChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosCartQuantityChanged &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, delta);

  @override
  String toString() {
    return 'PosEvent.cartQuantityChanged(productId: $productId, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $PosCartQuantityChangedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosCartQuantityChangedCopyWith(PosCartQuantityChanged value,
          $Res Function(PosCartQuantityChanged) _then) =
      _$PosCartQuantityChangedCopyWithImpl;
  @useResult
  $Res call({int productId, double delta});
}

/// @nodoc
class _$PosCartQuantityChangedCopyWithImpl<$Res>
    implements $PosCartQuantityChangedCopyWith<$Res> {
  _$PosCartQuantityChangedCopyWithImpl(this._self, this._then);

  final PosCartQuantityChanged _self;
  final $Res Function(PosCartQuantityChanged) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? delta = null,
  }) {
    return _then(PosCartQuantityChanged(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class PosCartCleared implements PosEvent {
  const PosCartCleared();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PosCartCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PosEvent.cartCleared()';
  }
}

/// @nodoc

class PosDiscountChanged implements PosEvent {
  const PosDiscountChanged({required this.discount});

  final double discount;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosDiscountChangedCopyWith<PosDiscountChanged> get copyWith =>
      _$PosDiscountChangedCopyWithImpl<PosDiscountChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosDiscountChanged &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discount);

  @override
  String toString() {
    return 'PosEvent.discountChanged(discount: $discount)';
  }
}

/// @nodoc
abstract mixin class $PosDiscountChangedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosDiscountChangedCopyWith(
          PosDiscountChanged value, $Res Function(PosDiscountChanged) _then) =
      _$PosDiscountChangedCopyWithImpl;
  @useResult
  $Res call({double discount});
}

/// @nodoc
class _$PosDiscountChangedCopyWithImpl<$Res>
    implements $PosDiscountChangedCopyWith<$Res> {
  _$PosDiscountChangedCopyWithImpl(this._self, this._then);

  final PosDiscountChanged _self;
  final $Res Function(PosDiscountChanged) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? discount = null,
  }) {
    return _then(PosDiscountChanged(
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class PosCheckoutRequested implements PosEvent {
  const PosCheckoutRequested({required this.paid, required this.paymentMethod});

  final double paid;
  final String paymentMethod;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosCheckoutRequestedCopyWith<PosCheckoutRequested> get copyWith =>
      _$PosCheckoutRequestedCopyWithImpl<PosCheckoutRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosCheckoutRequested &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paid, paymentMethod);

  @override
  String toString() {
    return 'PosEvent.checkoutRequested(paid: $paid, paymentMethod: $paymentMethod)';
  }
}

/// @nodoc
abstract mixin class $PosCheckoutRequestedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosCheckoutRequestedCopyWith(PosCheckoutRequested value,
          $Res Function(PosCheckoutRequested) _then) =
      _$PosCheckoutRequestedCopyWithImpl;
  @useResult
  $Res call({double paid, String paymentMethod});
}

/// @nodoc
class _$PosCheckoutRequestedCopyWithImpl<$Res>
    implements $PosCheckoutRequestedCopyWith<$Res> {
  _$PosCheckoutRequestedCopyWithImpl(this._self, this._then);

  final PosCheckoutRequested _self;
  final $Res Function(PosCheckoutRequested) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paid = null,
    Object? paymentMethod = null,
  }) {
    return _then(PosCheckoutRequested(
      paid: null == paid
          ? _self.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PosReceiptDismissed implements PosEvent {
  const PosReceiptDismissed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PosReceiptDismissed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PosEvent.receiptDismissed()';
  }
}

/// @nodoc

class PosStockAdjustmentRequested implements PosEvent {
  const PosStockAdjustmentRequested(
      {required this.productId, required this.delta, required this.note});

  final int productId;
  final double delta;
  final String note;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosStockAdjustmentRequestedCopyWith<PosStockAdjustmentRequested>
      get copyWith => _$PosStockAdjustmentRequestedCopyWithImpl<
          PosStockAdjustmentRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosStockAdjustmentRequested &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, delta, note);

  @override
  String toString() {
    return 'PosEvent.stockAdjustmentRequested(productId: $productId, delta: $delta, note: $note)';
  }
}

/// @nodoc
abstract mixin class $PosStockAdjustmentRequestedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosStockAdjustmentRequestedCopyWith(
          PosStockAdjustmentRequested value,
          $Res Function(PosStockAdjustmentRequested) _then) =
      _$PosStockAdjustmentRequestedCopyWithImpl;
  @useResult
  $Res call({int productId, double delta, String note});
}

/// @nodoc
class _$PosStockAdjustmentRequestedCopyWithImpl<$Res>
    implements $PosStockAdjustmentRequestedCopyWith<$Res> {
  _$PosStockAdjustmentRequestedCopyWithImpl(this._self, this._then);

  final PosStockAdjustmentRequested _self;
  final $Res Function(PosStockAdjustmentRequested) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? delta = null,
    Object? note = null,
  }) {
    return _then(PosStockAdjustmentRequested(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as double,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PosProductCreated implements PosEvent {
  const PosProductCreated({required this.product});

  final ProductEntity product;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosProductCreatedCopyWith<PosProductCreated> get copyWith =>
      _$PosProductCreatedCopyWithImpl<PosProductCreated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosProductCreated &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'PosEvent.productCreated(product: $product)';
  }
}

/// @nodoc
abstract mixin class $PosProductCreatedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosProductCreatedCopyWith(
          PosProductCreated value, $Res Function(PosProductCreated) _then) =
      _$PosProductCreatedCopyWithImpl;
  @useResult
  $Res call({ProductEntity product});
}

/// @nodoc
class _$PosProductCreatedCopyWithImpl<$Res>
    implements $PosProductCreatedCopyWith<$Res> {
  _$PosProductCreatedCopyWithImpl(this._self, this._then);

  final PosProductCreated _self;
  final $Res Function(PosProductCreated) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(PosProductCreated(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }
}

/// @nodoc

class PosProductUpdated implements PosEvent {
  const PosProductUpdated({required this.id, required this.product});

  final int id;
  final ProductEntity product;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosProductUpdatedCopyWith<PosProductUpdated> get copyWith =>
      _$PosProductUpdatedCopyWithImpl<PosProductUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosProductUpdated &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, product);

  @override
  String toString() {
    return 'PosEvent.productUpdated(id: $id, product: $product)';
  }
}

/// @nodoc
abstract mixin class $PosProductUpdatedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosProductUpdatedCopyWith(
          PosProductUpdated value, $Res Function(PosProductUpdated) _then) =
      _$PosProductUpdatedCopyWithImpl;
  @useResult
  $Res call({int id, ProductEntity product});
}

/// @nodoc
class _$PosProductUpdatedCopyWithImpl<$Res>
    implements $PosProductUpdatedCopyWith<$Res> {
  _$PosProductUpdatedCopyWithImpl(this._self, this._then);

  final PosProductUpdated _self;
  final $Res Function(PosProductUpdated) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? product = null,
  }) {
    return _then(PosProductUpdated(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }
}

/// @nodoc

class PosProductDeleted implements PosEvent {
  const PosProductDeleted({required this.productId});

  final int productId;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosProductDeletedCopyWith<PosProductDeleted> get copyWith =>
      _$PosProductDeletedCopyWithImpl<PosProductDeleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosProductDeleted &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'PosEvent.productDeleted(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $PosProductDeletedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosProductDeletedCopyWith(
          PosProductDeleted value, $Res Function(PosProductDeleted) _then) =
      _$PosProductDeletedCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$PosProductDeletedCopyWithImpl<$Res>
    implements $PosProductDeletedCopyWith<$Res> {
  _$PosProductDeletedCopyWithImpl(this._self, this._then);

  final PosProductDeleted _self;
  final $Res Function(PosProductDeleted) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(PosProductDeleted(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class PosReturnSaleItemRequested implements PosEvent {
  const PosReturnSaleItemRequested(
      {required this.saleId,
      required this.productId,
      required this.quantity,
      required this.refundAmount});

  final int saleId;
  final int productId;
  final double quantity;
  final double refundAmount;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosReturnSaleItemRequestedCopyWith<PosReturnSaleItemRequested>
      get copyWith =>
          _$PosReturnSaleItemRequestedCopyWithImpl<PosReturnSaleItemRequested>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosReturnSaleItemRequested &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.refundAmount, refundAmount) ||
                other.refundAmount == refundAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, saleId, productId, quantity, refundAmount);

  @override
  String toString() {
    return 'PosEvent.returnSaleItemRequested(saleId: $saleId, productId: $productId, quantity: $quantity, refundAmount: $refundAmount)';
  }
}

/// @nodoc
abstract mixin class $PosReturnSaleItemRequestedCopyWith<$Res>
    implements $PosEventCopyWith<$Res> {
  factory $PosReturnSaleItemRequestedCopyWith(PosReturnSaleItemRequested value,
          $Res Function(PosReturnSaleItemRequested) _then) =
      _$PosReturnSaleItemRequestedCopyWithImpl;
  @useResult
  $Res call({int saleId, int productId, double quantity, double refundAmount});
}

/// @nodoc
class _$PosReturnSaleItemRequestedCopyWithImpl<$Res>
    implements $PosReturnSaleItemRequestedCopyWith<$Res> {
  _$PosReturnSaleItemRequestedCopyWithImpl(this._self, this._then);

  final PosReturnSaleItemRequested _self;
  final $Res Function(PosReturnSaleItemRequested) _then;

  /// Create a copy of PosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? saleId = null,
    Object? productId = null,
    Object? quantity = null,
    Object? refundAmount = null,
  }) {
    return _then(PosReturnSaleItemRequested(
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      refundAmount: null == refundAmount
          ? _self.refundAmount
          : refundAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
