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
  List<HomeSaleModel> get recentSales;
  List<HomeLowStockProductModel> get lowStockProducts;

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
      List<HomeSaleModel> recentSales,
      List<HomeLowStockProductModel> lowStockProducts});
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
              as List<HomeSaleModel>,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<HomeLowStockProductModel>,
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
            List<HomeSaleModel> recentSales,
            List<HomeLowStockProductModel> lowStockProducts)?
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
            List<HomeSaleModel> recentSales,
            List<HomeLowStockProductModel> lowStockProducts)
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
            List<HomeSaleModel> recentSales,
            List<HomeLowStockProductModel> lowStockProducts)?
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
      final List<HomeSaleModel> recentSales = const [],
      final List<HomeLowStockProductModel> lowStockProducts = const []})
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
  final List<HomeSaleModel> _recentSales;
  @override
  @JsonKey()
  List<HomeSaleModel> get recentSales {
    if (_recentSales is EqualUnmodifiableListView) return _recentSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSales);
  }

  final List<HomeLowStockProductModel> _lowStockProducts;
  @override
  @JsonKey()
  List<HomeLowStockProductModel> get lowStockProducts {
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
      List<HomeSaleModel> recentSales,
      List<HomeLowStockProductModel> lowStockProducts});
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
              as List<HomeSaleModel>,
      lowStockProducts: null == lowStockProducts
          ? _self._lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<HomeLowStockProductModel>,
    ));
  }
}

/// @nodoc
mixin _$HomeSaleModel {
  int get id;
  String get invoiceNumber;
  double get total;
  double get paidAmount;
  String get paymentMethod;
  DateTime get createdAt;

  /// Create a copy of HomeSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSaleModelCopyWith<HomeSaleModel> get copyWith =>
      _$HomeSaleModelCopyWithImpl<HomeSaleModel>(
          this as HomeSaleModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNumber, total,
      paidAmount, paymentMethod, createdAt);

  @override
  String toString() {
    return 'HomeSaleModel(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $HomeSaleModelCopyWith<$Res> {
  factory $HomeSaleModelCopyWith(
          HomeSaleModel value, $Res Function(HomeSaleModel) _then) =
      _$HomeSaleModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double total,
      double paidAmount,
      String paymentMethod,
      DateTime createdAt});
}

/// @nodoc
class _$HomeSaleModelCopyWithImpl<$Res>
    implements $HomeSaleModelCopyWith<$Res> {
  _$HomeSaleModelCopyWithImpl(this._self, this._then);

  final HomeSaleModel _self;
  final $Res Function(HomeSaleModel) _then;

  /// Create a copy of HomeSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeSaleModel].
extension HomeSaleModelPatterns on HomeSaleModel {
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
    TResult Function(_HomeSaleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel() when $default != null:
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
    TResult Function(_HomeSaleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel():
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
    TResult? Function(_HomeSaleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel() when $default != null:
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
    TResult Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel() when $default != null:
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
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
    TResult Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel():
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
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
    TResult? Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSaleModel() when $default != null:
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeSaleModel implements HomeSaleModel {
  const _HomeSaleModel(
      {required this.id,
      required this.invoiceNumber,
      required this.total,
      required this.paidAmount,
      required this.paymentMethod,
      required this.createdAt});

  @override
  final int id;
  @override
  final String invoiceNumber;
  @override
  final double total;
  @override
  final double paidAmount;
  @override
  final String paymentMethod;
  @override
  final DateTime createdAt;

  /// Create a copy of HomeSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeSaleModelCopyWith<_HomeSaleModel> get copyWith =>
      __$HomeSaleModelCopyWithImpl<_HomeSaleModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNumber, total,
      paidAmount, paymentMethod, createdAt);

  @override
  String toString() {
    return 'HomeSaleModel(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$HomeSaleModelCopyWith<$Res>
    implements $HomeSaleModelCopyWith<$Res> {
  factory _$HomeSaleModelCopyWith(
          _HomeSaleModel value, $Res Function(_HomeSaleModel) _then) =
      __$HomeSaleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double total,
      double paidAmount,
      String paymentMethod,
      DateTime createdAt});
}

/// @nodoc
class __$HomeSaleModelCopyWithImpl<$Res>
    implements _$HomeSaleModelCopyWith<$Res> {
  __$HomeSaleModelCopyWithImpl(this._self, this._then);

  final _HomeSaleModel _self;
  final $Res Function(_HomeSaleModel) _then;

  /// Create a copy of HomeSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
  }) {
    return _then(_HomeSaleModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
mixin _$HomeLowStockProductModel {
  int get id;
  String get name;
  String get barcode;
  double get quantity;
  double get minStock;
  double get salePrice;

  /// Create a copy of HomeLowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeLowStockProductModelCopyWith<HomeLowStockProductModel> get copyWith =>
      _$HomeLowStockProductModelCopyWithImpl<HomeLowStockProductModel>(
          this as HomeLowStockProductModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeLowStockProductModel &&
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
    return 'HomeLowStockProductModel(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class $HomeLowStockProductModelCopyWith<$Res> {
  factory $HomeLowStockProductModelCopyWith(HomeLowStockProductModel value,
          $Res Function(HomeLowStockProductModel) _then) =
      _$HomeLowStockProductModelCopyWithImpl;
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
class _$HomeLowStockProductModelCopyWithImpl<$Res>
    implements $HomeLowStockProductModelCopyWith<$Res> {
  _$HomeLowStockProductModelCopyWithImpl(this._self, this._then);

  final HomeLowStockProductModel _self;
  final $Res Function(HomeLowStockProductModel) _then;

  /// Create a copy of HomeLowStockProductModel
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

/// Adds pattern-matching-related methods to [HomeLowStockProductModel].
extension HomeLowStockProductModelPatterns on HomeLowStockProductModel {
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
    TResult Function(_HomeLowStockProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProductModel() when $default != null:
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
    TResult Function(_HomeLowStockProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProductModel():
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
    TResult? Function(_HomeLowStockProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProductModel() when $default != null:
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
      case _HomeLowStockProductModel() when $default != null:
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
      case _HomeLowStockProductModel():
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
      case _HomeLowStockProductModel() when $default != null:
        return $default(_that.id, _that.name, _that.barcode, _that.quantity,
            _that.minStock, _that.salePrice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeLowStockProductModel implements HomeLowStockProductModel {
  const _HomeLowStockProductModel(
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

  /// Create a copy of HomeLowStockProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeLowStockProductModelCopyWith<_HomeLowStockProductModel> get copyWith =>
      __$HomeLowStockProductModelCopyWithImpl<_HomeLowStockProductModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeLowStockProductModel &&
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
    return 'HomeLowStockProductModel(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class _$HomeLowStockProductModelCopyWith<$Res>
    implements $HomeLowStockProductModelCopyWith<$Res> {
  factory _$HomeLowStockProductModelCopyWith(_HomeLowStockProductModel value,
          $Res Function(_HomeLowStockProductModel) _then) =
      __$HomeLowStockProductModelCopyWithImpl;
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
class __$HomeLowStockProductModelCopyWithImpl<$Res>
    implements _$HomeLowStockProductModelCopyWith<$Res> {
  __$HomeLowStockProductModelCopyWithImpl(this._self, this._then);

  final _HomeLowStockProductModel _self;
  final $Res Function(_HomeLowStockProductModel) _then;

  /// Create a copy of HomeLowStockProductModel
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
    return _then(_HomeLowStockProductModel(
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
