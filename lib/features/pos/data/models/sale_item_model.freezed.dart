// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleItemModel {
  int get id;
  @JsonKey(name: 'sale_id')
  int get saleId;
  @JsonKey(name: 'product_id')
  int get productId;
  @JsonKey(name: 'product_name')
  String get productName;
  double get quantity;
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  @JsonKey(name: 'cost_price')
  double get costPrice;
  double get total;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleItemModelCopyWith<SaleItemModel> get copyWith =>
      _$SaleItemModelCopyWithImpl<SaleItemModel>(
          this as SaleItemModel, _$identity);

  /// Serializes this SaleItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, productId,
      productName, quantity, unitPrice, costPrice, total);

  @override
  String toString() {
    return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, total: $total)';
  }
}

/// @nodoc
abstract mixin class $SaleItemModelCopyWith<$Res> {
  factory $SaleItemModelCopyWith(
          SaleItemModel value, $Res Function(SaleItemModel) _then) =
      _$SaleItemModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_id') int saleId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      double quantity,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'cost_price') double costPrice,
      double total});
}

/// @nodoc
class _$SaleItemModelCopyWithImpl<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  _$SaleItemModelCopyWithImpl(this._self, this._then);

  final SaleItemModel _self;
  final $Res Function(SaleItemModel) _then;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? costPrice = null,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [SaleItemModel].
extension SaleItemModelPatterns on SaleItemModel {
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
    TResult Function(_SaleItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
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
    TResult Function(_SaleItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel():
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
    TResult? Function(_SaleItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
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
            @JsonKey(name: 'sale_id') int saleId,
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            double quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'cost_price') double costPrice,
            double total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unitPrice,
            _that.costPrice,
            _that.total);
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
            @JsonKey(name: 'sale_id') int saleId,
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            double quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'cost_price') double costPrice,
            double total)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel():
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unitPrice,
            _that.costPrice,
            _that.total);
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
            @JsonKey(name: 'sale_id') int saleId,
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            double quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'cost_price') double costPrice,
            double total)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unitPrice,
            _that.costPrice,
            _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SaleItemModel implements SaleItemModel {
  const _SaleItemModel(
      {required this.id,
      @JsonKey(name: 'sale_id') required this.saleId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'cost_price') required this.costPrice,
      required this.total});
  factory _SaleItemModel.fromJson(Map<String, dynamic> json) =>
      _$SaleItemModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sale_id')
  final int saleId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;
  @override
  @JsonKey(name: 'cost_price')
  final double costPrice;
  @override
  final double total;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleItemModelCopyWith<_SaleItemModel> get copyWith =>
      __$SaleItemModelCopyWithImpl<_SaleItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaleItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, productId,
      productName, quantity, unitPrice, costPrice, total);

  @override
  String toString() {
    return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$SaleItemModelCopyWith<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  factory _$SaleItemModelCopyWith(
          _SaleItemModel value, $Res Function(_SaleItemModel) _then) =
      __$SaleItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_id') int saleId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      double quantity,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'cost_price') double costPrice,
      double total});
}

/// @nodoc
class __$SaleItemModelCopyWithImpl<$Res>
    implements _$SaleItemModelCopyWith<$Res> {
  __$SaleItemModelCopyWithImpl(this._self, this._then);

  final _SaleItemModel _self;
  final $Res Function(_SaleItemModel) _then;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? costPrice = null,
    Object? total = null,
  }) {
    return _then(_SaleItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
