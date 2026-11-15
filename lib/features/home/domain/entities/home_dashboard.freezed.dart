// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDashboard {
  int get productsCount;
  int get todaySalesCount;
  double get todaySalesTotal;
  int get lowStockCount;
  List<HomeSale> get recentSales;
  List<HomeLowStockProduct> get lowStockProducts;

  /// Create a copy of HomeDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeDashboardCopyWith<HomeDashboard> get copyWith =>
      _$HomeDashboardCopyWithImpl<HomeDashboard>(
          this as HomeDashboard, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeDashboard &&
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
    return 'HomeDashboard(productsCount: $productsCount, todaySalesCount: $todaySalesCount, todaySalesTotal: $todaySalesTotal, lowStockCount: $lowStockCount, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
  }
}

/// @nodoc
abstract mixin class $HomeDashboardCopyWith<$Res> {
  factory $HomeDashboardCopyWith(
          HomeDashboard value, $Res Function(HomeDashboard) _then) =
      _$HomeDashboardCopyWithImpl;
  @useResult
  $Res call(
      {int productsCount,
      int todaySalesCount,
      double todaySalesTotal,
      int lowStockCount,
      List<HomeSale> recentSales,
      List<HomeLowStockProduct> lowStockProducts});
}

/// @nodoc
class _$HomeDashboardCopyWithImpl<$Res>
    implements $HomeDashboardCopyWith<$Res> {
  _$HomeDashboardCopyWithImpl(this._self, this._then);

  final HomeDashboard _self;
  final $Res Function(HomeDashboard) _then;

  /// Create a copy of HomeDashboard
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
              as List<HomeSale>,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<HomeLowStockProduct>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeDashboard].
extension HomeDashboardPatterns on HomeDashboard {
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
    TResult Function(_HomeDashboard value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard() when $default != null:
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
    TResult Function(_HomeDashboard value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard():
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
    TResult? Function(_HomeDashboard value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard() when $default != null:
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
            List<HomeSale> recentSales,
            List<HomeLowStockProduct> lowStockProducts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard() when $default != null:
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
            List<HomeSale> recentSales,
            List<HomeLowStockProduct> lowStockProducts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard():
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
            List<HomeSale> recentSales,
            List<HomeLowStockProduct> lowStockProducts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboard() when $default != null:
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

class _HomeDashboard implements HomeDashboard {
  const _HomeDashboard(
      {this.productsCount = 0,
      this.todaySalesCount = 0,
      this.todaySalesTotal = 0.0,
      this.lowStockCount = 0,
      final List<HomeSale> recentSales = const [],
      final List<HomeLowStockProduct> lowStockProducts = const []})
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
  final List<HomeSale> _recentSales;
  @override
  @JsonKey()
  List<HomeSale> get recentSales {
    if (_recentSales is EqualUnmodifiableListView) return _recentSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSales);
  }

  final List<HomeLowStockProduct> _lowStockProducts;
  @override
  @JsonKey()
  List<HomeLowStockProduct> get lowStockProducts {
    if (_lowStockProducts is EqualUnmodifiableListView)
      return _lowStockProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockProducts);
  }

  /// Create a copy of HomeDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeDashboardCopyWith<_HomeDashboard> get copyWith =>
      __$HomeDashboardCopyWithImpl<_HomeDashboard>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeDashboard &&
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
    return 'HomeDashboard(productsCount: $productsCount, todaySalesCount: $todaySalesCount, todaySalesTotal: $todaySalesTotal, lowStockCount: $lowStockCount, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
  }
}

/// @nodoc
abstract mixin class _$HomeDashboardCopyWith<$Res>
    implements $HomeDashboardCopyWith<$Res> {
  factory _$HomeDashboardCopyWith(
          _HomeDashboard value, $Res Function(_HomeDashboard) _then) =
      __$HomeDashboardCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int productsCount,
      int todaySalesCount,
      double todaySalesTotal,
      int lowStockCount,
      List<HomeSale> recentSales,
      List<HomeLowStockProduct> lowStockProducts});
}

/// @nodoc
class __$HomeDashboardCopyWithImpl<$Res>
    implements _$HomeDashboardCopyWith<$Res> {
  __$HomeDashboardCopyWithImpl(this._self, this._then);

  final _HomeDashboard _self;
  final $Res Function(_HomeDashboard) _then;

  /// Create a copy of HomeDashboard
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
    return _then(_HomeDashboard(
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
              as List<HomeSale>,
      lowStockProducts: null == lowStockProducts
          ? _self._lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<HomeLowStockProduct>,
    ));
  }
}

