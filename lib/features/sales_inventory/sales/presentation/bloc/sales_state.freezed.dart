// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesState {
  List<Sale> get sales;
  bool get isLoading;
  bool get isSearching;
  bool get isCheckingOut;
  bool get isLoadingStatistics;
  int get salesCount;
  double get totalSales;
  double get totalPaid;
  double get totalRemaining;
  int? get lastCreatedSaleId;
  String? get searchQuery;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesStateCopyWith<SalesState> get copyWith =>
      _$SalesStateCopyWithImpl<SalesState>(this as SalesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesState &&
            const DeepCollectionEquality().equals(other.sales, sales) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isCheckingOut, isCheckingOut) ||
                other.isCheckingOut == isCheckingOut) &&
            (identical(other.isLoadingStatistics, isLoadingStatistics) ||
                other.isLoadingStatistics == isLoadingStatistics) &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.totalRemaining, totalRemaining) ||
                other.totalRemaining == totalRemaining) &&
            (identical(other.lastCreatedSaleId, lastCreatedSaleId) ||
                other.lastCreatedSaleId == lastCreatedSaleId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sales),
      isLoading,
      isSearching,
      isCheckingOut,
      isLoadingStatistics,
      salesCount,
      totalSales,
      totalPaid,
      totalRemaining,
      lastCreatedSaleId,
      searchQuery,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'SalesState(sales: $sales, isLoading: $isLoading, isSearching: $isSearching, isCheckingOut: $isCheckingOut, isLoadingStatistics: $isLoadingStatistics, salesCount: $salesCount, totalSales: $totalSales, totalPaid: $totalPaid, totalRemaining: $totalRemaining, lastCreatedSaleId: $lastCreatedSaleId, searchQuery: $searchQuery, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $SalesStateCopyWith<$Res> {
  factory $SalesStateCopyWith(
          SalesState value, $Res Function(SalesState) _then) =
      _$SalesStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Sale> sales,
      bool isLoading,
      bool isSearching,
      bool isCheckingOut,
      bool isLoadingStatistics,
      int salesCount,
      double totalSales,
      double totalPaid,
      double totalRemaining,
      int? lastCreatedSaleId,
      String? searchQuery,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$SalesStateCopyWithImpl<$Res> implements $SalesStateCopyWith<$Res> {
  _$SalesStateCopyWithImpl(this._self, this._then);

  final SalesState _self;
  final $Res Function(SalesState) _then;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sales = null,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isCheckingOut = null,
    Object? isLoadingStatistics = null,
    Object? salesCount = null,
    Object? totalSales = null,
    Object? totalPaid = null,
    Object? totalRemaining = null,
    Object? lastCreatedSaleId = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      sales: null == sales
          ? _self.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingOut: null == isCheckingOut
          ? _self.isCheckingOut
          : isCheckingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStatistics: null == isLoadingStatistics
          ? _self.isLoadingStatistics
          : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalRemaining: null == totalRemaining
          ? _self.totalRemaining
          : totalRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      lastCreatedSaleId: freezed == lastCreatedSaleId
          ? _self.lastCreatedSaleId
          : lastCreatedSaleId // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SalesState].
extension SalesStatePatterns on SalesState {
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
    TResult Function(_SalesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalesState() when $default != null:
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
    TResult Function(_SalesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState():
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
    TResult? Function(_SalesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState() when $default != null:
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
            List<Sale> sales,
            bool isLoading,
            bool isSearching,
            bool isCheckingOut,
            bool isLoadingStatistics,
            int salesCount,
            double totalSales,
            double totalPaid,
            double totalRemaining,
            int? lastCreatedSaleId,
            String? searchQuery,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalesState() when $default != null:
        return $default(
            _that.sales,
            _that.isLoading,
            _that.isSearching,
            _that.isCheckingOut,
            _that.isLoadingStatistics,
            _that.salesCount,
            _that.totalSales,
            _that.totalPaid,
            _that.totalRemaining,
            _that.lastCreatedSaleId,
            _that.searchQuery,
            _that.errorMessage,
            _that.successMessage);
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
            List<Sale> sales,
            bool isLoading,
            bool isSearching,
            bool isCheckingOut,
            bool isLoadingStatistics,
            int salesCount,
            double totalSales,
            double totalPaid,
            double totalRemaining,
            int? lastCreatedSaleId,
            String? searchQuery,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState():
        return $default(
            _that.sales,
            _that.isLoading,
            _that.isSearching,
            _that.isCheckingOut,
            _that.isLoadingStatistics,
            _that.salesCount,
            _that.totalSales,
            _that.totalPaid,
            _that.totalRemaining,
            _that.lastCreatedSaleId,
            _that.searchQuery,
            _that.errorMessage,
            _that.successMessage);
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
            List<Sale> sales,
            bool isLoading,
            bool isSearching,
            bool isCheckingOut,
            bool isLoadingStatistics,
            int salesCount,
            double totalSales,
            double totalPaid,
            double totalRemaining,
            int? lastCreatedSaleId,
            String? searchQuery,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState() when $default != null:
        return $default(
            _that.sales,
            _that.isLoading,
            _that.isSearching,
            _that.isCheckingOut,
            _that.isLoadingStatistics,
            _that.salesCount,
            _that.totalSales,
            _that.totalPaid,
            _that.totalRemaining,
            _that.lastCreatedSaleId,
            _that.searchQuery,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SalesState extends SalesState {
  const _SalesState(
      {final List<Sale> sales = const [],
      this.isLoading = false,
      this.isSearching = false,
      this.isCheckingOut = false,
      this.isLoadingStatistics = false,
      this.salesCount = 0,
      this.totalSales = 0.0,
      this.totalPaid = 0.0,
      this.totalRemaining = 0.0,
      this.lastCreatedSaleId,
      this.searchQuery,
      this.errorMessage,
      this.successMessage})
      : _sales = sales,
        super._();

  final List<Sale> _sales;
  @override
  @JsonKey()
  List<Sale> get sales {
    if (_sales is EqualUnmodifiableListView) return _sales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sales);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isCheckingOut;
  @override
  @JsonKey()
  final bool isLoadingStatistics;
  @override
  @JsonKey()
  final int salesCount;
  @override
  @JsonKey()
  final double totalSales;
  @override
  @JsonKey()
  final double totalPaid;
  @override
  @JsonKey()
  final double totalRemaining;
  @override
  final int? lastCreatedSaleId;
  @override
  final String? searchQuery;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SalesStateCopyWith<_SalesState> get copyWith =>
      __$SalesStateCopyWithImpl<_SalesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SalesState &&
            const DeepCollectionEquality().equals(other._sales, _sales) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isCheckingOut, isCheckingOut) ||
                other.isCheckingOut == isCheckingOut) &&
            (identical(other.isLoadingStatistics, isLoadingStatistics) ||
                other.isLoadingStatistics == isLoadingStatistics) &&
            (identical(other.salesCount, salesCount) ||
                other.salesCount == salesCount) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.totalRemaining, totalRemaining) ||
                other.totalRemaining == totalRemaining) &&
            (identical(other.lastCreatedSaleId, lastCreatedSaleId) ||
                other.lastCreatedSaleId == lastCreatedSaleId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sales),
      isLoading,
      isSearching,
      isCheckingOut,
      isLoadingStatistics,
      salesCount,
      totalSales,
      totalPaid,
      totalRemaining,
      lastCreatedSaleId,
      searchQuery,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'SalesState(sales: $sales, isLoading: $isLoading, isSearching: $isSearching, isCheckingOut: $isCheckingOut, isLoadingStatistics: $isLoadingStatistics, salesCount: $salesCount, totalSales: $totalSales, totalPaid: $totalPaid, totalRemaining: $totalRemaining, lastCreatedSaleId: $lastCreatedSaleId, searchQuery: $searchQuery, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$SalesStateCopyWith<$Res>
    implements $SalesStateCopyWith<$Res> {
  factory _$SalesStateCopyWith(
          _SalesState value, $Res Function(_SalesState) _then) =
      __$SalesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Sale> sales,
      bool isLoading,
      bool isSearching,
      bool isCheckingOut,
      bool isLoadingStatistics,
      int salesCount,
      double totalSales,
      double totalPaid,
      double totalRemaining,
      int? lastCreatedSaleId,
      String? searchQuery,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$SalesStateCopyWithImpl<$Res> implements _$SalesStateCopyWith<$Res> {
  __$SalesStateCopyWithImpl(this._self, this._then);

  final _SalesState _self;
  final $Res Function(_SalesState) _then;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sales = null,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isCheckingOut = null,
    Object? isLoadingStatistics = null,
    Object? salesCount = null,
    Object? totalSales = null,
    Object? totalPaid = null,
    Object? totalRemaining = null,
    Object? lastCreatedSaleId = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_SalesState(
      sales: null == sales
          ? _self._sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingOut: null == isCheckingOut
          ? _self.isCheckingOut
          : isCheckingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStatistics: null == isLoadingStatistics
          ? _self.isLoadingStatistics
          : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      salesCount: null == salesCount
          ? _self.salesCount
          : salesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalRemaining: null == totalRemaining
          ? _self.totalRemaining
          : totalRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      lastCreatedSaleId: freezed == lastCreatedSaleId
          ? _self.lastCreatedSaleId
          : lastCreatedSaleId // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
