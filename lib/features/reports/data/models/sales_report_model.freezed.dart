// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesReportModel {
  int get salesCount;
  double get grossSales;
  double get discounts;
  double get salesTotal;
  double get returnsTotal;
  double get netSales;
  double get costOfGoodsSold;
  double get netProfit;
  double get averageSale;

  /// Create a copy of SalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesReportModelCopyWith<SalesReportModel> get copyWith =>
      _$SalesReportModelCopyWithImpl<SalesReportModel>(
          this as SalesReportModel, _$identity);

  /// Serializes this SalesReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesReportModel &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.grossSales, grossSales) ||
                other.grossSales == grossSales) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            (identical(other.salesTotal, salesTotal) ||
                other.salesTotal == salesTotal) &&
            (identical(other.returnsTotal, returnsTotal) ||
                other.returnsTotal == returnsTotal) &&
            (identical(other.netSales, netSales) ||
                other.netSales == netSales) &&
            (identical(other.costOfGoodsSold, costOfGoodsSold) ||
                other.costOfGoodsSold == costOfGoodsSold) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            (identical(other.averageSale, averageSale) ||
                other.averageSale == averageSale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesCount,
      grossSales,
      discounts,
      salesTotal,
      returnsTotal,
      netSales,
      costOfGoodsSold,
      netProfit,
      averageSale);

  @override
  String toString() {
    return 'SalesReportModel(salesCount: $salesCount, grossSales: $grossSales, discounts: $discounts, salesTotal: $salesTotal, returnsTotal: $returnsTotal, netSales: $netSales, costOfGoodsSold: $costOfGoodsSold, netProfit: $netProfit, averageSale: $averageSale)';
  }
}

/// @nodoc
abstract mixin class $SalesReportModelCopyWith<$Res> {
  factory $SalesReportModelCopyWith(
          SalesReportModel value, $Res Function(SalesReportModel) _then) =
      _$SalesReportModelCopyWithImpl;
  @useResult
  $Res call(
      {int salesCount,
      double grossSales,
      double discounts,
      double salesTotal,
      double returnsTotal,
      double netSales,
      double costOfGoodsSold,
      double netProfit,
      double averageSale});
}

