// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosState {
  List<ProductEntity> get products;
  List<CartItem> get cart;
  bool get loading;
  bool get checkingOut;
  double get discount;
  String get paymentMethod;
  String? get error;
  String? get success;
  SaleReceipt? get lastReceipt;

  /// Create a copy of PosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PosStateCopyWith<PosState> get copyWith =>
      _$PosStateCopyWithImpl<PosState>(this as PosState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PosState &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality().equals(other.cart, cart) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.checkingOut, checkingOut) ||
                other.checkingOut == checkingOut) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other.lastReceipt, lastReceipt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(cart),
      loading,
      checkingOut,
      discount,
      paymentMethod,
      error,
      success,
      const DeepCollectionEquality().hash(lastReceipt));

  @override
  String toString() {
    return 'PosState(products: $products, cart: $cart, loading: $loading, checkingOut: $checkingOut, discount: $discount, paymentMethod: $paymentMethod, error: $error, success: $success, lastReceipt: $lastReceipt)';
  }
}

/// @nodoc
abstract mixin class $PosStateCopyWith<$Res> {
  factory $PosStateCopyWith(PosState value, $Res Function(PosState) _then) =
      _$PosStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductEntity> products,
      List<CartItem> cart,
      bool loading,
      bool checkingOut,
      double discount,
      String paymentMethod,
      String? error,
      String? success,
      SaleReceipt? lastReceipt});
}

/// @nodoc
class _$PosStateCopyWithImpl<$Res> implements $PosStateCopyWith<$Res> {
  _$PosStateCopyWithImpl(this._self, this._then);

  final PosState _self;
  final $Res Function(PosState) _then;

  /// Create a copy of PosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? cart = null,
    Object? loading = null,
    Object? checkingOut = null,
    Object? discount = null,
    Object? paymentMethod = null,
    Object? error = freezed,
    Object? success = freezed,
    Object? lastReceipt = freezed,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      cart: null == cart
          ? _self.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkingOut: null == checkingOut
          ? _self.checkingOut
          : checkingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReceipt: freezed == lastReceipt
          ? _self.lastReceipt
          : lastReceipt // ignore: cast_nullable_to_non_nullable
              as SaleReceipt?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PosState].
extension PosStatePatterns on PosState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PosState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_PosState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PosState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ProductEntity> products,
            List<CartItem> cart,
            bool loading,
            bool checkingOut,
            double discount,
            String paymentMethod,
            String? error,
            String? success,
            SaleReceipt? lastReceipt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(
            _that.products,
            _that.cart,
            _that.loading,
            _that.checkingOut,
            _that.discount,
            _that.paymentMethod,
            _that.error,
            _that.success,
            _that.lastReceipt);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ProductEntity> products,
            List<CartItem> cart,
            bool loading,
            bool checkingOut,
            double discount,
            String paymentMethod,
            String? error,
            String? success,
            SaleReceipt? lastReceipt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState():
        return $default(
            _that.products,
            _that.cart,
            _that.loading,
            _that.checkingOut,
            _that.discount,
            _that.paymentMethod,
            _that.error,
            _that.success,
            _that.lastReceipt);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ProductEntity> products,
            List<CartItem> cart,
            bool loading,
            bool checkingOut,
            double discount,
            String paymentMethod,
            String? error,
            String? success,
            SaleReceipt? lastReceipt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(
            _that.products,
            _that.cart,
            _that.loading,
            _that.checkingOut,
            _that.discount,
            _that.paymentMethod,
            _that.error,
            _that.success,
            _that.lastReceipt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PosState extends PosState {
  const _PosState(
      {final List<ProductEntity> products = const <ProductEntity>[],
      final List<CartItem> cart = const <CartItem>[],
      this.loading = false,
      this.checkingOut = false,
      this.discount = 0,
      this.paymentMethod = 'cash',
      this.error,
      this.success,
      this.lastReceipt})
      : _products = products,
        _cart = cart,
        super._();

  final List<ProductEntity> _products;
  @override
  @JsonKey()
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<CartItem> _cart;
  @override
  @JsonKey()
  List<CartItem> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool checkingOut;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  final String? error;
  @override
  final String? success;
  @override
  final SaleReceipt? lastReceipt;

  /// Create a copy of PosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PosStateCopyWith<_PosState> get copyWith =>
      __$PosStateCopyWithImpl<_PosState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PosState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.checkingOut, checkingOut) ||
                other.checkingOut == checkingOut) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other.lastReceipt, lastReceipt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_cart),
      loading,
      checkingOut,
      discount,
      paymentMethod,
      error,
      success,
      const DeepCollectionEquality().hash(lastReceipt));

  @override
  String toString() {
    return 'PosState(products: $products, cart: $cart, loading: $loading, checkingOut: $checkingOut, discount: $discount, paymentMethod: $paymentMethod, error: $error, success: $success, lastReceipt: $lastReceipt)';
  }
}

/// @nodoc
abstract mixin class _$PosStateCopyWith<$Res>
    implements $PosStateCopyWith<$Res> {
  factory _$PosStateCopyWith(_PosState value, $Res Function(_PosState) _then) =
      __$PosStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> products,
      List<CartItem> cart,
      bool loading,
      bool checkingOut,
      double discount,
      String paymentMethod,
      String? error,
      String? success,
      SaleReceipt? lastReceipt});
}

/// @nodoc
class __$PosStateCopyWithImpl<$Res> implements _$PosStateCopyWith<$Res> {
  __$PosStateCopyWithImpl(this._self, this._then);

  final _PosState _self;
  final $Res Function(_PosState) _then;

  /// Create a copy of PosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? cart = null,
    Object? loading = null,
    Object? checkingOut = null,
    Object? discount = null,
    Object? paymentMethod = null,
    Object? error = freezed,
    Object? success = freezed,
    Object? lastReceipt = freezed,
  }) {
    return _then(_PosState(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      cart: null == cart
          ? _self._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkingOut: null == checkingOut
          ? _self.checkingOut
          : checkingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReceipt: freezed == lastReceipt
          ? _self.lastReceipt
          : lastReceipt // ignore: cast_nullable_to_non_nullable
              as SaleReceipt?,
    ));
  }
}

// dart format on
