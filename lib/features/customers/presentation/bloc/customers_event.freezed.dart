// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customers_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomersEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CustomersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomersEvent()';
  }
}

/// @nodoc
class $CustomersEventCopyWith<$Res> {
  $CustomersEventCopyWith(CustomersEvent _, $Res Function(CustomersEvent) __);
}

/// Adds pattern-matching-related methods to [CustomersEvent].
extension CustomersEventPatterns on CustomersEvent {
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
    TResult Function(CustomersLoadRequested value)? loadRequested,
    TResult Function(CustomersSearchRequested value)? searchRequested,
    TResult Function(CustomersWatchRequested value)? watchRequested,
    TResult Function(CustomersStreamUpdated value)? streamUpdated,
    TResult Function(CustomersByIdRequested value)? customerByIdRequested,
    TResult Function(CustomersCustomerStreamUpdated value)?
        customerStreamUpdated,
    TResult Function(CustomersByCodeRequested value)? customerByCodeRequested,
    TResult Function(CustomersCheckCodeRequested value)? checkCodeRequested,
    TResult Function(CustomersCreateRequested value)? createRequested,
    TResult Function(CustomersUpdateRequested value)? updateRequested,
    TResult Function(CustomersActivateRequested value)? activateRequested,
    TResult Function(CustomersDeactivateRequested value)? deactivateRequested,
    TResult Function(CustomersDeleteRequested value)? deleteRequested,
    TResult Function(CustomersCountsRequested value)? countsRequested,
    TResult Function(CustomersClearMessagesRequested value)? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case CustomersSearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case CustomersWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case CustomersStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that);
      case CustomersByIdRequested() when customerByIdRequested != null:
        return customerByIdRequested(_that);
      case CustomersCustomerStreamUpdated() when customerStreamUpdated != null:
        return customerStreamUpdated(_that);
      case CustomersByCodeRequested() when customerByCodeRequested != null:
        return customerByCodeRequested(_that);
      case CustomersCheckCodeRequested() when checkCodeRequested != null:
        return checkCodeRequested(_that);
      case CustomersCreateRequested() when createRequested != null:
        return createRequested(_that);
      case CustomersUpdateRequested() when updateRequested != null:
        return updateRequested(_that);
      case CustomersActivateRequested() when activateRequested != null:
        return activateRequested(_that);
      case CustomersDeactivateRequested() when deactivateRequested != null:
        return deactivateRequested(_that);
      case CustomersDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case CustomersCountsRequested() when countsRequested != null:
        return countsRequested(_that);
      case CustomersClearMessagesRequested() when clearMessages != null:
        return clearMessages(_that);
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
    required TResult Function(CustomersLoadRequested value) loadRequested,
    required TResult Function(CustomersSearchRequested value) searchRequested,
    required TResult Function(CustomersWatchRequested value) watchRequested,
    required TResult Function(CustomersStreamUpdated value) streamUpdated,
    required TResult Function(CustomersByIdRequested value)
        customerByIdRequested,
    required TResult Function(CustomersCustomerStreamUpdated value)
        customerStreamUpdated,
    required TResult Function(CustomersByCodeRequested value)
        customerByCodeRequested,
    required TResult Function(CustomersCheckCodeRequested value)
        checkCodeRequested,
    required TResult Function(CustomersCreateRequested value) createRequested,
    required TResult Function(CustomersUpdateRequested value) updateRequested,
    required TResult Function(CustomersActivateRequested value)
        activateRequested,
    required TResult Function(CustomersDeactivateRequested value)
        deactivateRequested,
    required TResult Function(CustomersDeleteRequested value) deleteRequested,
    required TResult Function(CustomersCountsRequested value) countsRequested,
    required TResult Function(CustomersClearMessagesRequested value)
        clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested():
        return loadRequested(_that);
      case CustomersSearchRequested():
        return searchRequested(_that);
      case CustomersWatchRequested():
        return watchRequested(_that);
      case CustomersStreamUpdated():
        return streamUpdated(_that);
      case CustomersByIdRequested():
        return customerByIdRequested(_that);
      case CustomersCustomerStreamUpdated():
        return customerStreamUpdated(_that);
      case CustomersByCodeRequested():
        return customerByCodeRequested(_that);
      case CustomersCheckCodeRequested():
        return checkCodeRequested(_that);
      case CustomersCreateRequested():
        return createRequested(_that);
      case CustomersUpdateRequested():
        return updateRequested(_that);
      case CustomersActivateRequested():
        return activateRequested(_that);
      case CustomersDeactivateRequested():
        return deactivateRequested(_that);
      case CustomersDeleteRequested():
        return deleteRequested(_that);
      case CustomersCountsRequested():
        return countsRequested(_that);
      case CustomersClearMessagesRequested():
        return clearMessages(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomersLoadRequested value)? loadRequested,
    TResult? Function(CustomersSearchRequested value)? searchRequested,
    TResult? Function(CustomersWatchRequested value)? watchRequested,
    TResult? Function(CustomersStreamUpdated value)? streamUpdated,
    TResult? Function(CustomersByIdRequested value)? customerByIdRequested,
    TResult? Function(CustomersCustomerStreamUpdated value)?
        customerStreamUpdated,
    TResult? Function(CustomersByCodeRequested value)? customerByCodeRequested,
    TResult? Function(CustomersCheckCodeRequested value)? checkCodeRequested,
    TResult? Function(CustomersCreateRequested value)? createRequested,
    TResult? Function(CustomersUpdateRequested value)? updateRequested,
    TResult? Function(CustomersActivateRequested value)? activateRequested,
    TResult? Function(CustomersDeactivateRequested value)? deactivateRequested,
    TResult? Function(CustomersDeleteRequested value)? deleteRequested,
    TResult? Function(CustomersCountsRequested value)? countsRequested,
    TResult? Function(CustomersClearMessagesRequested value)? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case CustomersSearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case CustomersWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case CustomersStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that);
      case CustomersByIdRequested() when customerByIdRequested != null:
        return customerByIdRequested(_that);
      case CustomersCustomerStreamUpdated() when customerStreamUpdated != null:
        return customerStreamUpdated(_that);
      case CustomersByCodeRequested() when customerByCodeRequested != null:
        return customerByCodeRequested(_that);
      case CustomersCheckCodeRequested() when checkCodeRequested != null:
        return checkCodeRequested(_that);
      case CustomersCreateRequested() when createRequested != null:
        return createRequested(_that);
      case CustomersUpdateRequested() when updateRequested != null:
        return updateRequested(_that);
      case CustomersActivateRequested() when activateRequested != null:
        return activateRequested(_that);
      case CustomersDeactivateRequested() when deactivateRequested != null:
        return deactivateRequested(_that);
      case CustomersDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case CustomersCountsRequested() when countsRequested != null:
        return countsRequested(_that);
      case CustomersClearMessagesRequested() when clearMessages != null:
        return clearMessages(_that);
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
    TResult Function(bool activeOnly)? loadRequested,
    TResult Function(String query)? searchRequested,
    TResult Function(String? query, bool activeOnly)? watchRequested,
    TResult Function(List<Customer> customers)? streamUpdated,
    TResult Function(int id)? customerByIdRequested,
    TResult Function(Customer? customer)? customerStreamUpdated,
    TResult Function(String code)? customerByCodeRequested,
    TResult Function(String code, int? excludedId)? checkCodeRequested,
    TResult Function(Customer customer)? createRequested,
    TResult Function(int id, Customer customer)? updateRequested,
    TResult Function(int id)? activateRequested,
    TResult Function(int id)? deactivateRequested,
    TResult Function(int id)? deleteRequested,
    TResult Function()? countsRequested,
    TResult Function()? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested() when loadRequested != null:
        return loadRequested(_that.activeOnly);
      case CustomersSearchRequested() when searchRequested != null:
        return searchRequested(_that.query);
      case CustomersWatchRequested() when watchRequested != null:
        return watchRequested(_that.query, _that.activeOnly);
      case CustomersStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that.customers);
      case CustomersByIdRequested() when customerByIdRequested != null:
        return customerByIdRequested(_that.id);
      case CustomersCustomerStreamUpdated() when customerStreamUpdated != null:
        return customerStreamUpdated(_that.customer);
      case CustomersByCodeRequested() when customerByCodeRequested != null:
        return customerByCodeRequested(_that.code);
      case CustomersCheckCodeRequested() when checkCodeRequested != null:
        return checkCodeRequested(_that.code, _that.excludedId);
      case CustomersCreateRequested() when createRequested != null:
        return createRequested(_that.customer);
      case CustomersUpdateRequested() when updateRequested != null:
        return updateRequested(_that.id, _that.customer);
      case CustomersActivateRequested() when activateRequested != null:
        return activateRequested(_that.id);
      case CustomersDeactivateRequested() when deactivateRequested != null:
        return deactivateRequested(_that.id);
      case CustomersDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case CustomersCountsRequested() when countsRequested != null:
        return countsRequested();
      case CustomersClearMessagesRequested() when clearMessages != null:
        return clearMessages();
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
    required TResult Function(bool activeOnly) loadRequested,
    required TResult Function(String query) searchRequested,
    required TResult Function(String? query, bool activeOnly) watchRequested,
    required TResult Function(List<Customer> customers) streamUpdated,
    required TResult Function(int id) customerByIdRequested,
    required TResult Function(Customer? customer) customerStreamUpdated,
    required TResult Function(String code) customerByCodeRequested,
    required TResult Function(String code, int? excludedId) checkCodeRequested,
    required TResult Function(Customer customer) createRequested,
    required TResult Function(int id, Customer customer) updateRequested,
    required TResult Function(int id) activateRequested,
    required TResult Function(int id) deactivateRequested,
    required TResult Function(int id) deleteRequested,
    required TResult Function() countsRequested,
    required TResult Function() clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested():
        return loadRequested(_that.activeOnly);
      case CustomersSearchRequested():
        return searchRequested(_that.query);
      case CustomersWatchRequested():
        return watchRequested(_that.query, _that.activeOnly);
      case CustomersStreamUpdated():
        return streamUpdated(_that.customers);
      case CustomersByIdRequested():
        return customerByIdRequested(_that.id);
      case CustomersCustomerStreamUpdated():
        return customerStreamUpdated(_that.customer);
      case CustomersByCodeRequested():
        return customerByCodeRequested(_that.code);
      case CustomersCheckCodeRequested():
        return checkCodeRequested(_that.code, _that.excludedId);
      case CustomersCreateRequested():
        return createRequested(_that.customer);
      case CustomersUpdateRequested():
        return updateRequested(_that.id, _that.customer);
      case CustomersActivateRequested():
        return activateRequested(_that.id);
      case CustomersDeactivateRequested():
        return deactivateRequested(_that.id);
      case CustomersDeleteRequested():
        return deleteRequested(_that.id);
      case CustomersCountsRequested():
        return countsRequested();
      case CustomersClearMessagesRequested():
        return clearMessages();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool activeOnly)? loadRequested,
    TResult? Function(String query)? searchRequested,
    TResult? Function(String? query, bool activeOnly)? watchRequested,
    TResult? Function(List<Customer> customers)? streamUpdated,
    TResult? Function(int id)? customerByIdRequested,
    TResult? Function(Customer? customer)? customerStreamUpdated,
    TResult? Function(String code)? customerByCodeRequested,
    TResult? Function(String code, int? excludedId)? checkCodeRequested,
    TResult? Function(Customer customer)? createRequested,
    TResult? Function(int id, Customer customer)? updateRequested,
    TResult? Function(int id)? activateRequested,
    TResult? Function(int id)? deactivateRequested,
    TResult? Function(int id)? deleteRequested,
    TResult? Function()? countsRequested,
    TResult? Function()? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case CustomersLoadRequested() when loadRequested != null:
        return loadRequested(_that.activeOnly);
      case CustomersSearchRequested() when searchRequested != null:
        return searchRequested(_that.query);
      case CustomersWatchRequested() when watchRequested != null:
        return watchRequested(_that.query, _that.activeOnly);
      case CustomersStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that.customers);
      case CustomersByIdRequested() when customerByIdRequested != null:
        return customerByIdRequested(_that.id);
      case CustomersCustomerStreamUpdated() when customerStreamUpdated != null:
        return customerStreamUpdated(_that.customer);
      case CustomersByCodeRequested() when customerByCodeRequested != null:
        return customerByCodeRequested(_that.code);
      case CustomersCheckCodeRequested() when checkCodeRequested != null:
        return checkCodeRequested(_that.code, _that.excludedId);
      case CustomersCreateRequested() when createRequested != null:
        return createRequested(_that.customer);
      case CustomersUpdateRequested() when updateRequested != null:
        return updateRequested(_that.id, _that.customer);
      case CustomersActivateRequested() when activateRequested != null:
        return activateRequested(_that.id);
      case CustomersDeactivateRequested() when deactivateRequested != null:
        return deactivateRequested(_that.id);
      case CustomersDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case CustomersCountsRequested() when countsRequested != null:
        return countsRequested();
      case CustomersClearMessagesRequested() when clearMessages != null:
        return clearMessages();
      case _:
        return null;
    }
  }
}

