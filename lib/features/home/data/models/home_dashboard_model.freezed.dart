// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDashboardModel {
  int get productsCount;
  int get todaySalesCount;
  double get todaySalesTotal;
  int get lowStockCount;
  List<RecentSaleModel> get recentSales;
  List<LowStockProductModel> get lowStockProducts;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeDashboardModelCopyWith<HomeDashboardModel> get copyWith =>
      _$HomeDashboardModelCopyWithImpl<HomeDashboardModel>(
          this as HomeDashboardModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeDashboardModel &&
            (identical(other.productsCount, productsCount) ||
                other.productsCount == productsCount) &&
            (identical(other.todaySalesCount, todaySalesCount) ||
                other.todaySalesCount == todaySalesCount) &&
            (identical(other.todaySalesTotal, todaySalesTotal) ||
                other.todaySalesTotal == todaySalesTotal) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            const DeepCollectionEquality()
                .equals(other.recentSales, recentSales) &&
            const DeepCollectionEquality()
                .equals(other.lowStockProducts, lowStockProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productsCount,
      todaySalesCount,
      todaySalesTotal,
      lowStockCount,
      const DeepCollectionEquality().hash(recentSales),
      const DeepCollectionEquality().hash(lowStockProducts));

  @override
  String toString() {
    return 'HomeDashboardModel(productsCount: $productsCount, todaySalesCount: $todaySalesCount, todaySalesTotal: $todaySalesTotal, lowStockCount: $lowStockCount, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
  }
}

/// @nodoc
abstract mixin class $HomeDashboardModelCopyWith<$Res> {
  factory $HomeDashboardModelCopyWith(
          HomeDashboardModel value, $Res Function(HomeDashboardModel) _then) =
      _$HomeDashboardModelCopyWithImpl;
  @useResult
  $Res call(
      {int productsCount,
      int todaySalesCount,
      double todaySalesTotal,
      int lowStockCount,
      List<RecentSaleModel> recentSales,
      List<LowStockProductModel> lowStockProducts});
}

