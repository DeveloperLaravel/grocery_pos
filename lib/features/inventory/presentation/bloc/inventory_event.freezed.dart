// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent()';
  }
}

/// @nodoc
class $InventoryEventCopyWith<$Res> {
  $InventoryEventCopyWith(InventoryEvent _, $Res Function(InventoryEvent) __);
}

/// Adds pattern-matching-related methods to [InventoryEvent].
extension InventoryEventPatterns on InventoryEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryStarted value)? started,
    TResult Function(InventoryRefreshRequested value)? refreshRequested,
    TResult Function(InventorySearchChanged value)? searchChanged,
    TResult Function(InventoryLowStockToggled value)? lowStockToggled,
    TResult Function(StockMovementsFilterChanged value)? movementsFilterChanged,
    TResult Function(StockAdjustmentSubmitted value)? stockAdjustmentSubmitted,
    TResult Function(InventoryChanged value)? inventoryChanged,
    TResult Function(InventorySummaryChanged value)? summaryChanged,
    TResult Function(LowStockChanged value)? lowStockChanged,
    TResult Function(StockMovementsChanged value)? movementsChanged,
    TResult Function(InventoryStreamFailed value)? streamFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started(_that);
      case InventoryRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled(_that);
      case StockMovementsFilterChanged() when movementsFilterChanged != null:
        return movementsFilterChanged(_that);
      case StockAdjustmentSubmitted() when stockAdjustmentSubmitted != null:
        return stockAdjustmentSubmitted(_that);
      case InventoryChanged() when inventoryChanged != null:
        return inventoryChanged(_that);
      case InventorySummaryChanged() when summaryChanged != null:
        return summaryChanged(_that);
      case LowStockChanged() when lowStockChanged != null:
        return lowStockChanged(_that);
      case StockMovementsChanged() when movementsChanged != null:
        return movementsChanged(_that);
      case InventoryStreamFailed() when streamFailed != null:
        return streamFailed(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryStarted value) started,
    required TResult Function(InventoryRefreshRequested value) refreshRequested,
    required TResult Function(InventorySearchChanged value) searchChanged,
    required TResult Function(InventoryLowStockToggled value) lowStockToggled,
    required TResult Function(StockMovementsFilterChanged value)
        movementsFilterChanged,
    required TResult Function(StockAdjustmentSubmitted value)
        stockAdjustmentSubmitted,
    required TResult Function(InventoryChanged value) inventoryChanged,
    required TResult Function(InventorySummaryChanged value) summaryChanged,
    required TResult Function(LowStockChanged value) lowStockChanged,
    required TResult Function(StockMovementsChanged value) movementsChanged,
    required TResult Function(InventoryStreamFailed value) streamFailed,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted():
        return started(_that);
      case InventoryRefreshRequested():
        return refreshRequested(_that);
      case InventorySearchChanged():
        return searchChanged(_that);
      case InventoryLowStockToggled():
        return lowStockToggled(_that);
      case StockMovementsFilterChanged():
        return movementsFilterChanged(_that);
      case StockAdjustmentSubmitted():
        return stockAdjustmentSubmitted(_that);
      case InventoryChanged():
        return inventoryChanged(_that);
      case InventorySummaryChanged():
        return summaryChanged(_that);
      case LowStockChanged():
        return lowStockChanged(_that);
      case StockMovementsChanged():
        return movementsChanged(_that);
      case InventoryStreamFailed():
        return streamFailed(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryStarted value)? started,
    TResult? Function(InventoryRefreshRequested value)? refreshRequested,
    TResult? Function(InventorySearchChanged value)? searchChanged,
    TResult? Function(InventoryLowStockToggled value)? lowStockToggled,
    TResult? Function(StockMovementsFilterChanged value)?
        movementsFilterChanged,
    TResult? Function(StockAdjustmentSubmitted value)? stockAdjustmentSubmitted,
    TResult? Function(InventoryChanged value)? inventoryChanged,
    TResult? Function(InventorySummaryChanged value)? summaryChanged,
    TResult? Function(LowStockChanged value)? lowStockChanged,
    TResult? Function(StockMovementsChanged value)? movementsChanged,
    TResult? Function(InventoryStreamFailed value)? streamFailed,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started(_that);
      case InventoryRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled(_that);
      case StockMovementsFilterChanged() when movementsFilterChanged != null:
        return movementsFilterChanged(_that);
      case StockAdjustmentSubmitted() when stockAdjustmentSubmitted != null:
        return stockAdjustmentSubmitted(_that);
      case InventoryChanged() when inventoryChanged != null:
        return inventoryChanged(_that);
      case InventorySummaryChanged() when summaryChanged != null:
        return summaryChanged(_that);
      case LowStockChanged() when lowStockChanged != null:
        return lowStockChanged(_that);
      case StockMovementsChanged() when movementsChanged != null:
        return movementsChanged(_that);
      case InventoryStreamFailed() when streamFailed != null:
        return streamFailed(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refreshRequested,
    TResult Function(String query)? searchChanged,
    TResult Function()? lowStockToggled,
    TResult Function(int? productId, int limit)? movementsFilterChanged,
    TResult Function(int productId, double quantity, String type,
            String? reference, String? note)?
        stockAdjustmentSubmitted,
    TResult Function(List<InventoryItem> inventory)? inventoryChanged,
    TResult Function(InventorySummary summary)? summaryChanged,
    TResult Function(List<InventoryItem> products)? lowStockChanged,
    TResult Function(List<StockMovement> movements)? movementsChanged,
    TResult Function(String message)? streamFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started();
      case InventoryRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled();
      case StockMovementsFilterChanged() when movementsFilterChanged != null:
        return movementsFilterChanged(_that.productId, _that.limit);
      case StockAdjustmentSubmitted() when stockAdjustmentSubmitted != null:
        return stockAdjustmentSubmitted(_that.productId, _that.quantity,
            _that.type, _that.reference, _that.note);
      case InventoryChanged() when inventoryChanged != null:
        return inventoryChanged(_that.inventory);
      case InventorySummaryChanged() when summaryChanged != null:
        return summaryChanged(_that.summary);
      case LowStockChanged() when lowStockChanged != null:
        return lowStockChanged(_that.products);
      case StockMovementsChanged() when movementsChanged != null:
        return movementsChanged(_that.movements);
      case InventoryStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refreshRequested,
    required TResult Function(String query) searchChanged,
    required TResult Function() lowStockToggled,
    required TResult Function(int? productId, int limit) movementsFilterChanged,
    required TResult Function(int productId, double quantity, String type,
            String? reference, String? note)
        stockAdjustmentSubmitted,
    required TResult Function(List<InventoryItem> inventory) inventoryChanged,
    required TResult Function(InventorySummary summary) summaryChanged,
    required TResult Function(List<InventoryItem> products) lowStockChanged,
    required TResult Function(List<StockMovement> movements) movementsChanged,
    required TResult Function(String message) streamFailed,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted():
        return started();
      case InventoryRefreshRequested():
        return refreshRequested();
      case InventorySearchChanged():
        return searchChanged(_that.query);
      case InventoryLowStockToggled():
        return lowStockToggled();
      case StockMovementsFilterChanged():
        return movementsFilterChanged(_that.productId, _that.limit);
      case StockAdjustmentSubmitted():
        return stockAdjustmentSubmitted(_that.productId, _that.quantity,
            _that.type, _that.reference, _that.note);
      case InventoryChanged():
        return inventoryChanged(_that.inventory);
      case InventorySummaryChanged():
        return summaryChanged(_that.summary);
      case LowStockChanged():
        return lowStockChanged(_that.products);
      case StockMovementsChanged():
        return movementsChanged(_that.movements);
      case InventoryStreamFailed():
        return streamFailed(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refreshRequested,
    TResult? Function(String query)? searchChanged,
    TResult? Function()? lowStockToggled,
    TResult? Function(int? productId, int limit)? movementsFilterChanged,
    TResult? Function(int productId, double quantity, String type,
            String? reference, String? note)?
        stockAdjustmentSubmitted,
    TResult? Function(List<InventoryItem> inventory)? inventoryChanged,
    TResult? Function(InventorySummary summary)? summaryChanged,
    TResult? Function(List<InventoryItem> products)? lowStockChanged,
    TResult? Function(List<StockMovement> movements)? movementsChanged,
    TResult? Function(String message)? streamFailed,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started();
      case InventoryRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled();
      case StockMovementsFilterChanged() when movementsFilterChanged != null:
        return movementsFilterChanged(_that.productId, _that.limit);
      case StockAdjustmentSubmitted() when stockAdjustmentSubmitted != null:
        return stockAdjustmentSubmitted(_that.productId, _that.quantity,
            _that.type, _that.reference, _that.note);
      case InventoryChanged() when inventoryChanged != null:
        return inventoryChanged(_that.inventory);
      case InventorySummaryChanged() when summaryChanged != null:
        return summaryChanged(_that.summary);
      case LowStockChanged() when lowStockChanged != null:
        return lowStockChanged(_that.products);
      case StockMovementsChanged() when movementsChanged != null:
        return movementsChanged(_that.movements);
      case InventoryStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class InventoryStarted implements InventoryEvent {
  const InventoryStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent.started()';
  }
}

/// @nodoc

class InventoryRefreshRequested implements InventoryEvent {
  const InventoryRefreshRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryRefreshRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent.refreshRequested()';
  }
}

