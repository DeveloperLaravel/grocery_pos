// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnItemModel {
  int get id;
  @JsonKey(name: 'return_id')
  int get returnId;
  @JsonKey(name: 'product_id')
  int get productId;
  double get quantity;
  @JsonKey(name: 'refund_amount')
  double get refundAmount;

  /// Create a copy of ReturnItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReturnItemModelCopyWith<ReturnItemModel> get copyWith =>
      _$ReturnItemModelCopyWithImpl<ReturnItemModel>(
          this as ReturnItemModel, _$identity);

  /// Serializes this ReturnItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReturnItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.refundAmount, refundAmount) ||
                other.refundAmount == refundAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, returnId, productId, quantity, refundAmount);

  @override
  String toString() {
    return 'ReturnItemModel(id: $id, returnId: $returnId, productId: $productId, quantity: $quantity, refundAmount: $refundAmount)';
  }
}

/// @nodoc
abstract mixin class $ReturnItemModelCopyWith<$Res> {
  factory $ReturnItemModelCopyWith(
          ReturnItemModel value, $Res Function(ReturnItemModel) _then) =
      _$ReturnItemModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'return_id') int returnId,
      @JsonKey(name: 'product_id') int productId,
      double quantity,
      @JsonKey(name: 'refund_amount') double refundAmount});
}

/// @nodoc
class _$ReturnItemModelCopyWithImpl<$Res>
    implements $ReturnItemModelCopyWith<$Res> {
  _$ReturnItemModelCopyWithImpl(this._self, this._then);

  final ReturnItemModel _self;
  final $Res Function(ReturnItemModel) _then;

  /// Create a copy of ReturnItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? returnId = null,
    Object? productId = null,
    Object? quantity = null,
    Object? refundAmount = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      returnId: null == returnId
          ? _self.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [ReturnItemModel].
extension ReturnItemModelPatterns on ReturnItemModel {
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
    TResult Function(_ReturnItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel() when $default != null:
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
    TResult Function(_ReturnItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel():
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
    TResult? Function(_ReturnItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel() when $default != null:
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
            @JsonKey(name: 'return_id') int returnId,
            @JsonKey(name: 'product_id') int productId,
            double quantity,
            @JsonKey(name: 'refund_amount') double refundAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel() when $default != null:
        return $default(_that.id, _that.returnId, _that.productId,
            _that.quantity, _that.refundAmount);
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
            @JsonKey(name: 'return_id') int returnId,
            @JsonKey(name: 'product_id') int productId,
            double quantity,
            @JsonKey(name: 'refund_amount') double refundAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel():
        return $default(_that.id, _that.returnId, _that.productId,
            _that.quantity, _that.refundAmount);
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
            @JsonKey(name: 'return_id') int returnId,
            @JsonKey(name: 'product_id') int productId,
            double quantity,
            @JsonKey(name: 'refund_amount') double refundAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnItemModel() when $default != null:
        return $default(_that.id, _that.returnId, _that.productId,
            _that.quantity, _that.refundAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReturnItemModel implements ReturnItemModel {
  const _ReturnItemModel(
      {required this.id,
      @JsonKey(name: 'return_id') required this.returnId,
      @JsonKey(name: 'product_id') required this.productId,
      required this.quantity,
      @JsonKey(name: 'refund_amount') required this.refundAmount});
  factory _ReturnItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'return_id')
  final int returnId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'refund_amount')
  final double refundAmount;

  /// Create a copy of ReturnItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReturnItemModelCopyWith<_ReturnItemModel> get copyWith =>
      __$ReturnItemModelCopyWithImpl<_ReturnItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReturnItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReturnItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.refundAmount, refundAmount) ||
                other.refundAmount == refundAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, returnId, productId, quantity, refundAmount);

  @override
  String toString() {
    return 'ReturnItemModel(id: $id, returnId: $returnId, productId: $productId, quantity: $quantity, refundAmount: $refundAmount)';
  }
}

/// @nodoc
abstract mixin class _$ReturnItemModelCopyWith<$Res>
    implements $ReturnItemModelCopyWith<$Res> {
  factory _$ReturnItemModelCopyWith(
          _ReturnItemModel value, $Res Function(_ReturnItemModel) _then) =
      __$ReturnItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'return_id') int returnId,
      @JsonKey(name: 'product_id') int productId,
      double quantity,
      @JsonKey(name: 'refund_amount') double refundAmount});
}

/// @nodoc
class __$ReturnItemModelCopyWithImpl<$Res>
    implements _$ReturnItemModelCopyWith<$Res> {
  __$ReturnItemModelCopyWithImpl(this._self, this._then);

  final _ReturnItemModel _self;
  final $Res Function(_ReturnItemModel) _then;

  /// Create a copy of ReturnItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? returnId = null,
    Object? productId = null,
    Object? quantity = null,
    Object? refundAmount = null,
  }) {
    return _then(_ReturnItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      returnId: null == returnId
          ? _self.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
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
