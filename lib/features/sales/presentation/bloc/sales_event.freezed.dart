// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent()';
  }
}

/// @nodoc
class $SalesEventCopyWith<$Res> {
  $SalesEventCopyWith(SalesEvent _, $Res Function(SalesEvent) __);
}

/// Adds pattern-matching-related methods to [SalesEvent].
extension SalesEventPatterns on SalesEvent {
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
    TResult Function(SalesLoadRequested value)? loadRequested,
    TResult Function(SalesWatchRequested value)? watchRequested,
    TResult Function(SalesWatchUpdated value)? watchUpdated,
    TResult Function(SalesWatchFailed value)? watchFailed,
    TResult Function(SalesSearchChanged value)? searchChanged,
    TResult Function(SalesLimitChanged value)? limitChanged,
    TResult Function(SalesDetailsRequested value)? detailsRequested,
    TResult Function(SalesDetailsCleared value)? detailsCleared,
    TResult Function(SalesCancelRequested value)? cancelRequested,
    TResult Function(SalesMessagesCleared value)? messagesCleared,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case SalesWatchUpdated() when watchUpdated != null:
        return watchUpdated(_that);
      case SalesWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case SalesSearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case SalesLimitChanged() when limitChanged != null:
        return limitChanged(_that);
      case SalesDetailsRequested() when detailsRequested != null:
        return detailsRequested(_that);
      case SalesDetailsCleared() when detailsCleared != null:
        return detailsCleared(_that);
      case SalesCancelRequested() when cancelRequested != null:
        return cancelRequested(_that);
      case SalesMessagesCleared() when messagesCleared != null:
        return messagesCleared(_that);
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
    required TResult Function(SalesLoadRequested value) loadRequested,
    required TResult Function(SalesWatchRequested value) watchRequested,
    required TResult Function(SalesWatchUpdated value) watchUpdated,
    required TResult Function(SalesWatchFailed value) watchFailed,
    required TResult Function(SalesSearchChanged value) searchChanged,
    required TResult Function(SalesLimitChanged value) limitChanged,
    required TResult Function(SalesDetailsRequested value) detailsRequested,
    required TResult Function(SalesDetailsCleared value) detailsCleared,
    required TResult Function(SalesCancelRequested value) cancelRequested,
    required TResult Function(SalesMessagesCleared value) messagesCleared,
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested():
        return loadRequested(_that);
      case SalesWatchRequested():
        return watchRequested(_that);
      case SalesWatchUpdated():
        return watchUpdated(_that);
      case SalesWatchFailed():
        return watchFailed(_that);
      case SalesSearchChanged():
        return searchChanged(_that);
      case SalesLimitChanged():
        return limitChanged(_that);
      case SalesDetailsRequested():
        return detailsRequested(_that);
      case SalesDetailsCleared():
        return detailsCleared(_that);
      case SalesCancelRequested():
        return cancelRequested(_that);
      case SalesMessagesCleared():
        return messagesCleared(_that);
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
    TResult? Function(SalesLoadRequested value)? loadRequested,
    TResult? Function(SalesWatchRequested value)? watchRequested,
    TResult? Function(SalesWatchUpdated value)? watchUpdated,
    TResult? Function(SalesWatchFailed value)? watchFailed,
    TResult? Function(SalesSearchChanged value)? searchChanged,
    TResult? Function(SalesLimitChanged value)? limitChanged,
    TResult? Function(SalesDetailsRequested value)? detailsRequested,
    TResult? Function(SalesDetailsCleared value)? detailsCleared,
    TResult? Function(SalesCancelRequested value)? cancelRequested,
    TResult? Function(SalesMessagesCleared value)? messagesCleared,
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case SalesWatchUpdated() when watchUpdated != null:
        return watchUpdated(_that);
      case SalesWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case SalesSearchChanged() when searchChanged != null:
        return searchChanged(_that);
      case SalesLimitChanged() when limitChanged != null:
        return limitChanged(_that);
      case SalesDetailsRequested() when detailsRequested != null:
        return detailsRequested(_that);
      case SalesDetailsCleared() when detailsCleared != null:
        return detailsCleared(_that);
      case SalesCancelRequested() when cancelRequested != null:
        return cancelRequested(_that);
      case SalesMessagesCleared() when messagesCleared != null:
        return messagesCleared(_that);
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
    TResult Function()? loadRequested,
    TResult Function()? watchRequested,
    TResult Function(List<Sale> sales)? watchUpdated,
    TResult Function(String message)? watchFailed,
    TResult Function(String query)? searchChanged,
    TResult Function(int limit)? limitChanged,
    TResult Function(int saleId)? detailsRequested,
    TResult Function()? detailsCleared,
    TResult Function(int saleId)? cancelRequested,
    TResult Function()? messagesCleared,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested();
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested();
      case SalesWatchUpdated() when watchUpdated != null:
        return watchUpdated(_that.sales);
      case SalesWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case SalesSearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case SalesLimitChanged() when limitChanged != null:
        return limitChanged(_that.limit);
      case SalesDetailsRequested() when detailsRequested != null:
        return detailsRequested(_that.saleId);
      case SalesDetailsCleared() when detailsCleared != null:
        return detailsCleared();
      case SalesCancelRequested() when cancelRequested != null:
        return cancelRequested(_that.saleId);
      case SalesMessagesCleared() when messagesCleared != null:
        return messagesCleared();
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
    required TResult Function() loadRequested,
    required TResult Function() watchRequested,
    required TResult Function(List<Sale> sales) watchUpdated,
    required TResult Function(String message) watchFailed,
    required TResult Function(String query) searchChanged,
    required TResult Function(int limit) limitChanged,
    required TResult Function(int saleId) detailsRequested,
    required TResult Function() detailsCleared,
    required TResult Function(int saleId) cancelRequested,
    required TResult Function() messagesCleared,
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested():
        return loadRequested();
      case SalesWatchRequested():
        return watchRequested();
      case SalesWatchUpdated():
        return watchUpdated(_that.sales);
      case SalesWatchFailed():
        return watchFailed(_that.message);
      case SalesSearchChanged():
        return searchChanged(_that.query);
      case SalesLimitChanged():
        return limitChanged(_that.limit);
      case SalesDetailsRequested():
        return detailsRequested(_that.saleId);
      case SalesDetailsCleared():
        return detailsCleared();
      case SalesCancelRequested():
        return cancelRequested(_that.saleId);
      case SalesMessagesCleared():
        return messagesCleared();
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
    TResult? Function()? loadRequested,
    TResult? Function()? watchRequested,
    TResult? Function(List<Sale> sales)? watchUpdated,
    TResult? Function(String message)? watchFailed,
    TResult? Function(String query)? searchChanged,
    TResult? Function(int limit)? limitChanged,
    TResult? Function(int saleId)? detailsRequested,
    TResult? Function()? detailsCleared,
    TResult? Function(int saleId)? cancelRequested,
    TResult? Function()? messagesCleared,
  }) {
    final _that = this;
    switch (_that) {
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested();
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested();
      case SalesWatchUpdated() when watchUpdated != null:
        return watchUpdated(_that.sales);
      case SalesWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case SalesSearchChanged() when searchChanged != null:
        return searchChanged(_that.query);
      case SalesLimitChanged() when limitChanged != null:
        return limitChanged(_that.limit);
      case SalesDetailsRequested() when detailsRequested != null:
        return detailsRequested(_that.saleId);
      case SalesDetailsCleared() when detailsCleared != null:
        return detailsCleared();
      case SalesCancelRequested() when cancelRequested != null:
        return cancelRequested(_that.saleId);
      case SalesMessagesCleared() when messagesCleared != null:
        return messagesCleared();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SalesLoadRequested implements SalesEvent {
  const SalesLoadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesLoadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.loadRequested()';
  }
}

/// @nodoc

class SalesWatchRequested implements SalesEvent {
  const SalesWatchRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesWatchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.watchRequested()';
  }
}

