// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_stock_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LowStockProductModel {
  int get id;
  String get name;
  String get barcode;
  double get quantity;
  double get minStock;
  double get salePrice;

  /// Create a copy of LowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LowStockProductModelCopyWith<LowStockProductModel> get copyWith =>
      _$LowStockProductModelCopyWithImpl<LowStockProductModel>(
          this as LowStockProductModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LowStockProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, barcode, quantity, minStock, salePrice);

  @override
  String toString() {
    return 'LowStockProductModel(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class $LowStockProductModelCopyWith<$Res> {
  factory $LowStockProductModelCopyWith(LowStockProductModel value,
          $Res Function(LowStockProductModel) _then) =
      _$LowStockProductModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String barcode,
      double quantity,
      double minStock,
      double salePrice});
}

/// @nodoc
class _$LowStockProductModelCopyWithImpl<$Res>
    implements $LowStockProductModelCopyWith<$Res> {
  _$LowStockProductModelCopyWithImpl(this._self, this._then);

  final LowStockProductModel _self;
  final $Res Function(LowStockProductModel) _then;

  /// Create a copy of LowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? barcode = null,
    Object? quantity = null,
    Object? minStock = null,
    Object? salePrice = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      minStock: null == minStock
          ? _self.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [LowStockProductModel].
extension LowStockProductModelPatterns on LowStockProductModel {
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
    TResult Function(_LowStockProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel() when $default != null:
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
    TResult Function(_LowStockProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel():
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
    TResult? Function(_LowStockProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel() when $default != null:
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
    TResult Function(int id, String name, String barcode, double quantity,
            double minStock, double salePrice)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel() when $default != null:
        return $default(_that.id, _that.name, _that.barcode, _that.quantity,
            _that.minStock, _that.salePrice);
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
    TResult Function(int id, String name, String barcode, double quantity,
            double minStock, double salePrice)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel():
        return $default(_that.id, _that.name, _that.barcode, _that.quantity,
            _that.minStock, _that.salePrice);
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
    TResult? Function(int id, String name, String barcode, double quantity,
            double minStock, double salePrice)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LowStockProductModel() when $default != null:
        return $default(_that.id, _that.name, _that.barcode, _that.quantity,
            _that.minStock, _that.salePrice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LowStockProductModel implements LowStockProductModel {
  const _LowStockProductModel(
      {required this.id,
      required this.name,
      required this.barcode,
      required this.quantity,
      required this.minStock,
      required this.salePrice});

  @override
  final int id;
  @override
  final String name;
  @override
  final String barcode;
  @override
  final double quantity;
  @override
  final double minStock;
  @override
  final double salePrice;

  /// Create a copy of LowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LowStockProductModelCopyWith<_LowStockProductModel> get copyWith =>
      __$LowStockProductModelCopyWithImpl<_LowStockProductModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LowStockProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, barcode, quantity, minStock, salePrice);

  @override
  String toString() {
    return 'LowStockProductModel(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class _$LowStockProductModelCopyWith<$Res>
    implements $LowStockProductModelCopyWith<$Res> {
  factory _$LowStockProductModelCopyWith(_LowStockProductModel value,
          $Res Function(_LowStockProductModel) _then) =
      __$LowStockProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String barcode,
      double quantity,
      double minStock,
      double salePrice});
}

/// @nodoc
class __$LowStockProductModelCopyWithImpl<$Res>
    implements _$LowStockProductModelCopyWith<$Res> {
  __$LowStockProductModelCopyWithImpl(this._self, this._then);

  final _LowStockProductModel _self;
  final $Res Function(_LowStockProductModel) _then;

  /// Create a copy of LowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? barcode = null,
    Object? quantity = null,
    Object? minStock = null,
    Object? salePrice = null,
  }) {
    return _then(_LowStockProductModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      minStock: null == minStock
          ? _self.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