/// @nodoc

class CustomersLoadRequested implements CustomersEvent {
  const CustomersLoadRequested({this.activeOnly = false});

  @JsonKey()
  final bool activeOnly;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersLoadRequestedCopyWith<CustomersLoadRequested> get copyWith =>
      _$CustomersLoadRequestedCopyWithImpl<CustomersLoadRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersLoadRequested &&
            (identical(other.activeOnly, activeOnly) ||
                other.activeOnly == activeOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeOnly);

  @override
  String toString() {
    return 'CustomersEvent.loadRequested(activeOnly: $activeOnly)';
  }
}

/// @nodoc
abstract mixin class $CustomersLoadRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersLoadRequestedCopyWith(CustomersLoadRequested value,
          $Res Function(CustomersLoadRequested) _then) =
      _$CustomersLoadRequestedCopyWithImpl;
  @useResult
  $Res call({bool activeOnly});
}

/// @nodoc
class _$CustomersLoadRequestedCopyWithImpl<$Res>
    implements $CustomersLoadRequestedCopyWith<$Res> {
  _$CustomersLoadRequestedCopyWithImpl(this._self, this._then);

  final CustomersLoadRequested _self;
  final $Res Function(CustomersLoadRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeOnly = null,
  }) {
    return _then(CustomersLoadRequested(
      activeOnly: null == activeOnly
          ? _self.activeOnly
          : activeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class CustomersSearchRequested implements CustomersEvent {
  const CustomersSearchRequested(this.query);

  final String query;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersSearchRequestedCopyWith<CustomersSearchRequested> get copyWith =>
      _$CustomersSearchRequestedCopyWithImpl<CustomersSearchRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersSearchRequested &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CustomersEvent.searchRequested(query: $query)';
  }
}

/// @nodoc
abstract mixin class $CustomersSearchRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersSearchRequestedCopyWith(CustomersSearchRequested value,
          $Res Function(CustomersSearchRequested) _then) =
      _$CustomersSearchRequestedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$CustomersSearchRequestedCopyWithImpl<$Res>
    implements $CustomersSearchRequestedCopyWith<$Res> {
  _$CustomersSearchRequestedCopyWithImpl(this._self, this._then);

  final CustomersSearchRequested _self;
  final $Res Function(CustomersSearchRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(CustomersSearchRequested(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CustomersWatchRequested implements CustomersEvent {
  const CustomersWatchRequested({this.query, this.activeOnly = false});

  final String? query;
  @JsonKey()
  final bool activeOnly;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersWatchRequestedCopyWith<CustomersWatchRequested> get copyWith =>
      _$CustomersWatchRequestedCopyWithImpl<CustomersWatchRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersWatchRequested &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.activeOnly, activeOnly) ||
                other.activeOnly == activeOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, activeOnly);

  @override
  String toString() {
    return 'CustomersEvent.watchRequested(query: $query, activeOnly: $activeOnly)';
  }
}

/// @nodoc
abstract mixin class $CustomersWatchRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersWatchRequestedCopyWith(CustomersWatchRequested value,
          $Res Function(CustomersWatchRequested) _then) =
      _$CustomersWatchRequestedCopyWithImpl;
  @useResult
  $Res call({String? query, bool activeOnly});
}

/// @nodoc
class _$CustomersWatchRequestedCopyWithImpl<$Res>
    implements $CustomersWatchRequestedCopyWith<$Res> {
  _$CustomersWatchRequestedCopyWithImpl(this._self, this._then);

  final CustomersWatchRequested _self;
  final $Res Function(CustomersWatchRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
    Object? activeOnly = null,
  }) {
    return _then(CustomersWatchRequested(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      activeOnly: null == activeOnly
          ? _self.activeOnly
          : activeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class CustomersStreamUpdated implements CustomersEvent {
  const CustomersStreamUpdated(final List<Customer> customers)
      : _customers = customers;

  final List<Customer> _customers;
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersStreamUpdatedCopyWith<CustomersStreamUpdated> get copyWith =>
      _$CustomersStreamUpdatedCopyWithImpl<CustomersStreamUpdated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersStreamUpdated &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_customers));

  @override
  String toString() {
    return 'CustomersEvent.streamUpdated(customers: $customers)';
  }
}

/// @nodoc
abstract mixin class $CustomersStreamUpdatedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersStreamUpdatedCopyWith(CustomersStreamUpdated value,
          $Res Function(CustomersStreamUpdated) _then) =
      _$CustomersStreamUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Customer> customers});
}

/// @nodoc
class _$CustomersStreamUpdatedCopyWithImpl<$Res>
    implements $CustomersStreamUpdatedCopyWith<$Res> {
  _$CustomersStreamUpdatedCopyWithImpl(this._self, this._then);

  final CustomersStreamUpdated _self;
  final $Res Function(CustomersStreamUpdated) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customers = null,
  }) {
    return _then(CustomersStreamUpdated(
      null == customers
          ? _self._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class CustomersByIdRequested implements CustomersEvent {
  const CustomersByIdRequested(this.id);

  final int id;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersByIdRequestedCopyWith<CustomersByIdRequested> get copyWith =>
      _$CustomersByIdRequestedCopyWithImpl<CustomersByIdRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersByIdRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomersEvent.customerByIdRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CustomersByIdRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersByIdRequestedCopyWith(CustomersByIdRequested value,
          $Res Function(CustomersByIdRequested) _then) =
      _$CustomersByIdRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CustomersByIdRequestedCopyWithImpl<$Res>
    implements $CustomersByIdRequestedCopyWith<$Res> {
  _$CustomersByIdRequestedCopyWithImpl(this._self, this._then);

  final CustomersByIdRequested _self;
  final $Res Function(CustomersByIdRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CustomersByIdRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CustomersCustomerStreamUpdated implements CustomersEvent {
  const CustomersCustomerStreamUpdated(this.customer);

  final Customer? customer;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersCustomerStreamUpdatedCopyWith<CustomersCustomerStreamUpdated>
      get copyWith => _$CustomersCustomerStreamUpdatedCopyWithImpl<
          CustomersCustomerStreamUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersCustomerStreamUpdated &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer);

  @override
  String toString() {
    return 'CustomersEvent.customerStreamUpdated(customer: $customer)';
  }
}

/// @nodoc
abstract mixin class $CustomersCustomerStreamUpdatedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersCustomerStreamUpdatedCopyWith(
          CustomersCustomerStreamUpdated value,
          $Res Function(CustomersCustomerStreamUpdated) _then) =
      _$CustomersCustomerStreamUpdatedCopyWithImpl;
  @useResult
  $Res call({Customer? customer});
}

/// @nodoc
class _$CustomersCustomerStreamUpdatedCopyWithImpl<$Res>
    implements $CustomersCustomerStreamUpdatedCopyWith<$Res> {
  _$CustomersCustomerStreamUpdatedCopyWithImpl(this._self, this._then);

  final CustomersCustomerStreamUpdated _self;
  final $Res Function(CustomersCustomerStreamUpdated) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = freezed,
  }) {
    return _then(CustomersCustomerStreamUpdated(
      freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc

class CustomersByCodeRequested implements CustomersEvent {
  const CustomersByCodeRequested(this.code);

  final String code;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersByCodeRequestedCopyWith<CustomersByCodeRequested> get copyWith =>
      _$CustomersByCodeRequestedCopyWithImpl<CustomersByCodeRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersByCodeRequested &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @override
  String toString() {
    return 'CustomersEvent.customerByCodeRequested(code: $code)';
  }
}

/// @nodoc
abstract mixin class $CustomersByCodeRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersByCodeRequestedCopyWith(CustomersByCodeRequested value,
          $Res Function(CustomersByCodeRequested) _then) =
      _$CustomersByCodeRequestedCopyWithImpl;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$CustomersByCodeRequestedCopyWithImpl<$Res>
    implements $CustomersByCodeRequestedCopyWith<$Res> {
  _$CustomersByCodeRequestedCopyWithImpl(this._self, this._then);

  final CustomersByCodeRequested _self;
  final $Res Function(CustomersByCodeRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
  }) {
    return _then(CustomersByCodeRequested(
      null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CustomersCheckCodeRequested implements CustomersEvent {
  const CustomersCheckCodeRequested({required this.code, this.excludedId});

  final String code;
  final int? excludedId;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersCheckCodeRequestedCopyWith<CustomersCheckCodeRequested>
      get copyWith => _$CustomersCheckCodeRequestedCopyWithImpl<
          CustomersCheckCodeRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersCheckCodeRequested &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.excludedId, excludedId) ||
                other.excludedId == excludedId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, excludedId);

  @override
  String toString() {
    return 'CustomersEvent.checkCodeRequested(code: $code, excludedId: $excludedId)';
  }
}

/// @nodoc
abstract mixin class $CustomersCheckCodeRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersCheckCodeRequestedCopyWith(
          CustomersCheckCodeRequested value,
          $Res Function(CustomersCheckCodeRequested) _then) =
      _$CustomersCheckCodeRequestedCopyWithImpl;
  @useResult
  $Res call({String code, int? excludedId});
}

/// @nodoc
class _$CustomersCheckCodeRequestedCopyWithImpl<$Res>
    implements $CustomersCheckCodeRequestedCopyWith<$Res> {
  _$CustomersCheckCodeRequestedCopyWithImpl(this._self, this._then);

  final CustomersCheckCodeRequested _self;
  final $Res Function(CustomersCheckCodeRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? excludedId = freezed,
  }) {
    return _then(CustomersCheckCodeRequested(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      excludedId: freezed == excludedId
          ? _self.excludedId
          : excludedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class CustomersCreateRequested implements CustomersEvent {
  const CustomersCreateRequested(this.customer);

  final Customer customer;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersCreateRequestedCopyWith<CustomersCreateRequested> get copyWith =>
      _$CustomersCreateRequestedCopyWithImpl<CustomersCreateRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersCreateRequested &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer);

  @override
  String toString() {
    return 'CustomersEvent.createRequested(customer: $customer)';
  }
}

/// @nodoc
abstract mixin class $CustomersCreateRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersCreateRequestedCopyWith(CustomersCreateRequested value,
          $Res Function(CustomersCreateRequested) _then) =
      _$CustomersCreateRequestedCopyWithImpl;
  @useResult
  $Res call({Customer customer});
}

/// @nodoc
class _$CustomersCreateRequestedCopyWithImpl<$Res>
    implements $CustomersCreateRequestedCopyWith<$Res> {
  _$CustomersCreateRequestedCopyWithImpl(this._self, this._then);

  final CustomersCreateRequested _self;
  final $Res Function(CustomersCreateRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = null,
  }) {
    return _then(CustomersCreateRequested(
      null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc

class CustomersUpdateRequested implements CustomersEvent {
  const CustomersUpdateRequested({required this.id, required this.customer});

  final int id;
  final Customer customer;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersUpdateRequestedCopyWith<CustomersUpdateRequested> get copyWith =>
      _$CustomersUpdateRequestedCopyWithImpl<CustomersUpdateRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersUpdateRequested &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, customer);

  @override
  String toString() {
    return 'CustomersEvent.updateRequested(id: $id, customer: $customer)';
  }
}

/// @nodoc
abstract mixin class $CustomersUpdateRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersUpdateRequestedCopyWith(CustomersUpdateRequested value,
          $Res Function(CustomersUpdateRequested) _then) =
      _$CustomersUpdateRequestedCopyWithImpl;
  @useResult
  $Res call({int id, Customer customer});
}

/// @nodoc
class _$CustomersUpdateRequestedCopyWithImpl<$Res>
    implements $CustomersUpdateRequestedCopyWith<$Res> {
  _$CustomersUpdateRequestedCopyWithImpl(this._self, this._then);

  final CustomersUpdateRequested _self;
  final $Res Function(CustomersUpdateRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? customer = null,
  }) {
    return _then(CustomersUpdateRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc

class CustomersActivateRequested implements CustomersEvent {
  const CustomersActivateRequested(this.id);

  final int id;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersActivateRequestedCopyWith<CustomersActivateRequested>
      get copyWith =>
          _$CustomersActivateRequestedCopyWithImpl<CustomersActivateRequested>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersActivateRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomersEvent.activateRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CustomersActivateRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersActivateRequestedCopyWith(CustomersActivateRequested value,
          $Res Function(CustomersActivateRequested) _then) =
      _$CustomersActivateRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CustomersActivateRequestedCopyWithImpl<$Res>
    implements $CustomersActivateRequestedCopyWith<$Res> {
  _$CustomersActivateRequestedCopyWithImpl(this._self, this._then);

  final CustomersActivateRequested _self;
  final $Res Function(CustomersActivateRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CustomersActivateRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CustomersDeactivateRequested implements CustomersEvent {
  const CustomersDeactivateRequested(this.id);

  final int id;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersDeactivateRequestedCopyWith<CustomersDeactivateRequested>
      get copyWith => _$CustomersDeactivateRequestedCopyWithImpl<
          CustomersDeactivateRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersDeactivateRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomersEvent.deactivateRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CustomersDeactivateRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersDeactivateRequestedCopyWith(
          CustomersDeactivateRequested value,
          $Res Function(CustomersDeactivateRequested) _then) =
      _$CustomersDeactivateRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CustomersDeactivateRequestedCopyWithImpl<$Res>
    implements $CustomersDeactivateRequestedCopyWith<$Res> {
  _$CustomersDeactivateRequestedCopyWithImpl(this._self, this._then);

  final CustomersDeactivateRequested _self;
  final $Res Function(CustomersDeactivateRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CustomersDeactivateRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CustomersDeleteRequested implements CustomersEvent {
  const CustomersDeleteRequested(this.id);

  final int id;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersDeleteRequestedCopyWith<CustomersDeleteRequested> get copyWith =>
      _$CustomersDeleteRequestedCopyWithImpl<CustomersDeleteRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersDeleteRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomersEvent.deleteRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CustomersDeleteRequestedCopyWith<$Res>
    implements $CustomersEventCopyWith<$Res> {
  factory $CustomersDeleteRequestedCopyWith(CustomersDeleteRequested value,
          $Res Function(CustomersDeleteRequested) _then) =
      _$CustomersDeleteRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CustomersDeleteRequestedCopyWithImpl<$Res>
    implements $CustomersDeleteRequestedCopyWith<$Res> {
  _$CustomersDeleteRequestedCopyWithImpl(this._self, this._then);

  final CustomersDeleteRequested _self;
  final $Res Function(CustomersDeleteRequested) _then;

  /// Create a copy of CustomersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CustomersDeleteRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CustomersCountsRequested implements CustomersEvent {
  const CustomersCountsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CustomersCountsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomersEvent.countsRequested()';
  }
}

/// @nodoc

class CustomersClearMessagesRequested implements CustomersEvent {
  const CustomersClearMessagesRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersClearMessagesRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomersEvent.clearMessages()';
  }
}

// dart format on
