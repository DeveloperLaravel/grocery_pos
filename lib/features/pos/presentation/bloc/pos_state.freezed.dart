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
// ==========================================================
// Products
// ==========================================================
  /// Available products.
  List<ProductEntity>
      get products; // ==========================================================
// Shopping Cart
// ==========================================================
  /// Products currently added to the cart.
  List<CartItem>
      get cart; // ==========================================================
// Search
// ==========================================================
  /// Current search query.
  String
      get searchQuery; // ==========================================================
// Financial
// ==========================================================
  /// Applied discount amount.
  double
      get discount; // ==========================================================
// Loading States
// ==========================================================
  /// Indicates whether products are being loaded.
  bool get loading;

  /// Indicates whether checkout is being processed.
  bool get checkingOut;

  /// Indicates whether a product or stock operation is running.
  bool get saving; // ==========================================================
// Receipt
// ==========================================================
  /// Last successfully created receipt.
  SaleReceipt?
      get lastReceipt; // ==========================================================
// Feedback
// ==========================================================
  /// Error message.
  String? get error;

  /// Success message.
  String? get success;

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
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.checkingOut, checkingOut) ||
                other.checkingOut == checkingOut) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.lastReceipt, lastReceipt) ||
                other.lastReceipt == lastReceipt) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(cart),
      searchQuery,
      discount,
      loading,
      checkingOut,
      saving,
      lastReceipt,
      error,
      success);

  @override
  String toString() {
    return 'PosState(products: $products, cart: $cart, searchQuery: $searchQuery, discount: $discount, loading: $loading, checkingOut: $checkingOut, saving: $saving, lastReceipt: $lastReceipt, error: $error, success: $success)';
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
      String searchQuery,
      double discount,
      bool loading,
      bool checkingOut,
      bool saving,
      SaleReceipt? lastReceipt,
      String? error,
      String? success});
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
    Object? searchQuery = null,
    Object? discount = null,
    Object? loading = null,
    Object? checkingOut = null,
    Object? saving = null,
    Object? lastReceipt = freezed,
    Object? error = freezed,
    Object? success = freezed,
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
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkingOut: null == checkingOut
          ? _self.checkingOut
          : checkingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      saving: null == saving
          ? _self.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      lastReceipt: freezed == lastReceipt
          ? _self.lastReceipt
          : lastReceipt // ignore: cast_nullable_to_non_nullable
              as SaleReceipt?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
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
            String searchQuery,
            double discount,
            bool loading,
            bool checkingOut,
            bool saving,
            SaleReceipt? lastReceipt,
            String? error,
            String? success)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(
            _that.products,
            _that.cart,
            _that.searchQuery,
            _that.discount,
            _that.loading,
            _that.checkingOut,
            _that.saving,
            _that.lastReceipt,
            _that.error,
            _that.success);
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
            String searchQuery,
            double discount,
            bool loading,
            bool checkingOut,
            bool saving,
            SaleReceipt? lastReceipt,
            String? error,
            String? success)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState():
        return $default(
            _that.products,
            _that.cart,
            _that.searchQuery,
            _that.discount,
            _that.loading,
            _that.checkingOut,
            _that.saving,
            _that.lastReceipt,
            _that.error,
            _that.success);
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
            String searchQuery,
            double discount,
            bool loading,
            bool checkingOut,
            bool saving,
            SaleReceipt? lastReceipt,
            String? error,
            String? success)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PosState() when $default != null:
        return $default(
            _that.products,
            _that.cart,
            _that.searchQuery,
            _that.discount,
            _that.loading,
            _that.checkingOut,
            _that.saving,
            _that.lastReceipt,
            _that.error,
            _that.success);
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
      this.searchQuery = '',
      this.discount = 0.0,
      this.loading = false,
      this.checkingOut = false,
      this.saving = false,
      this.lastReceipt,
      this.error,
      this.success})
      : _products = products,
        _cart = cart,
        super._();

// ==========================================================
// Products
// ==========================================================
  /// Available products.
  final List<ProductEntity> _products;
// ==========================================================
// Products
// ==========================================================
  /// Available products.
  @override
  @JsonKey()
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

// ==========================================================
// Shopping Cart
// ==========================================================
  /// Products currently added to the cart.
  final List<CartItem> _cart;
// ==========================================================
// Shopping Cart
// ==========================================================
  /// Products currently added to the cart.
  @override
  @JsonKey()
  List<CartItem> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

// ==========================================================
// Search
// ==========================================================
  /// Current search query.
  @override
  @JsonKey()
  final String searchQuery;
// ==========================================================
// Financial
// ==========================================================
  /// Applied discount amount.
  @override
  @JsonKey()
  final double discount;
// ==========================================================
// Loading States
// ==========================================================
  /// Indicates whether products are being loaded.
  @override
  @JsonKey()
  final bool loading;

  /// Indicates whether checkout is being processed.
  @override
  @JsonKey()
  final bool checkingOut;

  /// Indicates whether a product or stock operation is running.
  @override
  @JsonKey()
  final bool saving;
// ==========================================================
// Receipt
// ==========================================================
  /// Last successfully created receipt.
  @override
  final SaleReceipt? lastReceipt;
// ==========================================================
// Feedback
// ==========================================================
  /// Error message.
  @override
  final String? error;

  /// Success message.
  @override
  final String? success;

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
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.checkingOut, checkingOut) ||
                other.checkingOut == checkingOut) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.lastReceipt, lastReceipt) ||
                other.lastReceipt == lastReceipt) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_cart),
      searchQuery,
      discount,
      loading,
      checkingOut,
      saving,
      lastReceipt,
      error,
      success);

  @override
  String toString() {
    return 'PosState(products: $products, cart: $cart, searchQuery: $searchQuery, discount: $discount, loading: $loading, checkingOut: $checkingOut, saving: $saving, lastReceipt: $lastReceipt, error: $error, success: $success)';
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
      String searchQuery,
      double discount,
      bool loading,
      bool checkingOut,
      bool saving,
      SaleReceipt? lastReceipt,
      String? error,
      String? success});
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
    Object? searchQuery = null,
    Object? discount = null,
    Object? loading = null,
    Object? checkingOut = null,
    Object? saving = null,
    Object? lastReceipt = freezed,
    Object? error = freezed,
    Object? success = freezed,
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
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkingOut: null == checkingOut
          ? _self.checkingOut
          : checkingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      saving: null == saving
          ? _self.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      lastReceipt: freezed == lastReceipt
          ? _self.lastReceipt
          : lastReceipt // ignore: cast_nullable_to_non_nullable
              as SaleReceipt?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