/// @nodoc

class InventorySearchChanged implements InventoryEvent {
  const InventorySearchChanged(this.query);

  final String query;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventorySearchChangedCopyWith<InventorySearchChanged> get copyWith =>
      _$InventorySearchChangedCopyWithImpl<InventorySearchChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventorySearchChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'InventoryEvent.searchChanged(query: $query)';
  }
}

/// @nodoc
abstract mixin class $InventorySearchChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventorySearchChangedCopyWith(InventorySearchChanged value,
          $Res Function(InventorySearchChanged) _then) =
      _$InventorySearchChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$InventorySearchChangedCopyWithImpl<$Res>
    implements $InventorySearchChangedCopyWith<$Res> {
  _$InventorySearchChangedCopyWithImpl(this._self, this._then);

  final InventorySearchChanged _self;
  final $Res Function(InventorySearchChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(InventorySearchChanged(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class InventoryLowStockToggled implements InventoryEvent {
  const InventoryLowStockToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryLowStockToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent.lowStockToggled()';
  }
}

/// @nodoc

class StockMovementsFilterChanged implements InventoryEvent {
  const StockMovementsFilterChanged({this.productId, this.limit = 50});

  final int? productId;
  @JsonKey()
  final int limit;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockMovementsFilterChangedCopyWith<StockMovementsFilterChanged>
      get copyWith => _$StockMovementsFilterChangedCopyWithImpl<
          StockMovementsFilterChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockMovementsFilterChanged &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, limit);

  @override
  String toString() {
    return 'InventoryEvent.movementsFilterChanged(productId: $productId, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $StockMovementsFilterChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $StockMovementsFilterChangedCopyWith(
          StockMovementsFilterChanged value,
          $Res Function(StockMovementsFilterChanged) _then) =
      _$StockMovementsFilterChangedCopyWithImpl;
  @useResult
  $Res call({int? productId, int limit});
}

/// @nodoc
class _$StockMovementsFilterChangedCopyWithImpl<$Res>
    implements $StockMovementsFilterChangedCopyWith<$Res> {
  _$StockMovementsFilterChangedCopyWithImpl(this._self, this._then);

  final StockMovementsFilterChanged _self;
  final $Res Function(StockMovementsFilterChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = freezed,
    Object? limit = null,
  }) {
    return _then(StockMovementsFilterChanged(
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class StockAdjustmentSubmitted implements InventoryEvent {
  const StockAdjustmentSubmitted(
      {required this.productId,
      required this.quantity,
      required this.type,
      this.reference,
      this.note});

  final int productId;
  final double quantity;
  final String type;
  final String? reference;
  final String? note;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockAdjustmentSubmittedCopyWith<StockAdjustmentSubmitted> get copyWith =>
      _$StockAdjustmentSubmittedCopyWithImpl<StockAdjustmentSubmitted>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockAdjustmentSubmitted &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, quantity, type, reference, note);

  @override
  String toString() {
    return 'InventoryEvent.stockAdjustmentSubmitted(productId: $productId, quantity: $quantity, type: $type, reference: $reference, note: $note)';
  }
}

/// @nodoc
abstract mixin class $StockAdjustmentSubmittedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $StockAdjustmentSubmittedCopyWith(StockAdjustmentSubmitted value,
          $Res Function(StockAdjustmentSubmitted) _then) =
      _$StockAdjustmentSubmittedCopyWithImpl;
  @useResult
  $Res call(
      {int productId,
      double quantity,
      String type,
      String? reference,
      String? note});
}

/// @nodoc
class _$StockAdjustmentSubmittedCopyWithImpl<$Res>
    implements $StockAdjustmentSubmittedCopyWith<$Res> {
  _$StockAdjustmentSubmittedCopyWithImpl(this._self, this._then);

  final StockAdjustmentSubmitted _self;
  final $Res Function(StockAdjustmentSubmitted) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? type = null,
    Object? reference = freezed,
    Object? note = freezed,
  }) {
    return _then(StockAdjustmentSubmitted(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class InventoryChanged implements InventoryEvent {
  const InventoryChanged(final List<InventoryItem> inventory)
      : _inventory = inventory;

  final List<InventoryItem> _inventory;
  List<InventoryItem> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryChangedCopyWith<InventoryChanged> get copyWith =>
      _$InventoryChangedCopyWithImpl<InventoryChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryChanged &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_inventory));

  @override
  String toString() {
    return 'InventoryEvent.inventoryChanged(inventory: $inventory)';
  }
}

/// @nodoc
abstract mixin class $InventoryChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventoryChangedCopyWith(
          InventoryChanged value, $Res Function(InventoryChanged) _then) =
      _$InventoryChangedCopyWithImpl;
  @useResult
  $Res call({List<InventoryItem> inventory});
}

/// @nodoc
class _$InventoryChangedCopyWithImpl<$Res>
    implements $InventoryChangedCopyWith<$Res> {
  _$InventoryChangedCopyWithImpl(this._self, this._then);

  final InventoryChanged _self;
  final $Res Function(InventoryChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inventory = null,
  }) {
    return _then(InventoryChanged(
      null == inventory
          ? _self._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
    ));
  }
}

/// @nodoc

class InventorySummaryChanged implements InventoryEvent {
  const InventorySummaryChanged(this.summary);

  final InventorySummary summary;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventorySummaryChangedCopyWith<InventorySummaryChanged> get copyWith =>
      _$InventorySummaryChangedCopyWithImpl<InventorySummaryChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventorySummaryChanged &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @override
  String toString() {
    return 'InventoryEvent.summaryChanged(summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $InventorySummaryChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventorySummaryChangedCopyWith(InventorySummaryChanged value,
          $Res Function(InventorySummaryChanged) _then) =
      _$InventorySummaryChangedCopyWithImpl;
  @useResult
  $Res call({InventorySummary summary});
}

/// @nodoc
class _$InventorySummaryChangedCopyWithImpl<$Res>
    implements $InventorySummaryChangedCopyWith<$Res> {
  _$InventorySummaryChangedCopyWithImpl(this._self, this._then);

  final InventorySummaryChanged _self;
  final $Res Function(InventorySummaryChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
  }) {
    return _then(InventorySummaryChanged(
      null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as InventorySummary,
    ));
  }
}

