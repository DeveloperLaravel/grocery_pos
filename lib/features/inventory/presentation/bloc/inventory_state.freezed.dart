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
  bool get loading;
  List<InventoryItem> get items;
  InventorySummary get summary;
  String get query;
  bool get lowStockOnly;
  String? get error;
  String? get message;

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
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(items),
      summary,
      query,
      lowStockOnly,
      error,
      message);

  @override
  String toString() {
    return 'InventoryState(loading: $loading, items: $items, summary: $summary, query: $query, lowStockOnly: $lowStockOnly, error: $error, message: $message)';
  }
}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) _then) =
      _$InventoryStateCopyWithImpl;
  @useResult
  $Res call(
      {bool loading,
      List<InventoryItem> items,
      InventorySummary summary,
      String query,
      bool lowStockOnly,
      String? error,
      String? message});
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
    Object? loading = null,
    Object? items = null,
    Object? summary = null,
    Object? query = null,
    Object? lowStockOnly = null,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as InventorySummary,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      lowStockOnly: null == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
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
            bool loading,
            List<InventoryItem> items,
            InventorySummary summary,
            String query,
            bool lowStockOnly,
            String? error,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
        return $default(_that.loading, _that.items, _that.summary, _that.query,
            _that.lowStockOnly, _that.error, _that.message);
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
            bool loading,
            List<InventoryItem> items,
            InventorySummary summary,
            String query,
            bool lowStockOnly,
            String? error,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState():
        return $default(_that.loading, _that.items, _that.summary, _that.query,
            _that.lowStockOnly, _that.error, _that.message);
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
            bool loading,
            List<InventoryItem> items,
            InventorySummary summary,
            String query,
            bool lowStockOnly,
            String? error,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryState() when $default != null:
        return $default(_that.loading, _that.items, _that.summary, _that.query,
            _that.lowStockOnly, _that.error, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InventoryState implements InventoryState {
  const _InventoryState(
      {this.loading = false,
      final List<InventoryItem> items = const [],
      this.summary = InventorySummary.empty,
      this.query = '',
      this.lowStockOnly = false,
      this.error,
      this.message})
      : _items = items;

  @override
  @JsonKey()
  final bool loading;
  final List<InventoryItem> _items;
  @override
  @JsonKey()
  List<InventoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final InventorySummary summary;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool lowStockOnly;
  @override
  final String? error;
  @override
  final String? message;

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
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_items),
      summary,
      query,
      lowStockOnly,
      error,
      message);

  @override
  String toString() {
    return 'InventoryState(loading: $loading, items: $items, summary: $summary, query: $query, lowStockOnly: $lowStockOnly, error: $error, message: $message)';
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
      {bool loading,
      List<InventoryItem> items,
      InventorySummary summary,
      String query,
      bool lowStockOnly,
      String? error,
      String? message});
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
    Object? loading = null,
    Object? items = null,
    Object? summary = null,
    Object? query = null,
    Object? lowStockOnly = null,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_InventoryState(
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as InventorySummary,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      lowStockOnly: null == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
