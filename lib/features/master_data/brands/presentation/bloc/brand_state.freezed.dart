// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandState {
// Main data
  List<Brand> get brands;
  List<Brand> get filteredBrands;
  Brand? get selectedBrand; // Main status
  BrandStatus get status; // Operation loading
  bool get isCreating;
  bool get isUpdating;
  bool get isDeleting;
  bool get isTogglingStatus;
  bool get isSearching;
  bool get isCheckingName;
  bool get isLoadingStatistics; // Statistics
  int get totalBrands;
  int get activeBrands; // Search
  String get searchQuery; // Name validation
  bool? get nameExists; // Messages
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrandStateCopyWith<BrandState> get copyWith =>
      _$BrandStateCopyWithImpl<BrandState>(this as BrandState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrandState &&
            const DeepCollectionEquality().equals(other.brands, brands) &&
            const DeepCollectionEquality()
                .equals(other.filteredBrands, filteredBrands) &&
            (identical(other.selectedBrand, selectedBrand) ||
                other.selectedBrand == selectedBrand) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isTogglingStatus, isTogglingStatus) ||
                other.isTogglingStatus == isTogglingStatus) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isCheckingName, isCheckingName) ||
                other.isCheckingName == isCheckingName) &&
            (identical(other.isLoadingStatistics, isLoadingStatistics) ||
                other.isLoadingStatistics == isLoadingStatistics) &&
            (identical(other.totalBrands, totalBrands) ||
                other.totalBrands == totalBrands) &&
            (identical(other.activeBrands, activeBrands) ||
                other.activeBrands == activeBrands) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.nameExists, nameExists) ||
                other.nameExists == nameExists) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brands),
      const DeepCollectionEquality().hash(filteredBrands),
      selectedBrand,
      status,
      isCreating,
      isUpdating,
      isDeleting,
      isTogglingStatus,
      isSearching,
      isCheckingName,
      isLoadingStatistics,
      totalBrands,
      activeBrands,
      searchQuery,
      nameExists,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BrandState(brands: $brands, filteredBrands: $filteredBrands, selectedBrand: $selectedBrand, status: $status, isCreating: $isCreating, isUpdating: $isUpdating, isDeleting: $isDeleting, isTogglingStatus: $isTogglingStatus, isSearching: $isSearching, isCheckingName: $isCheckingName, isLoadingStatistics: $isLoadingStatistics, totalBrands: $totalBrands, activeBrands: $activeBrands, searchQuery: $searchQuery, nameExists: $nameExists, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) _then) =
      _$BrandStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Brand> brands,
      List<Brand> filteredBrands,
      Brand? selectedBrand,
      BrandStatus status,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      bool isTogglingStatus,
      bool isSearching,
      bool isCheckingName,
      bool isLoadingStatistics,
      int totalBrands,
      int activeBrands,
      String searchQuery,
      bool? nameExists,
      String? errorMessage,
      String? successMessage});

  $BrandCopyWith<$Res>? get selectedBrand;
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res> implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._self, this._then);

  final BrandState _self;
  final $Res Function(BrandState) _then;

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? filteredBrands = null,
    Object? selectedBrand = freezed,
    Object? status = null,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? isTogglingStatus = null,
    Object? isSearching = null,
    Object? isCheckingName = null,
    Object? isLoadingStatistics = null,
    Object? totalBrands = null,
    Object? activeBrands = null,
    Object? searchQuery = null,
    Object? nameExists = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      brands: null == brands
          ? _self.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      filteredBrands: null == filteredBrands
          ? _self.filteredBrands
          : filteredBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      selectedBrand: freezed == selectedBrand
          ? _self.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BrandStatus,
      isCreating: null == isCreating
          ? _self.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _self.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingStatus: null == isTogglingStatus
          ? _self.isTogglingStatus
          : isTogglingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingName: null == isCheckingName
          ? _self.isCheckingName
          : isCheckingName // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStatistics: null == isLoadingStatistics
          ? _self.isLoadingStatistics
          : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      totalBrands: null == totalBrands
          ? _self.totalBrands
          : totalBrands // ignore: cast_nullable_to_non_nullable
              as int,
      activeBrands: null == activeBrands
          ? _self.activeBrands
          : activeBrands // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      nameExists: freezed == nameExists
          ? _self.nameExists
          : nameExists // ignore: cast_nullable_to_non_nullable
              as bool?,
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

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res>? get selectedBrand {
    if (_self.selectedBrand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_self.selectedBrand!, (value) {
      return _then(_self.copyWith(selectedBrand: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BrandState].
extension BrandStatePatterns on BrandState {
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
    TResult Function(_BrandState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandState() when $default != null:
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
    TResult Function(_BrandState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandState():
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
    TResult? Function(_BrandState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandState() when $default != null:
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
            List<Brand> brands,
            List<Brand> filteredBrands,
            Brand? selectedBrand,
            BrandStatus status,
            bool isCreating,
            bool isUpdating,
            bool isDeleting,
            bool isTogglingStatus,
            bool isSearching,
            bool isCheckingName,
            bool isLoadingStatistics,
            int totalBrands,
            int activeBrands,
            String searchQuery,
            bool? nameExists,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandState() when $default != null:
        return $default(
            _that.brands,
            _that.filteredBrands,
            _that.selectedBrand,
            _that.status,
            _that.isCreating,
            _that.isUpdating,
            _that.isDeleting,
            _that.isTogglingStatus,
            _that.isSearching,
            _that.isCheckingName,
            _that.isLoadingStatistics,
            _that.totalBrands,
            _that.activeBrands,
            _that.searchQuery,
            _that.nameExists,
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
            List<Brand> brands,
            List<Brand> filteredBrands,
            Brand? selectedBrand,
            BrandStatus status,
            bool isCreating,
            bool isUpdating,
            bool isDeleting,
            bool isTogglingStatus,
            bool isSearching,
            bool isCheckingName,
            bool isLoadingStatistics,
            int totalBrands,
            int activeBrands,
            String searchQuery,
            bool? nameExists,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandState():
        return $default(
            _that.brands,
            _that.filteredBrands,
            _that.selectedBrand,
            _that.status,
            _that.isCreating,
            _that.isUpdating,
            _that.isDeleting,
            _that.isTogglingStatus,
            _that.isSearching,
            _that.isCheckingName,
            _that.isLoadingStatistics,
            _that.totalBrands,
            _that.activeBrands,
            _that.searchQuery,
            _that.nameExists,
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
            List<Brand> brands,
            List<Brand> filteredBrands,
            Brand? selectedBrand,
            BrandStatus status,
            bool isCreating,
            bool isUpdating,
            bool isDeleting,
            bool isTogglingStatus,
            bool isSearching,
            bool isCheckingName,
            bool isLoadingStatistics,
            int totalBrands,
            int activeBrands,
            String searchQuery,
            bool? nameExists,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandState() when $default != null:
        return $default(
            _that.brands,
            _that.filteredBrands,
            _that.selectedBrand,
            _that.status,
            _that.isCreating,
            _that.isUpdating,
            _that.isDeleting,
            _that.isTogglingStatus,
            _that.isSearching,
            _that.isCheckingName,
            _that.isLoadingStatistics,
            _that.totalBrands,
            _that.activeBrands,
            _that.searchQuery,
            _that.nameExists,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BrandState implements BrandState {
  const _BrandState(
      {final List<Brand> brands = const [],
      final List<Brand> filteredBrands = const [],
      this.selectedBrand,
      this.status = BrandStatus.initial,
      this.isCreating = false,
      this.isUpdating = false,
      this.isDeleting = false,
      this.isTogglingStatus = false,
      this.isSearching = false,
      this.isCheckingName = false,
      this.isLoadingStatistics = false,
      this.totalBrands = 0,
      this.activeBrands = 0,
      this.searchQuery = '',
      this.nameExists,
      this.errorMessage,
      this.successMessage})
      : _brands = brands,
        _filteredBrands = filteredBrands;

// Main data
  final List<Brand> _brands;
// Main data
  @override
  @JsonKey()
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  final List<Brand> _filteredBrands;
  @override
  @JsonKey()
  List<Brand> get filteredBrands {
    if (_filteredBrands is EqualUnmodifiableListView) return _filteredBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredBrands);
  }

  @override
  final Brand? selectedBrand;
// Main status
  @override
  @JsonKey()
  final BrandStatus status;
// Operation loading
  @override
  @JsonKey()
  final bool isCreating;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isTogglingStatus;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isCheckingName;
  @override
  @JsonKey()
  final bool isLoadingStatistics;
// Statistics
  @override
  @JsonKey()
  final int totalBrands;
  @override
  @JsonKey()
  final int activeBrands;
// Search
  @override
  @JsonKey()
  final String searchQuery;
// Name validation
  @override
  final bool? nameExists;
// Messages
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrandStateCopyWith<_BrandState> get copyWith =>
      __$BrandStateCopyWithImpl<_BrandState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrandState &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality()
                .equals(other._filteredBrands, _filteredBrands) &&
            (identical(other.selectedBrand, selectedBrand) ||
                other.selectedBrand == selectedBrand) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isTogglingStatus, isTogglingStatus) ||
                other.isTogglingStatus == isTogglingStatus) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isCheckingName, isCheckingName) ||
                other.isCheckingName == isCheckingName) &&
            (identical(other.isLoadingStatistics, isLoadingStatistics) ||
                other.isLoadingStatistics == isLoadingStatistics) &&
            (identical(other.totalBrands, totalBrands) ||
                other.totalBrands == totalBrands) &&
            (identical(other.activeBrands, activeBrands) ||
                other.activeBrands == activeBrands) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.nameExists, nameExists) ||
                other.nameExists == nameExists) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_filteredBrands),
      selectedBrand,
      status,
      isCreating,
      isUpdating,
      isDeleting,
      isTogglingStatus,
      isSearching,
      isCheckingName,
      isLoadingStatistics,
      totalBrands,
      activeBrands,
      searchQuery,
      nameExists,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BrandState(brands: $brands, filteredBrands: $filteredBrands, selectedBrand: $selectedBrand, status: $status, isCreating: $isCreating, isUpdating: $isUpdating, isDeleting: $isDeleting, isTogglingStatus: $isTogglingStatus, isSearching: $isSearching, isCheckingName: $isCheckingName, isLoadingStatistics: $isLoadingStatistics, totalBrands: $totalBrands, activeBrands: $activeBrands, searchQuery: $searchQuery, nameExists: $nameExists, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$BrandStateCopyWith<$Res>
    implements $BrandStateCopyWith<$Res> {
  factory _$BrandStateCopyWith(
          _BrandState value, $Res Function(_BrandState) _then) =
      __$BrandStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Brand> brands,
      List<Brand> filteredBrands,
      Brand? selectedBrand,
      BrandStatus status,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      bool isTogglingStatus,
      bool isSearching,
      bool isCheckingName,
      bool isLoadingStatistics,
      int totalBrands,
      int activeBrands,
      String searchQuery,
      bool? nameExists,
      String? errorMessage,
      String? successMessage});

  @override
  $BrandCopyWith<$Res>? get selectedBrand;
}

/// @nodoc
class __$BrandStateCopyWithImpl<$Res> implements _$BrandStateCopyWith<$Res> {
  __$BrandStateCopyWithImpl(this._self, this._then);

  final _BrandState _self;
  final $Res Function(_BrandState) _then;

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brands = null,
    Object? filteredBrands = null,
    Object? selectedBrand = freezed,
    Object? status = null,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? isTogglingStatus = null,
    Object? isSearching = null,
    Object? isCheckingName = null,
    Object? isLoadingStatistics = null,
    Object? totalBrands = null,
    Object? activeBrands = null,
    Object? searchQuery = null,
    Object? nameExists = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_BrandState(
      brands: null == brands
          ? _self._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      filteredBrands: null == filteredBrands
          ? _self._filteredBrands
          : filteredBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      selectedBrand: freezed == selectedBrand
          ? _self.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BrandStatus,
      isCreating: null == isCreating
          ? _self.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _self.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingStatus: null == isTogglingStatus
          ? _self.isTogglingStatus
          : isTogglingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingName: null == isCheckingName
          ? _self.isCheckingName
          : isCheckingName // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStatistics: null == isLoadingStatistics
          ? _self.isLoadingStatistics
          : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
      totalBrands: null == totalBrands
          ? _self.totalBrands
          : totalBrands // ignore: cast_nullable_to_non_nullable
              as int,
      activeBrands: null == activeBrands
          ? _self.activeBrands
          : activeBrands // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      nameExists: freezed == nameExists
          ? _self.nameExists
          : nameExists // ignore: cast_nullable_to_non_nullable
              as bool?,
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

  /// Create a copy of BrandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res>? get selectedBrand {
    if (_self.selectedBrand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_self.selectedBrand!, (value) {
      return _then(_self.copyWith(selectedBrand: value));
    });
  }
}

// dart format on
