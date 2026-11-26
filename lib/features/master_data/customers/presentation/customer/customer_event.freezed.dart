// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CustomerEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomerEvent()';
  }
}

/// @nodoc
class $CustomerEventCopyWith<$Res> {
  $CustomerEventCopyWith(CustomerEvent _, $Res Function(CustomerEvent) __);
}

/// Adds pattern-matching-related methods to [CustomerEvent].
extension CustomerEventPatterns on CustomerEvent {
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
    TResult Function(LoadCustomers value)? loadCustomers,
    TResult Function(WatchCustomers value)? watchCustomers,
    TResult Function(GetCustomerById value)? getCustomerById,
    TResult Function(SearchCustomers value)? searchCustomers,
    TResult Function(InsertCustomer value)? insertCustomer,
    TResult Function(UpdateCustomer value)? updateCustomer,
    TResult Function(DeleteCustomer value)? deleteCustomer,
    TResult Function(ToggleCustomerStatus value)? toggleCustomerStatus,
    TResult Function(CustomersUpdated value)? customersUpdated,
    TResult Function(WatchError value)? watchError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers() when loadCustomers != null:
        return loadCustomers(_that);
      case WatchCustomers() when watchCustomers != null:
        return watchCustomers(_that);
      case GetCustomerById() when getCustomerById != null:
        return getCustomerById(_that);
      case SearchCustomers() when searchCustomers != null:
        return searchCustomers(_that);
      case InsertCustomer() when insertCustomer != null:
        return insertCustomer(_that);
      case UpdateCustomer() when updateCustomer != null:
        return updateCustomer(_that);
      case DeleteCustomer() when deleteCustomer != null:
        return deleteCustomer(_that);
      case ToggleCustomerStatus() when toggleCustomerStatus != null:
        return toggleCustomerStatus(_that);
      case CustomersUpdated() when customersUpdated != null:
        return customersUpdated(_that);
      case WatchError() when watchError != null:
        return watchError(_that);
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
    required TResult Function(LoadCustomers value) loadCustomers,
    required TResult Function(WatchCustomers value) watchCustomers,
    required TResult Function(GetCustomerById value) getCustomerById,
    required TResult Function(SearchCustomers value) searchCustomers,
    required TResult Function(InsertCustomer value) insertCustomer,
    required TResult Function(UpdateCustomer value) updateCustomer,
    required TResult Function(DeleteCustomer value) deleteCustomer,
    required TResult Function(ToggleCustomerStatus value) toggleCustomerStatus,
    required TResult Function(CustomersUpdated value) customersUpdated,
    required TResult Function(WatchError value) watchError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers():
        return loadCustomers(_that);
      case WatchCustomers():
        return watchCustomers(_that);
      case GetCustomerById():
        return getCustomerById(_that);
      case SearchCustomers():
        return searchCustomers(_that);
      case InsertCustomer():
        return insertCustomer(_that);
      case UpdateCustomer():
        return updateCustomer(_that);
      case DeleteCustomer():
        return deleteCustomer(_that);
      case ToggleCustomerStatus():
        return toggleCustomerStatus(_that);
      case CustomersUpdated():
        return customersUpdated(_that);
      case WatchError():
        return watchError(_that);
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
    TResult? Function(LoadCustomers value)? loadCustomers,
    TResult? Function(WatchCustomers value)? watchCustomers,
    TResult? Function(GetCustomerById value)? getCustomerById,
    TResult? Function(SearchCustomers value)? searchCustomers,
    TResult? Function(InsertCustomer value)? insertCustomer,
    TResult? Function(UpdateCustomer value)? updateCustomer,
    TResult? Function(DeleteCustomer value)? deleteCustomer,
    TResult? Function(ToggleCustomerStatus value)? toggleCustomerStatus,
    TResult? Function(CustomersUpdated value)? customersUpdated,
    TResult? Function(WatchError value)? watchError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers() when loadCustomers != null:
        return loadCustomers(_that);
      case WatchCustomers() when watchCustomers != null:
        return watchCustomers(_that);
      case GetCustomerById() when getCustomerById != null:
        return getCustomerById(_that);
      case SearchCustomers() when searchCustomers != null:
        return searchCustomers(_that);
      case InsertCustomer() when insertCustomer != null:
        return insertCustomer(_that);
      case UpdateCustomer() when updateCustomer != null:
        return updateCustomer(_that);
      case DeleteCustomer() when deleteCustomer != null:
        return deleteCustomer(_that);
      case ToggleCustomerStatus() when toggleCustomerStatus != null:
        return toggleCustomerStatus(_that);
      case CustomersUpdated() when customersUpdated != null:
        return customersUpdated(_that);
      case WatchError() when watchError != null:
        return watchError(_that);
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
    TResult Function()? loadCustomers,
    TResult Function()? watchCustomers,
    TResult Function(int id)? getCustomerById,
    TResult Function(String query)? searchCustomers,
    TResult Function(Customer customer)? insertCustomer,
    TResult Function(Customer customer)? updateCustomer,
    TResult Function(int id)? deleteCustomer,
    TResult Function(int id, bool isActive)? toggleCustomerStatus,
    TResult Function(List<Customer> customers)? customersUpdated,
    TResult Function(String message)? watchError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers() when loadCustomers != null:
        return loadCustomers();
      case WatchCustomers() when watchCustomers != null:
        return watchCustomers();
      case GetCustomerById() when getCustomerById != null:
        return getCustomerById(_that.id);
      case SearchCustomers() when searchCustomers != null:
        return searchCustomers(_that.query);
      case InsertCustomer() when insertCustomer != null:
        return insertCustomer(_that.customer);
      case UpdateCustomer() when updateCustomer != null:
        return updateCustomer(_that.customer);
      case DeleteCustomer() when deleteCustomer != null:
        return deleteCustomer(_that.id);
      case ToggleCustomerStatus() when toggleCustomerStatus != null:
        return toggleCustomerStatus(_that.id, _that.isActive);
      case CustomersUpdated() when customersUpdated != null:
        return customersUpdated(_that.customers);
      case WatchError() when watchError != null:
        return watchError(_that.message);
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
    required TResult Function() loadCustomers,
    required TResult Function() watchCustomers,
    required TResult Function(int id) getCustomerById,
    required TResult Function(String query) searchCustomers,
    required TResult Function(Customer customer) insertCustomer,
    required TResult Function(Customer customer) updateCustomer,
    required TResult Function(int id) deleteCustomer,
    required TResult Function(int id, bool isActive) toggleCustomerStatus,
    required TResult Function(List<Customer> customers) customersUpdated,
    required TResult Function(String message) watchError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers():
        return loadCustomers();
      case WatchCustomers():
        return watchCustomers();
      case GetCustomerById():
        return getCustomerById(_that.id);
      case SearchCustomers():
        return searchCustomers(_that.query);
      case InsertCustomer():
        return insertCustomer(_that.customer);
      case UpdateCustomer():
        return updateCustomer(_that.customer);
      case DeleteCustomer():
        return deleteCustomer(_that.id);
      case ToggleCustomerStatus():
        return toggleCustomerStatus(_that.id, _that.isActive);
      case CustomersUpdated():
        return customersUpdated(_that.customers);
      case WatchError():
        return watchError(_that.message);
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
    TResult? Function()? loadCustomers,
    TResult? Function()? watchCustomers,
    TResult? Function(int id)? getCustomerById,
    TResult? Function(String query)? searchCustomers,
    TResult? Function(Customer customer)? insertCustomer,
    TResult? Function(Customer customer)? updateCustomer,
    TResult? Function(int id)? deleteCustomer,
    TResult? Function(int id, bool isActive)? toggleCustomerStatus,
    TResult? Function(List<Customer> customers)? customersUpdated,
    TResult? Function(String message)? watchError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCustomers() when loadCustomers != null:
        return loadCustomers();
      case WatchCustomers() when watchCustomers != null:
        return watchCustomers();
      case GetCustomerById() when getCustomerById != null:
        return getCustomerById(_that.id);
      case SearchCustomers() when searchCustomers != null:
        return searchCustomers(_that.query);
      case InsertCustomer() when insertCustomer != null:
        return insertCustomer(_that.customer);
      case UpdateCustomer() when updateCustomer != null:
        return updateCustomer(_that.customer);
      case DeleteCustomer() when deleteCustomer != null:
        return deleteCustomer(_that.id);
      case ToggleCustomerStatus() when toggleCustomerStatus != null:
        return toggleCustomerStatus(_that.id, _that.isActive);
      case CustomersUpdated() when customersUpdated != null:
        return customersUpdated(_that.customers);
      case WatchError() when watchError != null:
        return watchError(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadCustomers implements CustomerEvent {
  const LoadCustomers();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCustomers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomerEvent.loadCustomers()';
  }
}

/// @nodoc

class WatchCustomers implements CustomerEvent {
  const WatchCustomers();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WatchCustomers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomerEvent.watchCustomers()';
  }
}

