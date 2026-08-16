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
    TResult Function(InventoryRefreshed value)? refreshed,
    TResult Function(InventorySearchChanged value)? searchChanged,
    TResult Function(InventoryLowStockToggled value)? lowStockToggled,
    TResult Function(InventoryAdjusted value)? adjusted,
    TResult Function(InventoryStockSet value)? stockSet,
    TResult Function(InventoryMinStockChanged value)? minStockChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started(_that);
      case InventoryRefreshed() when refreshed != null:
        return refreshed(_that);
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled(_that);
      case InventoryAdjusted() when adjusted != null:
        return adjusted(_that);
      case InventoryStockSet() when stockSet != null:
        return stockSet(_that);
      case InventoryMinStockChanged() when minStockChanged != null:
        return minStockChanged(_that);
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
    required TResult Function(InventoryRefreshed value) refreshed,
    required TResult Function(InventorySearchChanged value) searchChanged,
    required TResult Function(InventoryLowStockToggled value) lowStockToggled,
    required TResult Function(InventoryAdjusted value) adjusted,
    required TResult Function(InventoryStockSet value) stockSet,
    required TResult Function(InventoryMinStockChanged value) minStockChanged,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted():
        return started(_that);
      case InventoryRefreshed():
        return refreshed(_that);
      case InventorySearchChanged():
        return searchChanged(_that);
      case InventoryLowStockToggled():
        return lowStockToggled(_that);
      case InventoryAdjusted():
        return adjusted(_that);
      case InventoryStockSet():
        return stockSet(_that);
      case InventoryMinStockChanged():
        return minStockChanged(_that);
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
    TResult? Function(InventoryRefreshed value)? refreshed,
    TResult? Function(InventorySearchChanged value)? searchChanged,
    TResult? Function(InventoryLowStockToggled value)? lowStockToggled,
    TResult? Function(InventoryAdjusted value)? adjusted,
    TResult? Function(InventoryStockSet value)? stockSet,
    TResult? Function(InventoryMinStockChanged value)? minStockChanged,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started(_that);
      case InventoryRefreshed() when refreshed != null:
        return refreshed(_that);
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled(_that);
      case InventoryAdjusted() when adjusted != null:
        return adjusted(_that);
      case InventoryStockSet() when stockSet != null:
        return stockSet(_that);
      case InventoryMinStockChanged() when minStockChanged != null:
        return minStockChanged(_that);
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
    TResult Function()? refreshed,
    TResult Function(String query)? searchChanged,
    TResult Function()? lowStockToggled,
    TResult Function(int productId, double delta, String note)? adjusted,
    TResult Function(int productId, double quantity, String note)? stockSet,
    TResult Function(int productId, double minStock)? minStockChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started();
      case InventoryRefreshed() when refreshed != null:
        return refreshed();
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled();
      case InventoryAdjusted() when adjusted != null:
        return adjusted(_that.productId, _that.delta, _that.note);
      case InventoryStockSet() when stockSet != null:
        return stockSet(_that.productId, _that.quantity, _that.note);
      case InventoryMinStockChanged() when minStockChanged != null:
        return minStockChanged(_that.productId, _that.minStock);
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
    required TResult Function() refreshed,
    required TResult Function(String query) searchChanged,
    required TResult Function() lowStockToggled,
    required TResult Function(int productId, double delta, String note)
        adjusted,
    required TResult Function(int productId, double quantity, String note)
        stockSet,
    required TResult Function(int productId, double minStock) minStockChanged,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted():
        return started();
      case InventoryRefreshed():
        return refreshed();
      case InventorySearchChanged():
        return searchChanged(_that.query);
      case InventoryLowStockToggled():
        return lowStockToggled();
      case InventoryAdjusted():
        return adjusted(_that.productId, _that.delta, _that.note);
      case InventoryStockSet():
        return stockSet(_that.productId, _that.quantity, _that.note);
      case InventoryMinStockChanged():
        return minStockChanged(_that.productId, _that.minStock);
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
    TResult? Function()? refreshed,
    TResult? Function(String query)? searchChanged,
    TResult? Function()? lowStockToggled,
    TResult? Function(int productId, double delta, String note)? adjusted,
    TResult? Function(int productId, double quantity, String note)? stockSet,
    TResult? Function(int productId, double minStock)? minStockChanged,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStarted() when started != null:
        return started();
      case InventoryRefreshed() when refreshed != null:
        return refreshed();
      case InventorySearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case InventoryLowStockToggled() when lowStockToggled != null:
        return lowStockToggled();
      case InventoryAdjusted() when adjusted != null:
        return adjusted(_that.productId, _that.delta, _that.note);
      case InventoryStockSet() when stockSet != null:
        return stockSet(_that.productId, _that.quantity, _that.note);
      case InventoryMinStockChanged() when minStockChanged != null:
        return minStockChanged(_that.productId, _that.minStock);
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