/// @nodoc

class SalesWatchUpdated implements SalesEvent {
  const SalesWatchUpdated(final List<Sale> sales) : _sales = sales;

  final List<Sale> _sales;
  List<Sale> get sales {
    if (_sales is EqualUnmodifiableListView) return _sales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sales);
  }

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesWatchUpdatedCopyWith<SalesWatchUpdated> get copyWith =>
      _$SalesWatchUpdatedCopyWithImpl<SalesWatchUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesWatchUpdated &&
            const DeepCollectionEquality().equals(other._sales, _sales));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sales));

  @override
  String toString() {
    return 'SalesEvent.watchUpdated(sales: $sales)';
  }
}

/// @nodoc
abstract mixin class $SalesWatchUpdatedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesWatchUpdatedCopyWith(
          SalesWatchUpdated value, $Res Function(SalesWatchUpdated) _then) =
      _$SalesWatchUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Sale> sales});
}

/// @nodoc
class _$SalesWatchUpdatedCopyWithImpl<$Res>
    implements $SalesWatchUpdatedCopyWith<$Res> {
  _$SalesWatchUpdatedCopyWithImpl(this._self, this._then);

  final SalesWatchUpdated _self;
  final $Res Function(SalesWatchUpdated) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sales = null,
  }) {
    return _then(SalesWatchUpdated(
      null == sales
          ? _self._sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<Sale>,
    ));
  }
}

/// @nodoc

class SalesWatchFailed implements SalesEvent {
  const SalesWatchFailed(this.message);