/// @nodoc

class GetCustomerById implements CustomerEvent {
  const GetCustomerById(this.id);

  final int id;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCustomerByIdCopyWith<GetCustomerById> get copyWith =>
      _$GetCustomerByIdCopyWithImpl<GetCustomerById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCustomerById &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomerEvent.getCustomerById(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetCustomerByIdCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $GetCustomerByIdCopyWith(
          GetCustomerById value, $Res Function(GetCustomerById) _then) =
      _$GetCustomerByIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$GetCustomerByIdCopyWithImpl<$Res>
    implements $GetCustomerByIdCopyWith<$Res> {
  _$GetCustomerByIdCopyWithImpl(this._self, this._then);

  final GetCustomerById _self;
  final $Res Function(GetCustomerById) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetCustomerById(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SearchCustomers implements CustomerEvent {
  const SearchCustomers(this.query);

  final String query;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchCustomersCopyWith<SearchCustomers> get copyWith =>
      _$SearchCustomersCopyWithImpl<SearchCustomers>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchCustomers &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CustomerEvent.searchCustomers(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchCustomersCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $SearchCustomersCopyWith(
          SearchCustomers value, $Res Function(SearchCustomers) _then) =
      _$SearchCustomersCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchCustomersCopyWithImpl<$Res>
    implements $SearchCustomersCopyWith<$Res> {
  _$SearchCustomersCopyWithImpl(this._self, this._then);

  final SearchCustomers _self;
  final $Res Function(SearchCustomers) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchCustomers(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class InsertCustomer implements CustomerEvent {
  const InsertCustomer(this.customer);

  final Customer customer;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsertCustomerCopyWith<InsertCustomer> get copyWith =>
      _$InsertCustomerCopyWithImpl<InsertCustomer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsertCustomer &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer);

  @override
  String toString() {
    return 'CustomerEvent.insertCustomer(customer: $customer)';
  }
}

/// @nodoc
abstract mixin class $InsertCustomerCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $InsertCustomerCopyWith(
          InsertCustomer value, $Res Function(InsertCustomer) _then) =
      _$InsertCustomerCopyWithImpl;
  @useResult
  $Res call({Customer customer});
}

/// @nodoc
class _$InsertCustomerCopyWithImpl<$Res>
    implements $InsertCustomerCopyWith<$Res> {
  _$InsertCustomerCopyWithImpl(this._self, this._then);

  final InsertCustomer _self;
  final $Res Function(InsertCustomer) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = null,
  }) {
    return _then(InsertCustomer(
      null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc

class UpdateCustomer implements CustomerEvent {
  const UpdateCustomer(this.customer);

  final Customer customer;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCustomerCopyWith<UpdateCustomer> get copyWith =>
      _$UpdateCustomerCopyWithImpl<UpdateCustomer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCustomer &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer);

  @override
  String toString() {
    return 'CustomerEvent.updateCustomer(customer: $customer)';
  }
}

/// @nodoc
abstract mixin class $UpdateCustomerCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $UpdateCustomerCopyWith(
          UpdateCustomer value, $Res Function(UpdateCustomer) _then) =
      _$UpdateCustomerCopyWithImpl;
  @useResult
  $Res call({Customer customer});
}

/// @nodoc
class _$UpdateCustomerCopyWithImpl<$Res>
    implements $UpdateCustomerCopyWith<$Res> {
  _$UpdateCustomerCopyWithImpl(this._self, this._then);

  final UpdateCustomer _self;
  final $Res Function(UpdateCustomer) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = null,
  }) {
    return _then(UpdateCustomer(
      null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc

class DeleteCustomer implements CustomerEvent {
  const DeleteCustomer(this.id);

  final int id;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCustomerCopyWith<DeleteCustomer> get copyWith =>
      _$DeleteCustomerCopyWithImpl<DeleteCustomer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCustomer &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CustomerEvent.deleteCustomer(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteCustomerCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $DeleteCustomerCopyWith(
          DeleteCustomer value, $Res Function(DeleteCustomer) _then) =
      _$DeleteCustomerCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteCustomerCopyWithImpl<$Res>
    implements $DeleteCustomerCopyWith<$Res> {
  _$DeleteCustomerCopyWithImpl(this._self, this._then);

  final DeleteCustomer _self;
  final $Res Function(DeleteCustomer) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteCustomer(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleCustomerStatus implements CustomerEvent {
  const ToggleCustomerStatus({required this.id, required this.isActive});

  final int id;
  final bool isActive;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleCustomerStatusCopyWith<ToggleCustomerStatus> get copyWith =>
      _$ToggleCustomerStatusCopyWithImpl<ToggleCustomerStatus>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleCustomerStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isActive);

  @override
  String toString() {
    return 'CustomerEvent.toggleCustomerStatus(id: $id, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $ToggleCustomerStatusCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $ToggleCustomerStatusCopyWith(ToggleCustomerStatus value,
          $Res Function(ToggleCustomerStatus) _then) =
      _$ToggleCustomerStatusCopyWithImpl;
  @useResult
  $Res call({int id, bool isActive});
}

/// @nodoc
class _$ToggleCustomerStatusCopyWithImpl<$Res>
    implements $ToggleCustomerStatusCopyWith<$Res> {
  _$ToggleCustomerStatusCopyWithImpl(this._self, this._then);

  final ToggleCustomerStatus _self;
  final $Res Function(ToggleCustomerStatus) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isActive = null,
  }) {
    return _then(ToggleCustomerStatus(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class CustomersUpdated implements CustomerEvent {
  const CustomersUpdated(final List<Customer> customers)
      : _customers = customers;

  final List<Customer> _customers;
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersUpdatedCopyWith<CustomersUpdated> get copyWith =>
      _$CustomersUpdatedCopyWithImpl<CustomersUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersUpdated &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_customers));

  @override
  String toString() {
    return 'CustomerEvent.customersUpdated(customers: $customers)';
  }
}

/// @nodoc
abstract mixin class $CustomersUpdatedCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $CustomersUpdatedCopyWith(
          CustomersUpdated value, $Res Function(CustomersUpdated) _then) =
      _$CustomersUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Customer> customers});
}

/// @nodoc
class _$CustomersUpdatedCopyWithImpl<$Res>
    implements $CustomersUpdatedCopyWith<$Res> {
  _$CustomersUpdatedCopyWithImpl(this._self, this._then);

  final CustomersUpdated _self;
  final $Res Function(CustomersUpdated) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customers = null,
  }) {
    return _then(CustomersUpdated(
      null == customers
          ? _self._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class WatchError implements CustomerEvent {
  const WatchError(this.message);

  final String message;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchErrorCopyWith<WatchError> get copyWith =>
      _$WatchErrorCopyWithImpl<WatchError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CustomerEvent.watchError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $WatchErrorCopyWith<$Res>
    implements $CustomerEventCopyWith<$Res> {
  factory $WatchErrorCopyWith(
          WatchError value, $Res Function(WatchError) _then) =
      _$WatchErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$WatchErrorCopyWithImpl<$Res> implements $WatchErrorCopyWith<$Res> {
  _$WatchErrorCopyWithImpl(this._self, this._then);

  final WatchError _self;
  final $Res Function(WatchError) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(WatchError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