/// @nodoc
class _$SalesReportModelCopyWithImpl<$Res>
    implements $SalesReportModelCopyWith<$Res> {
  _$SalesReportModelCopyWithImpl(this._self, this._then);

  final SalesReportModel _self;
  final $Res Function(SalesReportModel) _then;

  /// Create a copy of SalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesCount = null,
    Object? grossSales = null,
    Object? discounts = null,
    Object? salesTotal = null,
    Object? returnsTotal = null,
    Object? netSales = null,
    Object? costOfGoodsSold = null,
    Object? netProfit = null,
    Object? averageSale = null,
  }) {
    return _then(_self.copyWith(
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossSales: null == grossSales
          ? _self.grossSales
          : grossSales // ignore: cast_nullable_to_non_nullable
              as double,
      discounts: null == discounts
          ? _self.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as double,
      salesTotal: null == salesTotal
          ? _self.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      returnsTotal: null == returnsTotal
          ? _self.returnsTotal
          : returnsTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netSales: null == netSales
          ? _self.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as double,
      costOfGoodsSold: null == costOfGoodsSold
          ? _self.costOfGoodsSold
          : costOfGoodsSold // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _self.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageSale: null == averageSale
          ? _self.averageSale
          : averageSale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [SalesReportModel].
extension SalesReportModelPatterns on SalesReportModel {
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
    TResult Function(_SalesReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel() when $default != null:
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
    TResult Function(_SalesReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel():
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
    TResult? Function(_SalesReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel() when $default != null:
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
            int salesCount,
            double grossSales,
            double discounts,
            double salesTotal,
            double returnsTotal,
            double netSales,
            double costOfGoodsSold,
            double netProfit,
            double averageSale)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel() when $default != null:
        return $default(
            _that.salesCount,
            _that.grossSales,
            _that.discounts,
            _that.salesTotal,
            _that.returnsTotal,
            _that.netSales,
            _that.costOfGoodsSold,
            _that.netProfit,
            _that.averageSale);
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
            int salesCount,
            double grossSales,
            double discounts,
            double salesTotal,
            double returnsTotal,
            double netSales,
            double costOfGoodsSold,
            double netProfit,
            double averageSale)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel():
        return $default(
            _that.salesCount,
            _that.grossSales,
            _that.discounts,
            _that.salesTotal,
            _that.returnsTotal,
            _that.netSales,
            _that.costOfGoodsSold,
            _that.netProfit,
            _that.averageSale);
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
            int salesCount,
            double grossSales,
            double discounts,
            double salesTotal,
            double returnsTotal,
            double netSales,
            double costOfGoodsSold,
            double netProfit,
            double averageSale)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesReportModel() when $default != null:
        return $default(
            _that.salesCount,
            _that.grossSales,
            _that.discounts,
            _that.salesTotal,
            _that.returnsTotal,
            _that.netSales,
            _that.costOfGoodsSold,
            _that.netProfit,
            _that.averageSale);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SalesReportModel implements SalesReportModel {
  const _SalesReportModel(
      {required this.salesCount,
      required this.grossSales,
      required this.discounts,
      required this.salesTotal,
      required this.returnsTotal,
      required this.netSales,
      required this.costOfGoodsSold,
      required this.netProfit,
      required this.averageSale});
  factory _SalesReportModel.fromJson(Map<String, dynamic> json) =>
      _$SalesReportModelFromJson(json);

  @override
  final int salesCount;
  @override
  final double grossSales;
  @override
  final double discounts;
  @override
  final double salesTotal;
  @override
  final double returnsTotal;
  @override
  final double netSales;
  @override
  final double costOfGoodsSold;
  @override
  final double netProfit;
  @override
  final double averageSale;

  /// Create a copy of SalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SalesReportModelCopyWith<_SalesReportModel> get copyWith =>
      __$SalesReportModelCopyWithImpl<_SalesReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SalesReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SalesReportModel &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.grossSales, grossSales) ||
                other.grossSales == grossSales) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            (identical(other.salesTotal, salesTotal) ||
                other.salesTotal == salesTotal) &&
            (identical(other.returnsTotal, returnsTotal) ||
                other.returnsTotal == returnsTotal) &&
            (identical(other.netSales, netSales) ||
                other.netSales == netSales) &&
            (identical(other.costOfGoodsSold, costOfGoodsSold) ||
                other.costOfGoodsSold == costOfGoodsSold) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            (identical(other.averageSale, averageSale) ||
                other.averageSale == averageSale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesCount,
      grossSales,
      discounts,
      salesTotal,
      returnsTotal,
      netSales,
      costOfGoodsSold,
      netProfit,
      averageSale);

  @override
  String toString() {
    return 'SalesReportModel(salesCount: $salesCount, grossSales: $grossSales, discounts: $discounts, salesTotal: $salesTotal, returnsTotal: $returnsTotal, netSales: $netSales, costOfGoodsSold: $costOfGoodsSold, netProfit: $netProfit, averageSale: $averageSale)';
  }
}

/// @nodoc
abstract mixin class _$SalesReportModelCopyWith<$Res>
    implements $SalesReportModelCopyWith<$Res> {
  factory _$SalesReportModelCopyWith(
          _SalesReportModel value, $Res Function(_SalesReportModel) _then) =
      __$SalesReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int salesCount,
      double grossSales,
      double discounts,
      double salesTotal,
      double returnsTotal,
      double netSales,
      double costOfGoodsSold,
      double netProfit,
      double averageSale});
}

/// @nodoc
class __$SalesReportModelCopyWithImpl<$Res>
    implements _$SalesReportModelCopyWith<$Res> {
  __$SalesReportModelCopyWithImpl(this._self, this._then);

  final _SalesReportModel _self;
  final $Res Function(_SalesReportModel) _then;

  /// Create a copy of SalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? salesCount = null,
    Object? grossSales = null,
    Object? discounts = null,
    Object? salesTotal = null,
    Object? returnsTotal = null,
    Object? netSales = null,
    Object? costOfGoodsSold = null,
    Object? netProfit = null,
    Object? averageSale = null,
  }) {
    return _then(_SalesReportModel(
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossSales: null == grossSales
          ? _self.grossSales
          : grossSales // ignore: cast_nullable_to_non_nullable
              as double,
      discounts: null == discounts
          ? _self.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as double,
      salesTotal: null == salesTotal
          ? _self.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      returnsTotal: null == returnsTotal
          ? _self.returnsTotal
          : returnsTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netSales: null == netSales
          ? _self.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as double,
      costOfGoodsSold: null == costOfGoodsSold
          ? _self.costOfGoodsSold
          : costOfGoodsSold // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _self.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageSale: null == averageSale
          ? _self.averageSale
          : averageSale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
