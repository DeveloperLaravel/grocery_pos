// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventorySummaryModel {
  @JsonKey(name: 'products_count')
  int get productsCount;
  @JsonKey(name: 'low_stock_count')
  int get lowStockCount;
  @JsonKey(name: 'total_units')
  double get totalUnits;
  @JsonKey(name: 'stock_cost_value')
  double get stockCostValue;
  @JsonKey(name: 'stock_sale_value')
  double get stockSaleValue;

  /// Create a copy of InventorySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventorySummaryModelCopyWith<InventorySummaryModel> get copyWith =>
      _$InventorySummaryModelCopyWithImpl<InventorySummaryModel>(
          this as InventorySummaryModel, _$identity);

  /// Serializes this InventorySummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventorySummaryModel &&
            (identical(other.productsCount, productsCount) ||
                other.productsCount == productsCount) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            (identical(other.totalUnits, totalUnits) ||
                other.totalUnits == totalUnits) &&
            (identical(other.stockCostValue, stockCostValue) ||
                other.stockCostValue == stockCostValue) &&
            (identical(other.stockSaleValue, stockSaleValue) ||
                other.stockSaleValue == stockSaleValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productsCount, lowStockCount,
      totalUnits, stockCostValue, stockSaleValue);

  @override
  String toString() {
    return 'InventorySummaryModel(productsCount: $productsCount, lowStockCount: $lowStockCount, totalUnits: $totalUnits, stockCostValue: $stockCostValue, stockSaleValue: $stockSaleValue)';
  }
}

/// @nodoc
abstract mixin class $InventorySummaryModelCopyWith<$Res> {
  factory $InventorySummaryModelCopyWith(InventorySummaryModel value,
          $Res Function(InventorySummaryModel) _then) =
      _$InventorySummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'products_count') int productsCount,
      @JsonKey(name: 'low_stock_count') int lowStockCount,
      @JsonKey(name: 'total_units') double totalUnits,
      @JsonKey(name: 'stock_cost_value') double stockCostValue,
      @JsonKey(name: 'stock_sale_value') double stockSaleValue});
}

