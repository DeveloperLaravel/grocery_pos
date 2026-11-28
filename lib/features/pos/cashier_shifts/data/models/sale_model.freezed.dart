// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleModel {
  int get id;
  @JsonKey(name: 'invoice_number')
  String get invoiceNumber;
  double get subtotal;
  double get discount;
  double get total;
  @JsonKey(name: 'paid_amount')
  double get paidAmount;
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  List<SaleItemModel> get items;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleModelCopyWith<SaleModel> get copyWith =>
      _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNumber,
      subtotal,
      discount,
      total,
      paidAmount,
      paymentMethod,
      createdAt,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, subtotal: $subtotal, discount: $discount, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) =
      _$SaleModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'invoice_number') String invoiceNumber,
      double subtotal,
      double discount,
      double total,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<SaleItemModel> items});
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res> implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItemModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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
    TResult Function(_SaleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
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
    TResult Function(_SaleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel():
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
    TResult? Function(_SaleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
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
            int id,
            @JsonKey(name: 'invoice_number') String invoiceNumber,
            double subtotal,
            double discount,
            double total,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<SaleItemModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.subtotal,
            _that.discount,
            _that.total,
            _that.paidAmount,
            _that.paymentMethod,
            _that.createdAt,
            _that.items);
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
            int id,
            @JsonKey(name: 'invoice_number') String invoiceNumber,
            double subtotal,
            double discount,
            double total,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<SaleItemModel> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel():
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.subtotal,
            _that.discount,
            _that.total,
            _that.paidAmount,
            _that.paymentMethod,
            _that.createdAt,
            _that.items);
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
            int id,
            @JsonKey(name: 'invoice_number') String invoiceNumber,
            double subtotal,
            double discount,
            double total,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<SaleItemModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.subtotal,
            _that.discount,
            _that.total,
            _that.paidAmount,
            _that.paymentMethod,
            _that.createdAt,
            _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SaleModel implements SaleModel {
  const _SaleModel(
      {required this.id,
      @JsonKey(name: 'invoice_number') required this.invoiceNumber,
      required this.subtotal,
      required this.discount,
      required this.total,
      @JsonKey(name: 'paid_amount') required this.paidAmount,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'created_at') required this.createdAt,
      final List<SaleItemModel> items = const []})
      : _items = items;
  factory _SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;
  @override
  final double subtotal;
  @override
  final double discount;
  @override
  final double total;
  @override
  @JsonKey(name: 'paid_amount')
  final double paidAmount;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<SaleItemModel> _items;
  @override
  @JsonKey()
  List<SaleItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleModelCopyWith<_SaleModel> get copyWith =>
      __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNumber,
      subtotal,
      discount,
      total,
      paidAmount,
      paymentMethod,
      createdAt,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, subtotal: $subtotal, discount: $discount, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res>
    implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(
          _SaleModel value, $Res Function(_SaleModel) _then) =
      __$SaleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'invoice_number') String invoiceNumber,
      double subtotal,
      double discount,
      double total,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<SaleItemModel> items});
}

/// @nodoc
class __$SaleModelCopyWithImpl<$Res> implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
    Object? items = null,
  }) {
    return _then(_SaleModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItemModel>,
    ));
  }
}

// dart format on