/// @nodoc
mixin _$HomeSale {
  int get id;
  String get invoiceNumber;
  double get total;
  double get paidAmount;
  String get paymentMethod;
  DateTime get createdAt;

  /// Create a copy of HomeSale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSaleCopyWith<HomeSale> get copyWith =>
      _$HomeSaleCopyWithImpl<HomeSale>(this as HomeSale, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSale &&
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
    return 'HomeSale(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $HomeSaleCopyWith<$Res> {
  factory $HomeSaleCopyWith(HomeSale value, $Res Function(HomeSale) _then) =
      _$HomeSaleCopyWithImpl;
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
class _$HomeSaleCopyWithImpl<$Res> implements $HomeSaleCopyWith<$Res> {
  _$HomeSaleCopyWithImpl(this._self, this._then);

  final HomeSale _self;
  final $Res Function(HomeSale) _then;

  /// Create a copy of HomeSale
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

/// Adds pattern-matching-related methods to [HomeSale].
extension HomeSalePatterns on HomeSale {
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
    TResult Function(_HomeSale value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSale() when $default != null:
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
    TResult Function(_HomeSale value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSale():
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
    TResult? Function(_HomeSale value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSale() when $default != null:
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
      case _HomeSale() when $default != null:
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
      case _HomeSale():
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
      case _HomeSale() when $default != null:
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeSale implements HomeSale {
  const _HomeSale(
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

  /// Create a copy of HomeSale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeSaleCopyWith<_HomeSale> get copyWith =>
      __$HomeSaleCopyWithImpl<_HomeSale>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeSale &&
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
    return 'HomeSale(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$HomeSaleCopyWith<$Res>
    implements $HomeSaleCopyWith<$Res> {
  factory _$HomeSaleCopyWith(_HomeSale value, $Res Function(_HomeSale) _then) =
      __$HomeSaleCopyWithImpl;
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
class __$HomeSaleCopyWithImpl<$Res> implements _$HomeSaleCopyWith<$Res> {
  __$HomeSaleCopyWithImpl(this._self, this._then);

  final _HomeSale _self;
  final $Res Function(_HomeSale) _then;

  /// Create a copy of HomeSale
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
    return _then(_HomeSale(
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
mixin _$HomeLowStockProduct {
  int get id;
  String get name;
  String get barcode;
  double get quantity;
  double get minStock;
  double get salePrice;

  /// Create a copy of HomeLowStockProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeLowStockProductCopyWith<HomeLowStockProduct> get copyWith =>
      _$HomeLowStockProductCopyWithImpl<HomeLowStockProduct>(
          this as HomeLowStockProduct, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeLowStockProduct &&
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
    return 'HomeLowStockProduct(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class $HomeLowStockProductCopyWith<$Res> {
  factory $HomeLowStockProductCopyWith(
          HomeLowStockProduct value, $Res Function(HomeLowStockProduct) _then) =
      _$HomeLowStockProductCopyWithImpl;
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
class _$HomeLowStockProductCopyWithImpl<$Res>
    implements $HomeLowStockProductCopyWith<$Res> {
  _$HomeLowStockProductCopyWithImpl(this._self, this._then);

  final HomeLowStockProduct _self;
  final $Res Function(HomeLowStockProduct) _then;

  /// Create a copy of HomeLowStockProduct
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

/// Adds pattern-matching-related methods to [HomeLowStockProduct].
extension HomeLowStockProductPatterns on HomeLowStockProduct {
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
    TResult Function(_HomeLowStockProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProduct() when $default != null:
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
    TResult Function(_HomeLowStockProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProduct():
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
    TResult? Function(_HomeLowStockProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLowStockProduct() when $default != null:
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
      case _HomeLowStockProduct() when $default != null:
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
      case _HomeLowStockProduct():
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
      case _HomeLowStockProduct() when $default != null:
        return $default(_that.id, _that.name, _that.barcode, _that.quantity,
            _that.minStock, _that.salePrice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeLowStockProduct implements HomeLowStockProduct {
  const _HomeLowStockProduct(
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

  /// Create a copy of HomeLowStockProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeLowStockProductCopyWith<_HomeLowStockProduct> get copyWith =>
      __$HomeLowStockProductCopyWithImpl<_HomeLowStockProduct>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeLowStockProduct &&
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
    return 'HomeLowStockProduct(id: $id, name: $name, barcode: $barcode, quantity: $quantity, minStock: $minStock, salePrice: $salePrice)';
  }
}

/// @nodoc
abstract mixin class _$HomeLowStockProductCopyWith<$Res>
    implements $HomeLowStockProductCopyWith<$Res> {
  factory _$HomeLowStockProductCopyWith(_HomeLowStockProduct value,
          $Res Function(_HomeLowStockProduct) _then) =
      __$HomeLowStockProductCopyWithImpl;
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
class __$HomeLowStockProductCopyWithImpl<$Res>
    implements _$HomeLowStockProductCopyWith<$Res> {
  __$HomeLowStockProductCopyWithImpl(this._self, this._then);

  final _HomeLowStockProduct _self;
  final $Res Function(_HomeLowStockProduct) _then;

  /// Create a copy of HomeLowStockProduct
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
    return _then(_HomeLowStockProduct(
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