/// @nodoc
class _$InventorySummaryModelCopyWithImpl<$Res>
    implements $InventorySummaryModelCopyWith<$Res> {
  _$InventorySummaryModelCopyWithImpl(this._self, this._then);

  final InventorySummaryModel _self;
  final $Res Function(InventorySummaryModel) _then;

  /// Create a copy of InventorySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsCount = null,
    Object? lowStockCount = null,
    Object? totalUnits = null,
    Object? stockCostValue = null,
    Object? stockSaleValue = null,
  }) {
    return _then(_self.copyWith(
      productsCount: null == productsCount
          ? _self.productsCount
          : productsCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockCount: null == lowStockCount
          ? _self.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnits: null == totalUnits
          ? _self.totalUnits
          : totalUnits // ignore: cast_nullable_to_non_nullable
              as double,
      stockCostValue: null == stockCostValue
          ? _self.stockCostValue
          : stockCostValue // ignore: cast_nullable_to_non_nullable
              as double,
      stockSaleValue: null == stockSaleValue
          ? _self.stockSaleValue
          : stockSaleValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventorySummaryModel].
extension InventorySummaryModelPatterns on InventorySummaryModel {
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
    TResult Function(_InventorySummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel() when $default != null:
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
    TResult Function(_InventorySummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel():
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
    TResult? Function(_InventorySummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel() when $default != null:
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
            @JsonKey(name: 'products_count') int productsCount,
            @JsonKey(name: 'low_stock_count') int lowStockCount,
            @JsonKey(name: 'total_units') double totalUnits,
            @JsonKey(name: 'stock_cost_value') double stockCostValue,
            @JsonKey(name: 'stock_sale_value') double stockSaleValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel() when $default != null:
        return $default(_that.productsCount, _that.lowStockCount,
            _that.totalUnits, _that.stockCostValue, _that.stockSaleValue);
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
            @JsonKey(name: 'products_count') int productsCount,
            @JsonKey(name: 'low_stock_count') int lowStockCount,
            @JsonKey(name: 'total_units') double totalUnits,
            @JsonKey(name: 'stock_cost_value') double stockCostValue,
            @JsonKey(name: 'stock_sale_value') double stockSaleValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel():
        return $default(_that.productsCount, _that.lowStockCount,
            _that.totalUnits, _that.stockCostValue, _that.stockSaleValue);
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
            @JsonKey(name: 'products_count') int productsCount,
            @JsonKey(name: 'low_stock_count') int lowStockCount,
            @JsonKey(name: 'total_units') double totalUnits,
            @JsonKey(name: 'stock_cost_value') double stockCostValue,
            @JsonKey(name: 'stock_sale_value') double stockSaleValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventorySummaryModel() when $default != null:
        return $default(_that.productsCount, _that.lowStockCount,
            _that.totalUnits, _that.stockCostValue, _that.stockSaleValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventorySummaryModel implements InventorySummaryModel {
  const _InventorySummaryModel(
      {@JsonKey(name: 'products_count') required this.productsCount,
      @JsonKey(name: 'low_stock_count') required this.lowStockCount,
      @JsonKey(name: 'total_units') required this.totalUnits,
      @JsonKey(name: 'stock_cost_value') required this.stockCostValue,
      @JsonKey(name: 'stock_sale_value') required this.stockSaleValue});
  factory _InventorySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$InventorySummaryModelFromJson(json);

  @override
  @JsonKey(name: 'products_count')
  final int productsCount;
  @override
  @JsonKey(name: 'low_stock_count')
  final int lowStockCount;
  @override
  @JsonKey(name: 'total_units')
  final double totalUnits;
  @override
  @JsonKey(name: 'stock_cost_value')
  final double stockCostValue;
  @override
  @JsonKey(name: 'stock_sale_value')
  final double stockSaleValue;

  /// Create a copy of InventorySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventorySummaryModelCopyWith<_InventorySummaryModel> get copyWith =>
      __$InventorySummaryModelCopyWithImpl<_InventorySummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventorySummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventorySummaryModel &&
            (identical(other.productsCount, productsCount) ||
                other.productsCount == productsCount) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            (identical(other.totalUnits, totalUnits) ||
                other.totalUnits == totalUnits) &&
            (identical(other.stockCostValue, stockCostValue) ||
                other.stockCostValue == stockCostValue) &&
            (identical(other.stockSaleValue, stockSaleValue) ||
                other.stockSaleValue == stockSaleValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productsCount, lowStockCount,
      totalUnits, stockCostValue, stockSaleValue);

  @override
  String toString() {
    return 'InventorySummaryModel(productsCount: $productsCount, lowStockCount: $lowStockCount, totalUnits: $totalUnits, stockCostValue: $stockCostValue, stockSaleValue: $stockSaleValue)';
  }
}

/// @nodoc
abstract mixin class _$InventorySummaryModelCopyWith<$Res>
    implements $InventorySummaryModelCopyWith<$Res> {
  factory _$InventorySummaryModelCopyWith(_InventorySummaryModel value,
          $Res Function(_InventorySummaryModel) _then) =
      __$InventorySummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'products_count') int productsCount,
      @JsonKey(name: 'low_stock_count') int lowStockCount,
      @JsonKey(name: 'total_units') double totalUnits,
      @JsonKey(name: 'stock_cost_value') double stockCostValue,
      @JsonKey(name: 'stock_sale_value') double stockSaleValue});
}

/// @nodoc
class __$InventorySummaryModelCopyWithImpl<$Res>
    implements _$InventorySummaryModelCopyWith<$Res> {
  __$InventorySummaryModelCopyWithImpl(this._self, this._then);

  final _InventorySummaryModel _self;
  final $Res Function(_InventorySummaryModel) _then;

  /// Create a copy of InventorySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productsCount = null,
    Object? lowStockCount = null,
    Object? totalUnits = null,
    Object? stockCostValue = null,
    Object? stockSaleValue = null,
  }) {
    return _then(_InventorySummaryModel(
      productsCount: null == productsCount
          ? _self.productsCount
          : productsCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockCount: null == lowStockCount
          ? _self.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnits: null == totalUnits
          ? _self.totalUnits
          : totalUnits // ignore: cast_nullable_to_non_nullable
              as double,
      stockCostValue: null == stockCostValue
          ? _self.stockCostValue
          : stockCostValue // ignore: cast_nullable_to_non_nullable
              as double,
      stockSaleValue: null == stockSaleValue
          ? _self.stockSaleValue
          : stockSaleValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
