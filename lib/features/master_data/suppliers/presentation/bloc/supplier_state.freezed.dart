// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierState {
// =========================================================
// Suppliers
// =========================================================
  List<Supplier> get suppliers;
  Supplier?
      get selectedSupplier; // =========================================================
// Current Query
// =========================================================
  SupplierListQuery? get currentQuery;
  SupplierWatchQuery? get currentWatchQuery;
  String
      get currentSearchQuery; // =========================================================
// Loading States
// =========================================================
  bool get isLoading;
  bool get isSubmitting;
  bool get isDeleting;
  bool get isSearching;
  bool get isWatching;
  bool get isLoadingDetails;
  bool
      get isLoadingMore; // =========================================================
// Financial States
// =========================================================
  bool
      get isUpdatingBalance; // =========================================================
// Management States
// =========================================================
  bool get isUpdatingRating;
  bool get isUpdatingStatus;
  bool get isUpdatingPreferred;
  bool
      get isUpdatingActivityDate; // =========================================================
// Validation
// =========================================================
  bool get isValidatingCode;
  bool?
      get supplierCodeExists; // =========================================================
// Statistics
// =========================================================
  SupplierStatistics? get statistics;
  int get totalSuppliers;
  int get activeSuppliers;
  double
      get totalBalance; // =========================================================
// Pagination
// =========================================================
  int get pageSize;
  int get currentOffset;
  bool get hasMore; // =========================================================
// Messages
// =========================================================
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierStateCopyWith<SupplierState> get copyWith =>
      _$SupplierStateCopyWithImpl<SupplierState>(
          this as SupplierState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierState &&
            const DeepCollectionEquality().equals(other.suppliers, suppliers) &&
            (identical(other.selectedSupplier, selectedSupplier) ||
                other.selectedSupplier == selectedSupplier) &&
            (identical(other.currentQuery, currentQuery) ||
                other.currentQuery == currentQuery) &&
            (identical(other.currentWatchQuery, currentWatchQuery) ||
                other.currentWatchQuery == currentWatchQuery) &&
            (identical(other.currentSearchQuery, currentSearchQuery) ||
                other.currentSearchQuery == currentSearchQuery) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isUpdatingBalance, isUpdatingBalance) ||
                other.isUpdatingBalance == isUpdatingBalance) &&
            (identical(other.isUpdatingRating, isUpdatingRating) ||
                other.isUpdatingRating == isUpdatingRating) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            (identical(other.isUpdatingPreferred, isUpdatingPreferred) ||
                other.isUpdatingPreferred == isUpdatingPreferred) &&
            (identical(other.isUpdatingActivityDate, isUpdatingActivityDate) ||
                other.isUpdatingActivityDate == isUpdatingActivityDate) &&
            (identical(other.isValidatingCode, isValidatingCode) ||
                other.isValidatingCode == isValidatingCode) &&
            (identical(other.supplierCodeExists, supplierCodeExists) ||
                other.supplierCodeExists == supplierCodeExists) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.totalSuppliers, totalSuppliers) ||
                other.totalSuppliers == totalSuppliers) &&
            (identical(other.activeSuppliers, activeSuppliers) ||
                other.activeSuppliers == activeSuppliers) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(suppliers),
        selectedSupplier,
        currentQuery,
        currentWatchQuery,
        currentSearchQuery,
        isLoading,
        isSubmitting,
        isDeleting,
        isSearching,
        isWatching,
        isLoadingDetails,
        isLoadingMore,
        isUpdatingBalance,
        isUpdatingRating,
        isUpdatingStatus,
        isUpdatingPreferred,
        isUpdatingActivityDate,
        isValidatingCode,
        supplierCodeExists,
        statistics,
        totalSuppliers,
        activeSuppliers,
        totalBalance,
        pageSize,
        currentOffset,
        hasMore,
        errorMessage,
        successMessage
      ]);

  @override
  String toString() {
    return 'SupplierState(suppliers: $suppliers, selectedSupplier: $selectedSupplier, currentQuery: $currentQuery, currentWatchQuery: $currentWatchQuery, currentSearchQuery: $currentSearchQuery, isLoading: $isLoading, isSubmitting: $isSubmitting, isDeleting: $isDeleting, isSearching: $isSearching, isWatching: $isWatching, isLoadingDetails: $isLoadingDetails, isLoadingMore: $isLoadingMore, isUpdatingBalance: $isUpdatingBalance, isUpdatingRating: $isUpdatingRating, isUpdatingStatus: $isUpdatingStatus, isUpdatingPreferred: $isUpdatingPreferred, isUpdatingActivityDate: $isUpdatingActivityDate, isValidatingCode: $isValidatingCode, supplierCodeExists: $supplierCodeExists, statistics: $statistics, totalSuppliers: $totalSuppliers, activeSuppliers: $activeSuppliers, totalBalance: $totalBalance, pageSize: $pageSize, currentOffset: $currentOffset, hasMore: $hasMore, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $SupplierStateCopyWith<$Res> {
  factory $SupplierStateCopyWith(
          SupplierState value, $Res Function(SupplierState) _then) =
      _$SupplierStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Supplier> suppliers,
      Supplier? selectedSupplier,
      SupplierListQuery? currentQuery,
      SupplierWatchQuery? currentWatchQuery,
      String currentSearchQuery,
      bool isLoading,
      bool isSubmitting,
      bool isDeleting,
      bool isSearching,
      bool isWatching,
      bool isLoadingDetails,
      bool isLoadingMore,
      bool isUpdatingBalance,
      bool isUpdatingRating,
      bool isUpdatingStatus,
      bool isUpdatingPreferred,
      bool isUpdatingActivityDate,
      bool isValidatingCode,
      bool? supplierCodeExists,
      SupplierStatistics? statistics,
      int totalSuppliers,
      int activeSuppliers,
      double totalBalance,
      int pageSize,
      int currentOffset,
      bool hasMore,
      String? errorMessage,
      String? successMessage});

  $SupplierCopyWith<$Res>? get selectedSupplier;
}