/// @nodoc

class LowStockChanged implements InventoryEvent {
  const LowStockChanged(final List<InventoryItem> products)
      : _products = products;

  final List<InventoryItem> _products;
  List<InventoryItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LowStockChangedCopyWith<LowStockChanged> get copyWith =>
      _$LowStockChangedCopyWithImpl<LowStockChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LowStockChanged &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'InventoryEvent.lowStockChanged(products: $products)';
  }
}

/// @nodoc
abstract mixin class $LowStockChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $LowStockChangedCopyWith(
          LowStockChanged value, $Res Function(LowStockChanged) _then) =
      _$LowStockChangedCopyWithImpl;
  @useResult
  $Res call({List<InventoryItem> products});
}

/// @nodoc
class _$LowStockChangedCopyWithImpl<$Res>
    implements $LowStockChangedCopyWith<$Res> {
  _$LowStockChangedCopyWithImpl(this._self, this._then);

  final LowStockChanged _self;
  final $Res Function(LowStockChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(LowStockChanged(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
    ));
  }
}

/// @nodoc

class StockMovementsChanged implements InventoryEvent {
  const StockMovementsChanged(final List<StockMovement> movements)
      : _movements = movements;

  final List<StockMovement> _movements;
  List<StockMovement> get movements {
    if (_movements is EqualUnmodifiableListView) return _movements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockMovementsChangedCopyWith<StockMovementsChanged> get copyWith =>
      _$StockMovementsChangedCopyWithImpl<StockMovementsChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockMovementsChanged &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movements));

  @override
  String toString() {
    return 'InventoryEvent.movementsChanged(movements: $movements)';
  }
}

