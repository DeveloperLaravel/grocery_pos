// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailySalesReportModel {
  DateTime get date;
  int get salesCount;
  double get totalSales;

  /// Create a copy of DailySalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailySalesReportModelCopyWith<DailySalesReportModel> get copyWith =>
      _$DailySalesReportModelCopyWithImpl<DailySalesReportModel>(
          this as DailySalesReportModel, _$identity);

  /// Serializes this DailySalesReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailySalesReportModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, salesCount, totalSales);

  @override
  String toString() {
    return 'DailySalesReportModel(date: $date, salesCount: $salesCount, totalSales: $totalSales)';
  }
}

/// @nodoc
abstract mixin class $DailySalesReportModelCopyWith<$Res> {
  factory $DailySalesReportModelCopyWith(DailySalesReportModel value,
          $Res Function(DailySalesReportModel) _then) =
      _$DailySalesReportModelCopyWithImpl;
  @useResult
  $Res call({DateTime date, int salesCount, double totalSales});
}

/// @nodoc
class _$DailySalesReportModelCopyWithImpl<$Res>
    implements $DailySalesReportModelCopyWith<$Res> {
  _$DailySalesReportModelCopyWithImpl(this._self, this._then);

  final DailySalesReportModel _self;
  final $Res Function(DailySalesReportModel) _then;

  /// Create a copy of DailySalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? salesCount = null,
    Object? totalSales = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailySalesReportModel].
extension DailySalesReportModelPatterns on DailySalesReportModel {
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
    TResult Function(_DailySalesReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel() when $default != null:
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
    TResult Function(_DailySalesReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel():
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
    TResult? Function(_DailySalesReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel() when $default != null:
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
    TResult Function(DateTime date, int salesCount, double totalSales)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel() when $default != null:
        return $default(_that.date, _that.salesCount, _that.totalSales);
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
    TResult Function(DateTime date, int salesCount, double totalSales) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel():
        return $default(_that.date, _that.salesCount, _that.totalSales);
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
    TResult? Function(DateTime date, int salesCount, double totalSales)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySalesReportModel() when $default != null:
        return $default(_that.date, _that.salesCount, _that.totalSales);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailySalesReportModel implements DailySalesReportModel {
  const _DailySalesReportModel(
      {required this.date, required this.salesCount, required this.totalSales});
  factory _DailySalesReportModel.fromJson(Map<String, dynamic> json) =>
      _$DailySalesReportModelFromJson(json);

  @override
  final DateTime date;
  @override
  final int salesCount;
  @override
  final double totalSales;

  /// Create a copy of DailySalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailySalesReportModelCopyWith<_DailySalesReportModel> get copyWith =>
      __$DailySalesReportModelCopyWithImpl<_DailySalesReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailySalesReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailySalesReportModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, salesCount, totalSales);

  @override
  String toString() {
    return 'DailySalesReportModel(date: $date, salesCount: $salesCount, totalSales: $totalSales)';
  }
}

/// @nodoc
abstract mixin class _$DailySalesReportModelCopyWith<$Res>
    implements $DailySalesReportModelCopyWith<$Res> {
  factory _$DailySalesReportModelCopyWith(_DailySalesReportModel value,
          $Res Function(_DailySalesReportModel) _then) =
      __$DailySalesReportModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, int salesCount, double totalSales});
}

/// @nodoc
class __$DailySalesReportModelCopyWithImpl<$Res>
    implements _$DailySalesReportModelCopyWith<$Res> {
  __$DailySalesReportModelCopyWithImpl(this._self, this._then);

  final _DailySalesReportModel _self;
  final $Res Function(_DailySalesReportModel) _then;

  /// Create a copy of DailySalesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? salesCount = null,
    Object? totalSales = null,
  }) {
    return _then(_DailySalesReportModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
