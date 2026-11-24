// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrderDetailsModel {
  PurchaseOrderModel get order;
  String get supplierName;
  List<PurchaseItemModel> get items;
  List<PurchasePaymentModel> get payments;
  List<PurchaseReceiptModel> get receipts;

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseOrderDetailsModelCopyWith<PurchaseOrderDetailsModel> get copyWith =>
      _$PurchaseOrderDetailsModelCopyWithImpl<PurchaseOrderDetailsModel>(
          this as PurchaseOrderDetailsModel, _$identity);

  /// Serializes this PurchaseOrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseOrderDetailsModel &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.payments, payments) &&
            const DeepCollectionEquality().equals(other.receipts, receipts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order,
      supplierName,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(payments),
      const DeepCollectionEquality().hash(receipts));

  @override
  String toString() {
    return 'PurchaseOrderDetailsModel(order: $order, supplierName: $supplierName, items: $items, payments: $payments, receipts: $receipts)';
  }
}

/// @nodoc
abstract mixin class $PurchaseOrderDetailsModelCopyWith<$Res> {
  factory $PurchaseOrderDetailsModelCopyWith(PurchaseOrderDetailsModel value,
          $Res Function(PurchaseOrderDetailsModel) _then) =
      _$PurchaseOrderDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {PurchaseOrderModel order,
      String supplierName,
      List<PurchaseItemModel> items,
      List<PurchasePaymentModel> payments,
      List<PurchaseReceiptModel> receipts});

  $PurchaseOrderModelCopyWith<$Res> get order;
}

/// @nodoc
class _$PurchaseOrderDetailsModelCopyWithImpl<$Res>
    implements $PurchaseOrderDetailsModelCopyWith<$Res> {
  _$PurchaseOrderDetailsModelCopyWithImpl(this._self, this._then);

  final PurchaseOrderDetailsModel _self;
  final $Res Function(PurchaseOrderDetailsModel) _then;

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? supplierName = null,
    Object? items = null,
    Object? payments = null,
    Object? receipts = null,
  }) {
    return _then(_self.copyWith(
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderModel,
      supplierName: null == supplierName
          ? _self.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItemModel>,
      payments: null == payments
          ? _self.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PurchasePaymentModel>,
      receipts: null == receipts
          ? _self.receipts
          : receipts // ignore: cast_nullable_to_non_nullable
              as List<PurchaseReceiptModel>,
    ));
  }

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderModelCopyWith<$Res> get order {
    return $PurchaseOrderModelCopyWith<$Res>(_self.order, (value) {
      return _then(_self.copyWith(order: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PurchaseOrderDetailsModel].
extension PurchaseOrderDetailsModelPatterns on PurchaseOrderDetailsModel {
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
    TResult Function(_PurchaseOrderDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel() when $default != null:
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
    TResult Function(_PurchaseOrderDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel():
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
    TResult? Function(_PurchaseOrderDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel() when $default != null:
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
            PurchaseOrderModel order,
            String supplierName,
            List<PurchaseItemModel> items,
            List<PurchasePaymentModel> payments,
            List<PurchaseReceiptModel> receipts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel() when $default != null:
        return $default(_that.order, _that.supplierName, _that.items,
            _that.payments, _that.receipts);
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
            PurchaseOrderModel order,
            String supplierName,
            List<PurchaseItemModel> items,
            List<PurchasePaymentModel> payments,
            List<PurchaseReceiptModel> receipts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel():
        return $default(_that.order, _that.supplierName, _that.items,
            _that.payments, _that.receipts);
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
            PurchaseOrderModel order,
            String supplierName,
            List<PurchaseItemModel> items,
            List<PurchasePaymentModel> payments,
            List<PurchaseReceiptModel> receipts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDetailsModel() when $default != null:
        return $default(_that.order, _that.supplierName, _that.items,
            _that.payments, _that.receipts);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseOrderDetailsModel extends PurchaseOrderDetailsModel {
  const _PurchaseOrderDetailsModel(
      {required this.order,
      required this.supplierName,
      final List<PurchaseItemModel> items = const [],
      final List<PurchasePaymentModel> payments = const [],
      final List<PurchaseReceiptModel> receipts = const []})
      : _items = items,
        _payments = payments,
        _receipts = receipts,
        super._();
  factory _PurchaseOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderDetailsModelFromJson(json);

  @override
  final PurchaseOrderModel order;
  @override
  final String supplierName;
  final List<PurchaseItemModel> _items;
  @override
  @JsonKey()
  List<PurchaseItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<PurchasePaymentModel> _payments;
  @override
  @JsonKey()
  List<PurchasePaymentModel> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  final List<PurchaseReceiptModel> _receipts;
  @override
  @JsonKey()
  List<PurchaseReceiptModel> get receipts {
    if (_receipts is EqualUnmodifiableListView) return _receipts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receipts);
  }

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseOrderDetailsModelCopyWith<_PurchaseOrderDetailsModel>
      get copyWith =>
          __$PurchaseOrderDetailsModelCopyWithImpl<_PurchaseOrderDetailsModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseOrderDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseOrderDetailsModel &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality().equals(other._receipts, _receipts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order,
      supplierName,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_payments),
      const DeepCollectionEquality().hash(_receipts));

  @override
  String toString() {
    return 'PurchaseOrderDetailsModel(order: $order, supplierName: $supplierName, items: $items, payments: $payments, receipts: $receipts)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseOrderDetailsModelCopyWith<$Res>
    implements $PurchaseOrderDetailsModelCopyWith<$Res> {
  factory _$PurchaseOrderDetailsModelCopyWith(_PurchaseOrderDetailsModel value,
          $Res Function(_PurchaseOrderDetailsModel) _then) =
      __$PurchaseOrderDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PurchaseOrderModel order,
      String supplierName,
      List<PurchaseItemModel> items,
      List<PurchasePaymentModel> payments,
      List<PurchaseReceiptModel> receipts});

  @override
  $PurchaseOrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$PurchaseOrderDetailsModelCopyWithImpl<$Res>
    implements _$PurchaseOrderDetailsModelCopyWith<$Res> {
  __$PurchaseOrderDetailsModelCopyWithImpl(this._self, this._then);

  final _PurchaseOrderDetailsModel _self;
  final $Res Function(_PurchaseOrderDetailsModel) _then;

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? order = null,
    Object? supplierName = null,
    Object? items = null,
    Object? payments = null,
    Object? receipts = null,
  }) {
    return _then(_PurchaseOrderDetailsModel(
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderModel,
      supplierName: null == supplierName
          ? _self.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItemModel>,
      payments: null == payments
          ? _self._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PurchasePaymentModel>,
      receipts: null == receipts
          ? _self._receipts
          : receipts // ignore: cast_nullable_to_non_nullable
              as List<PurchaseReceiptModel>,
    ));
  }

  /// Create a copy of PurchaseOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderModelCopyWith<$Res> get order {
    return $PurchaseOrderModelCopyWith<$Res>(_self.order, (value) {
      return _then(_self.copyWith(order: value));
    });
  }
}

// dart format on