/// @nodoc
abstract mixin class $StockMovementsChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $StockMovementsChangedCopyWith(StockMovementsChanged value,
          $Res Function(StockMovementsChanged) _then) =
      _$StockMovementsChangedCopyWithImpl;
  @useResult
  $Res call({List<StockMovement> movements});
}

/// @nodoc
class _$StockMovementsChangedCopyWithImpl<$Res>
    implements $StockMovementsChangedCopyWith<$Res> {
  _$StockMovementsChangedCopyWithImpl(this._self, this._then);

  final StockMovementsChanged _self;
  final $Res Function(StockMovementsChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movements = null,
  }) {
    return _then(StockMovementsChanged(
      null == movements
          ? _self._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<StockMovement>,
    ));
  }
}

/// @nodoc

class InventoryStreamFailed implements InventoryEvent {
  const InventoryStreamFailed(this.message);

  final String message;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryStreamFailedCopyWith<InventoryStreamFailed> get copyWith =>
      _$InventoryStreamFailedCopyWithImpl<InventoryStreamFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryStreamFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'InventoryEvent.streamFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InventoryStreamFailedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventoryStreamFailedCopyWith(InventoryStreamFailed value,
          $Res Function(InventoryStreamFailed) _then) =
      _$InventoryStreamFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$InventoryStreamFailedCopyWithImpl<$Res>
    implements $InventoryStreamFailedCopyWith<$Res> {
  _$InventoryStreamFailedCopyWithImpl(this._self, this._then);

  final InventoryStreamFailed _self;
  final $Res Function(InventoryStreamFailed) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(InventoryStreamFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