/// @nodoc
class _$HomeDashboardModelCopyWithImpl<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  _$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final HomeDashboardModel _self;
  final $Res Function(HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsCount = null,
    Object? todaySalesCount = null,
    Object? todaySalesTotal = null,
    Object? lowStockCount = null,
    Object? recentSales = null,
    Object? lowStockProducts = null,
  }) {
    return _then(_self.copyWith(
      productsCount: null == productsCount
          ? _self.productsCount
          : productsCount // ignore: cast_nullable_to_non_nullable
              as int,
      todaySalesCount: null == todaySalesCount
          ? _self.todaySalesCount
          : todaySalesCount // ignore: cast_nullable_to_non_nullable
              as int,
      todaySalesTotal: null == todaySalesTotal
          ? _self.todaySalesTotal
          : todaySalesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _self.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      recentSales: null == recentSales
          ? _self.recentSales
          : recentSales // ignore: cast_nullable_to_non_nullable
              as List<RecentSaleModel>,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<LowStockProductModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeDashboardModel].
extension HomeDashboardModelPatterns on HomeDashboardModel {
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
    TResult Function(_HomeDashboardModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
    TResult Function(_HomeDashboardModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
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
    TResult? Function(_HomeDashboardModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
            int productsCount,
            int todaySalesCount,
            double todaySalesTotal,
            int lowStockCount,
            List<RecentSaleModel> recentSales,
            List<LowStockProductModel> lowStockProducts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(
            _that.productsCount,
            _that.todaySalesCount,
            _that.todaySalesTotal,
            _that.lowStockCount,
            _that.recentSales,
            _that.lowStockProducts);
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
            int productsCount,
            int todaySalesCount,
            double todaySalesTotal,
            int lowStockCount,
            List<RecentSaleModel> recentSales,
            List<LowStockProductModel> lowStockProducts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
        return $default(
            _that.productsCount,
            _that.todaySalesCount,
            _that.todaySalesTotal,
            _that.lowStockCount,
            _that.recentSales,
            _that.lowStockProducts);
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
            int productsCount,
            int todaySalesCount,
            double todaySalesTotal,
            int lowStockCount,
            List<RecentSaleModel> recentSales,
            List<LowStockProductModel> lowStockProducts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(
            _that.productsCount,
            _that.todaySalesCount,
            _that.todaySalesTotal,
            _that.lowStockCount,
            _that.recentSales,
            _that.lowStockProducts);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeDashboardModel implements HomeDashboardModel {
  const _HomeDashboardModel(
      {this.productsCount = 0,
      this.todaySalesCount = 0,
      this.todaySalesTotal = 0.0,
      this.lowStockCount = 0,
      final List<RecentSaleModel> recentSales = const [],
      final List<LowStockProductModel> lowStockProducts = const []})
      : _recentSales = recentSales,
        _lowStockProducts = lowStockProducts;

  @override
  @JsonKey()
  final int productsCount;
  @override
  @JsonKey()
  final int todaySalesCount;
  @override
  @JsonKey()
  final double todaySalesTotal;
  @override
  @JsonKey()
  final int lowStockCount;
  final List<RecentSaleModel> _recentSales;
  @override
  @JsonKey()
  List<RecentSaleModel> get recentSales {
    if (_recentSales is EqualUnmodifiableListView) return _recentSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSales);
  }

  final List<LowStockProductModel> _lowStockProducts;
  @override
  @JsonKey()
  List<LowStockProductModel> get lowStockProducts {
    if (_lowStockProducts is EqualUnmodifiableListView)
      return _lowStockProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockProducts);
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeDashboardModelCopyWith<_HomeDashboardModel> get copyWith =>
      __$HomeDashboardModelCopyWithImpl<_HomeDashboardModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeDashboardModel &&
            (identical(other.productsCount, productsCount) ||
                other.productsCount == productsCount) &&
            (identical(other.todaySalesCount, todaySalesCount) ||
                other.todaySalesCount == todaySalesCount) &&
            (identical(other.todaySalesTotal, todaySalesTotal) ||
                other.todaySalesTotal == todaySalesTotal) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            const DeepCollectionEquality()
                .equals(other._recentSales, _recentSales) &&
            const DeepCollectionEquality()
                .equals(other._lowStockProducts, _lowStockProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productsCount,
      todaySalesCount,
      todaySalesTotal,
      lowStockCount,
      const DeepCollectionEquality().hash(_recentSales),
      const DeepCollectionEquality().hash(_lowStockProducts));

  @override
  String toString() {
    return 'HomeDashboardModel(productsCount: $productsCount, todaySalesCount: $todaySalesCount, todaySalesTotal: $todaySalesTotal, lowStockCount: $lowStockCount, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
  }
}

/// @nodoc
abstract mixin class _$HomeDashboardModelCopyWith<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  factory _$HomeDashboardModelCopyWith(
          _HomeDashboardModel value, $Res Function(_HomeDashboardModel) _then) =
      __$HomeDashboardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int productsCount,
      int todaySalesCount,
      double todaySalesTotal,
      int lowStockCount,
      List<RecentSaleModel> recentSales,
      List<LowStockProductModel> lowStockProducts});
}

/// @nodoc
class __$HomeDashboardModelCopyWithImpl<$Res>
    implements _$HomeDashboardModelCopyWith<$Res> {
  __$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final _HomeDashboardModel _self;
  final $Res Function(_HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productsCount = null,
    Object? todaySalesCount = null,
    Object? todaySalesTotal = null,
    Object? lowStockCount = null,
    Object? recentSales = null,
    Object? lowStockProducts = null,
  }) {
    return _then(_HomeDashboardModel(
      productsCount: null == productsCount
          ? _self.productsCount
          : productsCount // ignore: cast_nullable_to_non_nullable
              as int,
      todaySalesCount: null == todaySalesCount
          ? _self.todaySalesCount
          : todaySalesCount // ignore: cast_nullable_to_non_nullable
              as int,
      todaySalesTotal: null == todaySalesTotal
          ? _self.todaySalesTotal
          : todaySalesTotal // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _self.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      recentSales: null == recentSales
          ? _self._recentSales
          : recentSales // ignore: cast_nullable_to_non_nullable
              as List<RecentSaleModel>,
      lowStockProducts: null == lowStockProducts
          ? _self._lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<LowStockProductModel>,
    ));
  }
}

// dart format on
