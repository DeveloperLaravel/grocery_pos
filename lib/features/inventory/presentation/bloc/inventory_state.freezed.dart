// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryState {
  bool get isLoading;
  bool get isAdjusting;
  List<InventoryItem> get inventory;
  InventorySummary get summary;
  List<InventoryItem> get lowStockProducts;
  List<StockMovement> get movements;
  int? get selectedProductId;
  int get movementsLimit;
  String get query;
  bool get lowStockOnly;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryStateCopyWith<InventoryState> get copyWith =>
      _$InventoryStateCopyWithImpl<InventoryState>(
          this as InventoryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdjusting, isAdjusting) ||
                other.isAdjusting == isAdjusting) &&
            const DeepCollectionEquality().equals(other.inventory, inventory) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other.lowStockProducts, lowStockProducts) &&
            const DeepCollectionEquality().equals(other.movements, movements) &&
            (identical(other.selectedProductId, selectedProductId) ||
                other.selectedProductId == selectedProductId) &&
            (identical(other.movementsLimit, movementsLimit) ||
                other.movementsLimit == movementsLimit) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isAdjusting,
      const DeepCollectionEquality().hash(inventory),
      summary,
      const DeepCollectionEquality().hash(lowStockProducts),
      const DeepCollectionEquality().hash(movements),
      selectedProductId,
      movementsLimit,
      query,
      lowStockOnly,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'InventoryState(isLoading: $isLoading, isAdjusting: $isAdjusting, inventory: $inventory, summary: $summary, lowStockProducts: $lowStockProducts, movements: $movements, selectedProductId: $selectedProductId, movementsLimit: $movementsLimit, query: $query, lowStockOnly: $lowStockOnly, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) _then) =
      _$InventoryStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdjusting,
      List<InventoryItem> inventory,
      InventorySummary summary,
      List<InventoryItem> lowStockProducts,
      List<StockMovement> movements,
      int? selectedProductId,
      int movementsLimit,
      String query,
      bool lowStockOnly,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAdjusting = null,
    Object? inventory = null,
    Object? summary = null,
    Object? lowStockProducts = null,
    Object? movements = null,
    Object? selectedProductId = freezed,
    Object? movementsLimit = null,
    Object? query = null,
    Object? lowStockOnly = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdjusting: null == isAdjusting
          ? _self.isAdjusting
          : isAdjusting // ignore: cast_nullable_to_non_nullable
              as bool,
      inventory: null == inventory
          ? _self.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as InventorySummary,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      movements: null == movements
          ? _self.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<StockMovement>,
      selectedProductId: freezed == selectedProductId
          ? _self.selectedProductId
          : selectedProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      movementsLimit: null == movementsLimit
          ? _self.movementsLimit
          : movementsLimit // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      lowStockOnly: null == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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
    TResult Function(_InventoryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
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
    TResult Function(_InventoryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState():
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
    TResult? Function(_InventoryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
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
            bool isLoading,
            bool isAdjusting,
            List<InventoryItem> inventory,
            InventorySummary summary,
            List<InventoryItem> lowStockProducts,
            List<StockMovement> movements,
            int? selectedProductId,
            int movementsLimit,
            String query,
            bool lowStockOnly,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
        return $default(
            _that.isLoading,
            _that.isAdjusting,
            _that.inventory,
            _that.summary,
            _that.lowStockProducts,
            _that.movements,
            _that.selectedProductId,
            _that.movementsLimit,
            _that.query,
            _that.lowStockOnly,
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
            bool isLoading,
            bool isAdjusting,
            List<InventoryItem> inventory,
            InventorySummary summary,
            List<InventoryItem> lowStockProducts,
            List<StockMovement> movements,
            int? selectedProductId,
            int movementsLimit,
            String query,
            bool lowStockOnly,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState():
        return $default(
            _that.isLoading,
            _that.isAdjusting,
            _that.inventory,
            _that.summary,
            _that.lowStockProducts,
            _that.movements,
            _that.selectedProductId,
            _that.movementsLimit,
            _that.query,
            _that.lowStockOnly,
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
            bool isLoading,
            bool isAdjusting,
            List<InventoryItem> inventory,
            InventorySummary summary,
            List<InventoryItem> lowStockProducts,
            List<StockMovement> movements,
            int? selectedProductId,
            int movementsLimit,
            String query,
            bool lowStockOnly,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
        return $default(
            _that.isLoading,
            _that.isAdjusting,
            _that.inventory,
            _that.summary,
            _that.lowStockProducts,
            _that.movements,
            _that.selectedProductId,
            _that.movementsLimit,
            _that.query,
            _that.lowStockOnly,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InventoryState implements InventoryState {
  const _InventoryState(
      {this.isLoading = false,
      this.isAdjusting = false,
      final List<InventoryItem> inventory = const [],
      this.summary = InventorySummary.empty,
      final List<InventoryItem> lowStockProducts = const [],
      final List<StockMovement> movements = const [],
      this.selectedProductId,
      this.movementsLimit = 50,
      this.query = '',
      this.lowStockOnly = false,
      this.errorMessage,
      this.successMessage})
      : _inventory = inventory,
        _lowStockProducts = lowStockProducts,
        _movements = movements;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAdjusting;
  final List<InventoryItem> _inventory;
  @override
  @JsonKey()
  List<InventoryItem> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  @JsonKey()
  final InventorySummary summary;
  final List<InventoryItem> _lowStockProducts;
  @override
  @JsonKey()
  List<InventoryItem> get lowStockProducts {
    if (_lowStockProducts is EqualUnmodifiableListView)
      return _lowStockProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockProducts);
  }

  final List<StockMovement> _movements;
  @override
  @JsonKey()
  List<StockMovement> get movements {
    if (_movements is EqualUnmodifiableListView) return _movements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  @override
  final int? selectedProductId;
  @override
  @JsonKey()
  final int movementsLimit;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool lowStockOnly;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryStateCopyWith<_InventoryState> get copyWith =>
      __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdjusting, isAdjusting) ||
                other.isAdjusting == isAdjusting) &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._lowStockProducts, _lowStockProducts) &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements) &&
            (identical(other.selectedProductId, selectedProductId) ||
                other.selectedProductId == selectedProductId) &&
            (identical(other.movementsLimit, movementsLimit) ||
                other.movementsLimit == movementsLimit) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isAdjusting,
      const DeepCollectionEquality().hash(_inventory),
      summary,
      const DeepCollectionEquality().hash(_lowStockProducts),
      const DeepCollectionEquality().hash(_movements),
      selectedProductId,
      movementsLimit,
      query,
      lowStockOnly,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'InventoryState(isLoading: $isLoading, isAdjusting: $isAdjusting, inventory: $inventory, summary: $summary, lowStockProducts: $lowStockProducts, movements: $movements, selectedProductId: $selectedProductId, movementsLimit: $movementsLimit, query: $query, lowStockOnly: $lowStockOnly, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(
          _InventoryState value, $Res Function(_InventoryState) _then) =
      __$InventoryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdjusting,
      List<InventoryItem> inventory,
      InventorySummary summary,
      List<InventoryItem> lowStockProducts,
      List<StockMovement> movements,
      int? selectedProductId,
      int movementsLimit,
      String query,
      bool lowStockOnly,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isAdjusting = null,
    Object? inventory = null,
    Object? summary = null,
    Object? lowStockProducts = null,
    Object? movements = null,
    Object? selectedProductId = freezed,
    Object? movementsLimit = null,
    Object? query = null,
    Object? lowStockOnly = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_InventoryState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdjusting: null == isAdjusting
          ? _self.isAdjusting
          : isAdjusting // ignore: cast_nullable_to_non_nullable
              as bool,
      inventory: null == inventory
          ? _self._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as InventorySummary,
      lowStockProducts: null == lowStockProducts
          ? _self._lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      movements: null == movements
          ? _self._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<StockMovement>,
      selectedProductId: freezed == selectedProductId
          ? _self.selectedProductId
          : selectedProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      movementsLimit: null == movementsLimit
          ? _self.movementsLimit
          : movementsLimit // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      lowStockOnly: null == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
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
