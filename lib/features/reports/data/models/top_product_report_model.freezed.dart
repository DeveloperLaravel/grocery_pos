// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_product_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopProductReportModel {
  @JsonKey(name: 'product_id')
  int get productId;
  @JsonKey(name: 'product_name')
  String get productName;
  @JsonKey(name: 'quantity_sold')
  double get quantitySold;
  @JsonKey(name: 'sales_total')
  double get salesTotal;
  @JsonKey(name: 'cost_total')
  double get costTotal;
  double get profit;

  /// Create a copy of TopProductReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopProductReportModelCopyWith<TopProductReportModel> get copyWith =>
      _$TopProductReportModelCopyWithImpl<TopProductReportModel>(
          this as TopProductReportModel, _$identity);

  /// Serializes this TopProductReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopProductReportModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantitySold, quantitySold) ||
                other.quantitySold == quantitySold) &&
            (identical(other.salesTotal, salesTotal) ||
                other.salesTotal == salesTotal) &&
            (identical(other.costTotal, costTotal) ||
                other.costTotal == costTotal) &&
            (identical(other.profit, profit) || other.profit == profit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      quantitySold, salesTotal, costTotal, profit);

  @override
  String toString() {
    return 'TopProductReportModel(productId: $productId, productName: $productName, quantitySold: $quantitySold, salesTotal: $salesTotal, costTotal: $costTotal, profit: $profit)';
  }
}

/// @nodoc
abstract mixin class $TopProductReportModelCopyWith<$Res> {
  factory $TopProductReportModelCopyWith(TopProductReportModel value,
          $Res Function(TopProductReportModel) _then) =
      _$TopProductReportModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'quantity_sold') double quantitySold,
      @JsonKey(name: 'sales_total') double salesTotal,
      @JsonKey(name: 'cost_total') double costTotal,
      double profit});
}

/// @nodoc
class _$TopProductReportModelCopyWithImpl<$Res>
    implements $TopProductReportModelCopyWith<$Res> {
  _$TopProductReportModelCopyWithImpl(this._self, this._then);

  final TopProductReportModel _self;
  final $Res Function(TopProductReportModel) _then;

  /// Create a copy of TopProductReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantitySold = null,
    Object? salesTotal = null,
    Object? costTotal = null,
    Object? profit = null,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _self.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as double,
      salesTotal: null == salesTotal
          ? _self.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      costTotal: null == costTotal
          ? _self.costTotal
          : costTotal // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _self.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [TopProductReportModel].
extension TopProductReportModelPatterns on TopProductReportModel {
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
    TResult Function(_TopProductReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel() when $default != null:
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
    TResult Function(_TopProductReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel():
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
    TResult? Function(_TopProductReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel() when $default != null:
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'quantity_sold') double quantitySold,
            @JsonKey(name: 'sales_total') double salesTotal,
            @JsonKey(name: 'cost_total') double costTotal,
            double profit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.quantitySold,
            _that.salesTotal, _that.costTotal, _that.profit);
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'quantity_sold') double quantitySold,
            @JsonKey(name: 'sales_total') double salesTotal,
            @JsonKey(name: 'cost_total') double costTotal,
            double profit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel():
        return $default(_that.productId, _that.productName, _that.quantitySold,
            _that.salesTotal, _that.costTotal, _that.profit);
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'quantity_sold') double quantitySold,
            @JsonKey(name: 'sales_total') double salesTotal,
            @JsonKey(name: 'cost_total') double costTotal,
            double profit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductReportModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.quantitySold,
            _that.salesTotal, _that.costTotal, _that.profit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TopProductReportModel implements TopProductReportModel {
  const _TopProductReportModel(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'quantity_sold') required this.quantitySold,
      @JsonKey(name: 'sales_total') required this.salesTotal,
      @JsonKey(name: 'cost_total') required this.costTotal,
      required this.profit});
  factory _TopProductReportModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductReportModelFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'quantity_sold')
  final double quantitySold;
  @override
  @JsonKey(name: 'sales_total')
  final double salesTotal;
  @override
  @JsonKey(name: 'cost_total')
  final double costTotal;
  @override
  final double profit;

  /// Create a copy of TopProductReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopProductReportModelCopyWith<_TopProductReportModel> get copyWith =>
      __$TopProductReportModelCopyWithImpl<_TopProductReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TopProductReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopProductReportModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantitySold, quantitySold) ||
                other.quantitySold == quantitySold) &&
            (identical(other.salesTotal, salesTotal) ||
                other.salesTotal == salesTotal) &&
            (identical(other.costTotal, costTotal) ||
                other.costTotal == costTotal) &&
            (identical(other.profit, profit) || other.profit == profit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      quantitySold, salesTotal, costTotal, profit);

  @override
  String toString() {
    return 'TopProductReportModel(productId: $productId, productName: $productName, quantitySold: $quantitySold, salesTotal: $salesTotal, costTotal: $costTotal, profit: $profit)';
  }
}

/// @nodoc
abstract mixin class _$TopProductReportModelCopyWith<$Res>
    implements $TopProductReportModelCopyWith<$Res> {
  factory _$TopProductReportModelCopyWith(_TopProductReportModel value,
          $Res Function(_TopProductReportModel) _then) =
      __$TopProductReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'quantity_sold') double quantitySold,
      @JsonKey(name: 'sales_total') double salesTotal,
      @JsonKey(name: 'cost_total') double costTotal,
      double profit});
}

/// @nodoc
class __$TopProductReportModelCopyWithImpl<$Res>
    implements _$TopProductReportModelCopyWith<$Res> {
  __$TopProductReportModelCopyWithImpl(this._self, this._then);

  final _TopProductReportModel _self;
  final $Res Function(_TopProductReportModel) _then;

  /// Create a copy of TopProductReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantitySold = null,
    Object? salesTotal = null,
    Object? costTotal = null,
    Object? profit = null,
  }) {
    return _then(_TopProductReportModel(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _self.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as double,
      salesTotal: null == salesTotal
          ? _self.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      costTotal: null == costTotal
          ? _self.costTotal
          : costTotal // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _self.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
