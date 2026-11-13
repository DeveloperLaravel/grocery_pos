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
  Sale? get selectedSale;
  String get searchQuery;
  int get limit;
  bool get isLoading;
  bool get isWatching;
  bool get isLoadingDetails;
  bool get isCancelling;
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
            (identical(other.selectedSale, selectedSale) ||
                other.selectedSale == selectedSale) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.isCancelling, isCancelling) ||
                other.isCancelling == isCancelling) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sales),
      selectedSale,
      searchQuery,
      limit,
      isLoading,
      isWatching,
      isLoadingDetails,
      isCancelling,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'SalesState(sales: $sales, selectedSale: $selectedSale, searchQuery: $searchQuery, limit: $limit, isLoading: $isLoading, isWatching: $isWatching, isLoadingDetails: $isLoadingDetails, isCancelling: $isCancelling, errorMessage: $errorMessage, successMessage: $successMessage)';
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
      Sale? selectedSale,
      String searchQuery,
      int limit,
      bool isLoading,
      bool isWatching,
      bool isLoadingDetails,
      bool isCancelling,
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
    Object? selectedSale = freezed,
    Object? searchQuery = null,
    Object? limit = null,
    Object? isLoading = null,
    Object? isWatching = null,
    Object? isLoadingDetails = null,
    Object? isCancelling = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      sales: null == sales
          ? _self.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      selectedSale: freezed == selectedSale
          ? _self.selectedSale
          : selectedSale // ignore: cast_nullable_to_non_nullable
              as Sale?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _self.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _self.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
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
            Sale? selectedSale,
            String searchQuery,
            int limit,
            bool isLoading,
            bool isWatching,
            bool isLoadingDetails,
            bool isCancelling,
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
            _that.selectedSale,
            _that.searchQuery,
            _that.limit,
            _that.isLoading,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isCancelling,
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
            Sale? selectedSale,
            String searchQuery,
            int limit,
            bool isLoading,
            bool isWatching,
            bool isLoadingDetails,
            bool isCancelling,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState():
        return $default(
            _that.sales,
            _that.selectedSale,
            _that.searchQuery,
            _that.limit,
            _that.isLoading,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isCancelling,
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
            Sale? selectedSale,
            String searchQuery,
            int limit,
            bool isLoading,
            bool isWatching,
            bool isLoadingDetails,
            bool isCancelling,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalesState() when $default != null:
        return $default(
            _that.sales,
            _that.selectedSale,
            _that.searchQuery,
            _that.limit,
            _that.isLoading,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isCancelling,
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
      this.selectedSale,
      this.searchQuery = '',
      this.limit = 100,
      this.isLoading = false,
      this.isWatching = false,
      this.isLoadingDetails = false,
      this.isCancelling = false,
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
  final Sale? selectedSale;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isWatching;
  @override
  @JsonKey()
  final bool isLoadingDetails;
  @override
  @JsonKey()
  final bool isCancelling;
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
            (identical(other.selectedSale, selectedSale) ||
                other.selectedSale == selectedSale) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.isCancelling, isCancelling) ||
                other.isCancelling == isCancelling) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sales),
      selectedSale,
      searchQuery,
      limit,
      isLoading,
      isWatching,
      isLoadingDetails,
      isCancelling,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'SalesState(sales: $sales, selectedSale: $selectedSale, searchQuery: $searchQuery, limit: $limit, isLoading: $isLoading, isWatching: $isWatching, isLoadingDetails: $isLoadingDetails, isCancelling: $isCancelling, errorMessage: $errorMessage, successMessage: $successMessage)';
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
      Sale? selectedSale,
      String searchQuery,
      int limit,
      bool isLoading,
      bool isWatching,
      bool isLoadingDetails,
      bool isCancelling,
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
    Object? selectedSale = freezed,
    Object? searchQuery = null,
    Object? limit = null,
    Object? isLoading = null,
    Object? isWatching = null,
    Object? isLoadingDetails = null,
    Object? isCancelling = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_SalesState(
      sales: null == sales
          ? _self._sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
      selectedSale: freezed == selectedSale
          ? _self.selectedSale
          : selectedSale // ignore: cast_nullable_to_non_nullable
              as Sale?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _self.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _self.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
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