/// @nodoc
class _$SupplierStateCopyWithImpl<$Res>
    implements $SupplierStateCopyWith<$Res> {
  _$SupplierStateCopyWithImpl(this._self, this._then);

  final SupplierState _self;
  final $Res Function(SupplierState) _then;

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suppliers = null,
    Object? selectedSupplier = freezed,
    Object? currentQuery = freezed,
    Object? currentWatchQuery = freezed,
    Object? currentSearchQuery = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isDeleting = null,
    Object? isSearching = null,
    Object? isWatching = null,
    Object? isLoadingDetails = null,
    Object? isLoadingMore = null,
    Object? isUpdatingBalance = null,
    Object? isUpdatingRating = null,
    Object? isUpdatingStatus = null,
    Object? isUpdatingPreferred = null,
    Object? isUpdatingActivityDate = null,
    Object? isValidatingCode = null,
    Object? supplierCodeExists = freezed,
    Object? statistics = freezed,
    Object? totalSuppliers = null,
    Object? activeSuppliers = null,
    Object? totalBalance = null,
    Object? pageSize = null,
    Object? currentOffset = null,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      suppliers: null == suppliers
          ? _self.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      selectedSupplier: freezed == selectedSupplier
          ? _self.selectedSupplier
          : selectedSupplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      currentQuery: freezed == currentQuery
          ? _self.currentQuery
          : currentQuery // ignore: cast_nullable_to_non_nullable
              as SupplierListQuery?,
      currentWatchQuery: freezed == currentWatchQuery
          ? _self.currentWatchQuery
          : currentWatchQuery // ignore: cast_nullable_to_non_nullable
              as SupplierWatchQuery?,
      currentSearchQuery: null == currentSearchQuery
          ? _self.currentSearchQuery
          : currentSearchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _self.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingBalance: null == isUpdatingBalance
          ? _self.isUpdatingBalance
          : isUpdatingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingRating: null == isUpdatingRating
          ? _self.isUpdatingRating
          : isUpdatingRating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _self.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingPreferred: null == isUpdatingPreferred
          ? _self.isUpdatingPreferred
          : isUpdatingPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingActivityDate: null == isUpdatingActivityDate
          ? _self.isUpdatingActivityDate
          : isUpdatingActivityDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidatingCode: null == isValidatingCode
          ? _self.isValidatingCode
          : isValidatingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      supplierCodeExists: freezed == supplierCodeExists
          ? _self.supplierCodeExists
          : supplierCodeExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      statistics: freezed == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as SupplierStatistics?,
      totalSuppliers: null == totalSuppliers
          ? _self.totalSuppliers
          : totalSuppliers // ignore: cast_nullable_to_non_nullable
              as int,
      activeSuppliers: null == activeSuppliers
          ? _self.activeSuppliers
          : activeSuppliers // ignore: cast_nullable_to_non_nullable
              as int,
      totalBalance: null == totalBalance
          ? _self.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentOffset: null == currentOffset
          ? _self.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get selectedSupplier {
    if (_self.selectedSupplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.selectedSupplier!, (value) {
      return _then(_self.copyWith(selectedSupplier: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SupplierState].
extension SupplierStatePatterns on SupplierState {
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
    TResult Function(_SupplierState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierState() when $default != null:
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
    TResult Function(_SupplierState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierState():
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
    TResult? Function(_SupplierState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierState() when $default != null:
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
            List<Supplier> suppliers,
            Supplier? selectedSupplier,
            SupplierListQuery? currentQuery,
            SupplierWatchQuery? currentWatchQuery,
            String currentSearchQuery,
            bool isLoading,
            bool isSubmitting,
            bool isDeleting,
            bool isSearching,
            bool isWatching,
            bool isLoadingDetails,
            bool isLoadingMore,
            bool isUpdatingBalance,
            bool isUpdatingRating,
            bool isUpdatingStatus,
            bool isUpdatingPreferred,
            bool isUpdatingActivityDate,
            bool isValidatingCode,
            bool? supplierCodeExists,
            SupplierStatistics? statistics,
            int totalSuppliers,
            int activeSuppliers,
            double totalBalance,
            int pageSize,
            int currentOffset,
            bool hasMore,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierState() when $default != null:
        return $default(
            _that.suppliers,
            _that.selectedSupplier,
            _that.currentQuery,
            _that.currentWatchQuery,
            _that.currentSearchQuery,
            _that.isLoading,
            _that.isSubmitting,
            _that.isDeleting,
            _that.isSearching,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isLoadingMore,
            _that.isUpdatingBalance,
            _that.isUpdatingRating,
            _that.isUpdatingStatus,
            _that.isUpdatingPreferred,
            _that.isUpdatingActivityDate,
            _that.isValidatingCode,
            _that.supplierCodeExists,
            _that.statistics,
            _that.totalSuppliers,
            _that.activeSuppliers,
            _that.totalBalance,
            _that.pageSize,
            _that.currentOffset,
            _that.hasMore,
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
            List<Supplier> suppliers,
            Supplier? selectedSupplier,
            SupplierListQuery? currentQuery,
            SupplierWatchQuery? currentWatchQuery,
            String currentSearchQuery,
            bool isLoading,
            bool isSubmitting,
            bool isDeleting,
            bool isSearching,
            bool isWatching,
            bool isLoadingDetails,
            bool isLoadingMore,
            bool isUpdatingBalance,
            bool isUpdatingRating,
            bool isUpdatingStatus,
            bool isUpdatingPreferred,
            bool isUpdatingActivityDate,
            bool isValidatingCode,
            bool? supplierCodeExists,
            SupplierStatistics? statistics,
            int totalSuppliers,
            int activeSuppliers,
            double totalBalance,
            int pageSize,
            int currentOffset,
            bool hasMore,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierState():
        return $default(
            _that.suppliers,
            _that.selectedSupplier,
            _that.currentQuery,
            _that.currentWatchQuery,
            _that.currentSearchQuery,
            _that.isLoading,
            _that.isSubmitting,
            _that.isDeleting,
            _that.isSearching,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isLoadingMore,
            _that.isUpdatingBalance,
            _that.isUpdatingRating,
            _that.isUpdatingStatus,
            _that.isUpdatingPreferred,
            _that.isUpdatingActivityDate,
            _that.isValidatingCode,
            _that.supplierCodeExists,
            _that.statistics,
            _that.totalSuppliers,
            _that.activeSuppliers,
            _that.totalBalance,
            _that.pageSize,
            _that.currentOffset,
            _that.hasMore,
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
            List<Supplier> suppliers,
            Supplier? selectedSupplier,
            SupplierListQuery? currentQuery,
            SupplierWatchQuery? currentWatchQuery,
            String currentSearchQuery,
            bool isLoading,
            bool isSubmitting,
            bool isDeleting,
            bool isSearching,
            bool isWatching,
            bool isLoadingDetails,
            bool isLoadingMore,
            bool isUpdatingBalance,
            bool isUpdatingRating,
            bool isUpdatingStatus,
            bool isUpdatingPreferred,
            bool isUpdatingActivityDate,
            bool isValidatingCode,
            bool? supplierCodeExists,
            SupplierStatistics? statistics,
            int totalSuppliers,
            int activeSuppliers,
            double totalBalance,
            int pageSize,
            int currentOffset,
            bool hasMore,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierState() when $default != null:
        return $default(
            _that.suppliers,
            _that.selectedSupplier,
            _that.currentQuery,
            _that.currentWatchQuery,
            _that.currentSearchQuery,
            _that.isLoading,
            _that.isSubmitting,
            _that.isDeleting,
            _that.isSearching,
            _that.isWatching,
            _that.isLoadingDetails,
            _that.isLoadingMore,
            _that.isUpdatingBalance,
            _that.isUpdatingRating,
            _that.isUpdatingStatus,
            _that.isUpdatingPreferred,
            _that.isUpdatingActivityDate,
            _that.isValidatingCode,
            _that.supplierCodeExists,
            _that.statistics,
            _that.totalSuppliers,
            _that.activeSuppliers,
            _that.totalBalance,
            _that.pageSize,
            _that.currentOffset,
            _that.hasMore,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SupplierState implements SupplierState {
  const _SupplierState(
      {final List<Supplier> suppliers = const [],
      this.selectedSupplier,
      this.currentQuery,
      this.currentWatchQuery,
      this.currentSearchQuery = '',
      this.isLoading = false,
      this.isSubmitting = false,
      this.isDeleting = false,
      this.isSearching = false,
      this.isWatching = false,
      this.isLoadingDetails = false,
      this.isLoadingMore = false,
      this.isUpdatingBalance = false,
      this.isUpdatingRating = false,
      this.isUpdatingStatus = false,
      this.isUpdatingPreferred = false,
      this.isUpdatingActivityDate = false,
      this.isValidatingCode = false,
      this.supplierCodeExists,
      this.statistics,
      this.totalSuppliers = 0,
      this.activeSuppliers = 0,
      this.totalBalance = 0.0,
      this.pageSize = 20,
      this.currentOffset = 0,
      this.hasMore = false,
      this.errorMessage,
      this.successMessage})
      : _suppliers = suppliers;

// =========================================================
// Suppliers
// =========================================================
  final List<Supplier> _suppliers;
// =========================================================
// Suppliers
// =========================================================
  @override
  @JsonKey()
  List<Supplier> get suppliers {
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suppliers);
  }

  @override
  final Supplier? selectedSupplier;
// =========================================================
// Current Query
// =========================================================
  @override
  final SupplierListQuery? currentQuery;
  @override
  final SupplierWatchQuery? currentWatchQuery;
  @override
  @JsonKey()
  final String currentSearchQuery;
// =========================================================
// Loading States
// =========================================================
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isWatching;
  @override
  @JsonKey()
  final bool isLoadingDetails;
  @override
  @JsonKey()
  final bool isLoadingMore;
// =========================================================
// Financial States
// =========================================================
  @override
  @JsonKey()
  final bool isUpdatingBalance;
// =========================================================
// Management States
// =========================================================
  @override
  @JsonKey()
  final bool isUpdatingRating;
  @override
  @JsonKey()
  final bool isUpdatingStatus;
  @override
  @JsonKey()
  final bool isUpdatingPreferred;
  @override
  @JsonKey()
  final bool isUpdatingActivityDate;
// =========================================================
// Validation
// =========================================================
  @override
  @JsonKey()
  final bool isValidatingCode;
  @override
  final bool? supplierCodeExists;
// =========================================================
// Statistics
// =========================================================
  @override
  final SupplierStatistics? statistics;
  @override
  @JsonKey()
  final int totalSuppliers;
  @override
  @JsonKey()
  final int activeSuppliers;
  @override
  @JsonKey()
  final double totalBalance;
// =========================================================
// Pagination
// =========================================================
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final bool hasMore;
// =========================================================
// Messages
// =========================================================
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierStateCopyWith<_SupplierState> get copyWith =>
      __$SupplierStateCopyWithImpl<_SupplierState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SupplierState &&
            const DeepCollectionEquality()
                .equals(other._suppliers, _suppliers) &&
            (identical(other.selectedSupplier, selectedSupplier) ||
                other.selectedSupplier == selectedSupplier) &&
            (identical(other.currentQuery, currentQuery) ||
                other.currentQuery == currentQuery) &&
            (identical(other.currentWatchQuery, currentWatchQuery) ||
                other.currentWatchQuery == currentWatchQuery) &&
            (identical(other.currentSearchQuery, currentSearchQuery) ||
                other.currentSearchQuery == currentSearchQuery) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isUpdatingBalance, isUpdatingBalance) ||
                other.isUpdatingBalance == isUpdatingBalance) &&
            (identical(other.isUpdatingRating, isUpdatingRating) ||
                other.isUpdatingRating == isUpdatingRating) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            (identical(other.isUpdatingPreferred, isUpdatingPreferred) ||
                other.isUpdatingPreferred == isUpdatingPreferred) &&
            (identical(other.isUpdatingActivityDate, isUpdatingActivityDate) ||
                other.isUpdatingActivityDate == isUpdatingActivityDate) &&
            (identical(other.isValidatingCode, isValidatingCode) ||
                other.isValidatingCode == isValidatingCode) &&
            (identical(other.supplierCodeExists, supplierCodeExists) ||
                other.supplierCodeExists == supplierCodeExists) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.totalSuppliers, totalSuppliers) ||
                other.totalSuppliers == totalSuppliers) &&
            (identical(other.activeSuppliers, activeSuppliers) ||
                other.activeSuppliers == activeSuppliers) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_suppliers),
        selectedSupplier,
        currentQuery,
        currentWatchQuery,
        currentSearchQuery,
        isLoading,
        isSubmitting,
        isDeleting,
        isSearching,
        isWatching,
        isLoadingDetails,
        isLoadingMore,
        isUpdatingBalance,
        isUpdatingRating,
        isUpdatingStatus,
        isUpdatingPreferred,
        isUpdatingActivityDate,
        isValidatingCode,
        supplierCodeExists,
        statistics,
        totalSuppliers,
        activeSuppliers,
        totalBalance,
        pageSize,
        currentOffset,
        hasMore,
        errorMessage,
        successMessage
      ]);

  @override
  String toString() {
    return 'SupplierState(suppliers: $suppliers, selectedSupplier: $selectedSupplier, currentQuery: $currentQuery, currentWatchQuery: $currentWatchQuery, currentSearchQuery: $currentSearchQuery, isLoading: $isLoading, isSubmitting: $isSubmitting, isDeleting: $isDeleting, isSearching: $isSearching, isWatching: $isWatching, isLoadingDetails: $isLoadingDetails, isLoadingMore: $isLoadingMore, isUpdatingBalance: $isUpdatingBalance, isUpdatingRating: $isUpdatingRating, isUpdatingStatus: $isUpdatingStatus, isUpdatingPreferred: $isUpdatingPreferred, isUpdatingActivityDate: $isUpdatingActivityDate, isValidatingCode: $isValidatingCode, supplierCodeExists: $supplierCodeExists, statistics: $statistics, totalSuppliers: $totalSuppliers, activeSuppliers: $activeSuppliers, totalBalance: $totalBalance, pageSize: $pageSize, currentOffset: $currentOffset, hasMore: $hasMore, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$SupplierStateCopyWith<$Res>
    implements $SupplierStateCopyWith<$Res> {
  factory _$SupplierStateCopyWith(
          _SupplierState value, $Res Function(_SupplierState) _then) =
      __$SupplierStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Supplier> suppliers,
      Supplier? selectedSupplier,
      SupplierListQuery? currentQuery,
      SupplierWatchQuery? currentWatchQuery,
      String currentSearchQuery,
      bool isLoading,
      bool isSubmitting,
      bool isDeleting,
      bool isSearching,
      bool isWatching,
      bool isLoadingDetails,
      bool isLoadingMore,
      bool isUpdatingBalance,
      bool isUpdatingRating,
      bool isUpdatingStatus,
      bool isUpdatingPreferred,
      bool isUpdatingActivityDate,
      bool isValidatingCode,
      bool? supplierCodeExists,
      SupplierStatistics? statistics,
      int totalSuppliers,
      int activeSuppliers,
      double totalBalance,
      int pageSize,
      int currentOffset,
      bool hasMore,
      String? errorMessage,
      String? successMessage});

  @override
  $SupplierCopyWith<$Res>? get selectedSupplier;
}

/// @nodoc
class __$SupplierStateCopyWithImpl<$Res>
    implements _$SupplierStateCopyWith<$Res> {
  __$SupplierStateCopyWithImpl(this._self, this._then);

  final _SupplierState _self;
  final $Res Function(_SupplierState) _then;

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? suppliers = null,
    Object? selectedSupplier = freezed,
    Object? currentQuery = freezed,
    Object? currentWatchQuery = freezed,
    Object? currentSearchQuery = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isDeleting = null,
    Object? isSearching = null,
    Object? isWatching = null,
    Object? isLoadingDetails = null,
    Object? isLoadingMore = null,
    Object? isUpdatingBalance = null,
    Object? isUpdatingRating = null,
    Object? isUpdatingStatus = null,
    Object? isUpdatingPreferred = null,
    Object? isUpdatingActivityDate = null,
    Object? isValidatingCode = null,
    Object? supplierCodeExists = freezed,
    Object? statistics = freezed,
    Object? totalSuppliers = null,
    Object? activeSuppliers = null,
    Object? totalBalance = null,
    Object? pageSize = null,
    Object? currentOffset = null,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_SupplierState(
      suppliers: null == suppliers
          ? _self._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      selectedSupplier: freezed == selectedSupplier
          ? _self.selectedSupplier
          : selectedSupplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      currentQuery: freezed == currentQuery
          ? _self.currentQuery
          : currentQuery // ignore: cast_nullable_to_non_nullable
              as SupplierListQuery?,
      currentWatchQuery: freezed == currentWatchQuery
          ? _self.currentWatchQuery
          : currentWatchQuery // ignore: cast_nullable_to_non_nullable
              as SupplierWatchQuery?,
      currentSearchQuery: null == currentSearchQuery
          ? _self.currentSearchQuery
          : currentSearchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _self.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingBalance: null == isUpdatingBalance
          ? _self.isUpdatingBalance
          : isUpdatingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingRating: null == isUpdatingRating
          ? _self.isUpdatingRating
          : isUpdatingRating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _self.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingPreferred: null == isUpdatingPreferred
          ? _self.isUpdatingPreferred
          : isUpdatingPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingActivityDate: null == isUpdatingActivityDate
          ? _self.isUpdatingActivityDate
          : isUpdatingActivityDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidatingCode: null == isValidatingCode
          ? _self.isValidatingCode
          : isValidatingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      supplierCodeExists: freezed == supplierCodeExists
          ? _self.supplierCodeExists
          : supplierCodeExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      statistics: freezed == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as SupplierStatistics?,
      totalSuppliers: null == totalSuppliers
          ? _self.totalSuppliers
          : totalSuppliers // ignore: cast_nullable_to_non_nullable
              as int,
      activeSuppliers: null == activeSuppliers
          ? _self.activeSuppliers
          : activeSuppliers // ignore: cast_nullable_to_non_nullable
              as int,
      totalBalance: null == totalBalance
          ? _self.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentOffset: null == currentOffset
          ? _self.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of SupplierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get selectedSupplier {
    if (_self.selectedSupplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.selectedSupplier!, (value) {
      return _then(_self.copyWith(selectedSupplier: value));
    });
  }
}

// dart format on