class InventoryRefreshed implements InventoryEvent {
  const InventoryRefreshed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryRefreshed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent.refreshed()';
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

class InventoryAdjusted implements InventoryEvent {
  const InventoryAdjusted(
      {required this.productId, required this.delta, required this.note});

  final int productId;
  final double delta;
  final String note;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryAdjustedCopyWith<InventoryAdjusted> get copyWith =>
      _$InventoryAdjustedCopyWithImpl<InventoryAdjusted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryAdjusted &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, delta, note);

  @override
  String toString() {
    return 'InventoryEvent.adjusted(productId: $productId, delta: $delta, note: $note)';
  }
}

/// @nodoc
abstract mixin class $InventoryAdjustedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventoryAdjustedCopyWith(
          InventoryAdjusted value, $Res Function(InventoryAdjusted) _then) =
      _$InventoryAdjustedCopyWithImpl;
  @useResult
  $Res call({int productId, double delta, String note});
}

/// @nodoc
class _$InventoryAdjustedCopyWithImpl<$Res>
    implements $InventoryAdjustedCopyWith<$Res> {
  _$InventoryAdjustedCopyWithImpl(this._self, this._then);

  final InventoryAdjusted _self;
  final $Res Function(InventoryAdjusted) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? delta = null,
    Object? note = null,
  }) {
    return _then(InventoryAdjusted(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as double,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class InventoryStockSet implements InventoryEvent {
  const InventoryStockSet(
      {required this.productId, required this.quantity, required this.note});

  final int productId;
  final double quantity;
  final String note;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryStockSetCopyWith<InventoryStockSet> get copyWith =>
      _$InventoryStockSetCopyWithImpl<InventoryStockSet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryStockSet &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity, note);

  @override
  String toString() {
    return 'InventoryEvent.stockSet(productId: $productId, quantity: $quantity, note: $note)';
  }
}

/// @nodoc
abstract mixin class $InventoryStockSetCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventoryStockSetCopyWith(
          InventoryStockSet value, $Res Function(InventoryStockSet) _then) =
      _$InventoryStockSetCopyWithImpl;
  @useResult
  $Res call({int productId, double quantity, String note});
}

/// @nodoc
class _$InventoryStockSetCopyWithImpl<$Res>
    implements $InventoryStockSetCopyWith<$Res> {
  _$InventoryStockSetCopyWithImpl(this._self, this._then);

  final InventoryStockSet _self;
  final $Res Function(InventoryStockSet) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? note = null,
  }) {
    return _then(InventoryStockSet(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class InventoryMinStockChanged implements InventoryEvent {
  const InventoryMinStockChanged(
      {required this.productId, required this.minStock});

  final int productId;
  final double minStock;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryMinStockChangedCopyWith<InventoryMinStockChanged> get copyWith =>
      _$InventoryMinStockChangedCopyWithImpl<InventoryMinStockChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryMinStockChanged &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, minStock);

  @override
  String toString() {
    return 'InventoryEvent.minStockChanged(productId: $productId, minStock: $minStock)';
  }
}

/// @nodoc
abstract mixin class $InventoryMinStockChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory $InventoryMinStockChangedCopyWith(InventoryMinStockChanged value,
          $Res Function(InventoryMinStockChanged) _then) =
      _$InventoryMinStockChangedCopyWithImpl;
  @useResult
  $Res call({int productId, double minStock});
}

/// @nodoc
class _$InventoryMinStockChangedCopyWithImpl<$Res>
    implements $InventoryMinStockChangedCopyWith<$Res> {
  _$InventoryMinStockChangedCopyWithImpl(this._self, this._then);

  final InventoryMinStockChanged _self;
  final $Res Function(InventoryMinStockChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? minStock = null,
  }) {
    return _then(InventoryMinStockChanged(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      minStock: null == minStock
          ? _self.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