  final String message;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesWatchFailedCopyWith<SalesWatchFailed> get copyWith =>
      _$SalesWatchFailedCopyWithImpl<SalesWatchFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesWatchFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SalesEvent.watchFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SalesWatchFailedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesWatchFailedCopyWith(
          SalesWatchFailed value, $Res Function(SalesWatchFailed) _then) =
      _$SalesWatchFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SalesWatchFailedCopyWithImpl<$Res>
    implements $SalesWatchFailedCopyWith<$Res> {
  _$SalesWatchFailedCopyWithImpl(this._self, this._then);

  final SalesWatchFailed _self;
  final $Res Function(SalesWatchFailed) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SalesWatchFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SalesSearchChanged implements SalesEvent {
  const SalesSearchChanged(this.query);

  final String query;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesSearchChangedCopyWith<SalesSearchChanged> get copyWith =>
      _$SalesSearchChangedCopyWithImpl<SalesSearchChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesSearchChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SalesEvent.searchChanged(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SalesSearchChangedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesSearchChangedCopyWith(
          SalesSearchChanged value, $Res Function(SalesSearchChanged) _then) =
      _$SalesSearchChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SalesSearchChangedCopyWithImpl<$Res>
    implements $SalesSearchChangedCopyWith<$Res> {
  _$SalesSearchChangedCopyWithImpl(this._self, this._then);

  final SalesSearchChanged _self;
  final $Res Function(SalesSearchChanged) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SalesSearchChanged(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SalesLimitChanged implements SalesEvent {
  const SalesLimitChanged(this.limit);

  final int limit;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesLimitChangedCopyWith<SalesLimitChanged> get copyWith =>
      _$SalesLimitChangedCopyWithImpl<SalesLimitChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesLimitChanged &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString() {
    return 'SalesEvent.limitChanged(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $SalesLimitChangedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesLimitChangedCopyWith(
          SalesLimitChanged value, $Res Function(SalesLimitChanged) _then) =
      _$SalesLimitChangedCopyWithImpl;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$SalesLimitChangedCopyWithImpl<$Res>
    implements $SalesLimitChangedCopyWith<$Res> {
  _$SalesLimitChangedCopyWithImpl(this._self, this._then);

  final SalesLimitChanged _self;
  final $Res Function(SalesLimitChanged) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? limit = null,
  }) {
    return _then(SalesLimitChanged(
      null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SalesDetailsRequested implements SalesEvent {
  const SalesDetailsRequested(this.saleId);

  final int saleId;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesDetailsRequestedCopyWith<SalesDetailsRequested> get copyWith =>
      _$SalesDetailsRequestedCopyWithImpl<SalesDetailsRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesDetailsRequested &&
            (identical(other.saleId, saleId) || other.saleId == saleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saleId);

  @override
  String toString() {
    return 'SalesEvent.detailsRequested(saleId: $saleId)';
  }
}

/// @nodoc
abstract mixin class $SalesDetailsRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesDetailsRequestedCopyWith(SalesDetailsRequested value,
          $Res Function(SalesDetailsRequested) _then) =
      _$SalesDetailsRequestedCopyWithImpl;
  @useResult
  $Res call({int saleId});
}

/// @nodoc
class _$SalesDetailsRequestedCopyWithImpl<$Res>
    implements $SalesDetailsRequestedCopyWith<$Res> {
  _$SalesDetailsRequestedCopyWithImpl(this._self, this._then);

  final SalesDetailsRequested _self;
  final $Res Function(SalesDetailsRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? saleId = null,
  }) {
    return _then(SalesDetailsRequested(
      null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SalesDetailsCleared implements SalesEvent {
  const SalesDetailsCleared();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesDetailsCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.detailsCleared()';
  }
}

/// @nodoc

class SalesCancelRequested implements SalesEvent {
  const SalesCancelRequested(this.saleId);

  final int saleId;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesCancelRequestedCopyWith<SalesCancelRequested> get copyWith =>
      _$SalesCancelRequestedCopyWithImpl<SalesCancelRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesCancelRequested &&
            (identical(other.saleId, saleId) || other.saleId == saleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saleId);

  @override
  String toString() {
    return 'SalesEvent.cancelRequested(saleId: $saleId)';
  }
}

/// @nodoc
abstract mixin class $SalesCancelRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesCancelRequestedCopyWith(SalesCancelRequested value,
          $Res Function(SalesCancelRequested) _then) =
      _$SalesCancelRequestedCopyWithImpl;
  @useResult
  $Res call({int saleId});
}

/// @nodoc
class _$SalesCancelRequestedCopyWithImpl<$Res>
    implements $SalesCancelRequestedCopyWith<$Res> {
  _$SalesCancelRequestedCopyWithImpl(this._self, this._then);

  final SalesCancelRequested _self;
  final $Res Function(SalesCancelRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? saleId = null,
  }) {
    return _then(SalesCancelRequested(
      null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SalesMessagesCleared implements SalesEvent {
  const SalesMessagesCleared();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesMessagesCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.messagesCleared()';
  }
}

// dart format on
