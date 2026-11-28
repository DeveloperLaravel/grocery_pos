// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutItemModel {
  @JsonKey(name: 'product_id')
  int get productId;
  double get quantity;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutItemModelCopyWith<CheckoutItemModel> get copyWith =>
      _$CheckoutItemModelCopyWithImpl<CheckoutItemModel>(
          this as CheckoutItemModel, _$identity);

  /// Serializes this CheckoutItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutItemModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @override
  String toString() {
    return 'CheckoutItemModel(productId: $productId, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $CheckoutItemModelCopyWith<$Res> {
  factory $CheckoutItemModelCopyWith(
          CheckoutItemModel value, $Res Function(CheckoutItemModel) _then) =
      _$CheckoutItemModelCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'product_id') int productId, double quantity});
}

/// @nodoc
class _$CheckoutItemModelCopyWithImpl<$Res>
    implements $CheckoutItemModelCopyWith<$Res> {
  _$CheckoutItemModelCopyWithImpl(this._self, this._then);

  final CheckoutItemModel _self;
  final $Res Function(CheckoutItemModel) _then;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CheckoutItemModel].
extension CheckoutItemModelPatterns on CheckoutItemModel {
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
    TResult Function(_CheckoutItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel() when $default != null:
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
    TResult Function(_CheckoutItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel():
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
    TResult? Function(_CheckoutItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel() when $default != null:
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
            @JsonKey(name: 'product_id') int productId, double quantity)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel() when $default != null:
        return $default(_that.productId, _that.quantity);
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
            @JsonKey(name: 'product_id') int productId, double quantity)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel():
        return $default(_that.productId, _that.quantity);
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
            @JsonKey(name: 'product_id') int productId, double quantity)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItemModel() when $default != null:
        return $default(_that.productId, _that.quantity);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CheckoutItemModel implements CheckoutItemModel {
  const _CheckoutItemModel(
      {@JsonKey(name: 'product_id') required this.productId,
      required this.quantity});
  factory _CheckoutItemModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutItemModelFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  final double quantity;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutItemModelCopyWith<_CheckoutItemModel> get copyWith =>
      __$CheckoutItemModelCopyWithImpl<_CheckoutItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckoutItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutItemModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @override
  String toString() {
    return 'CheckoutItemModel(productId: $productId, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutItemModelCopyWith<$Res>
    implements $CheckoutItemModelCopyWith<$Res> {
  factory _$CheckoutItemModelCopyWith(
          _CheckoutItemModel value, $Res Function(_CheckoutItemModel) _then) =
      __$CheckoutItemModelCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'product_id') int productId, double quantity});
}

/// @nodoc
class __$CheckoutItemModelCopyWithImpl<$Res>
    implements _$CheckoutItemModelCopyWith<$Res> {
  __$CheckoutItemModelCopyWithImpl(this._self, this._then);

  final _CheckoutItemModel _self;
  final $Res Function(_CheckoutItemModel) _then;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_CheckoutItemModel(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
