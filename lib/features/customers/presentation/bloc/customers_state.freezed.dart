// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomersState {
// =================================================
// General
// =================================================
  CustomersStatus
      get status; // =================================================
// Customers
// =================================================
  List<Customer> get customers;
  Customer?
      get selectedCustomer; // =================================================
// Search
// =================================================
  String get searchQuery; // =================================================
// Customer Code
// =================================================
  bool get isCheckingCode;
  bool?
      get customerCodeExists; // =================================================
// Statistics
// =================================================
  int get totalCustomers;
  int get activeCustomers; // =================================================
// Messages
// =================================================
  String? get errorMessage;
  String?
      get successMessage; // =================================================
// Stream
// =================================================
  bool get isWatching;

  /// Create a copy of CustomersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersStateCopyWith<CustomersState> get copyWith =>
      _$CustomersStateCopyWithImpl<CustomersState>(
          this as CustomersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.customers, customers) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isCheckingCode, isCheckingCode) ||
                other.isCheckingCode == isCheckingCode) &&
            (identical(other.customerCodeExists, customerCodeExists) ||
                other.customerCodeExists == customerCodeExists) &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(other.activeCustomers, activeCustomers) ||
                other.activeCustomers == activeCustomers) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(customers),
      selectedCustomer,
      searchQuery,
      isCheckingCode,
      customerCodeExists,
      totalCustomers,
      activeCustomers,
      errorMessage,
      successMessage,
      isWatching);

  @override
  String toString() {
    return 'CustomersState(status: $status, customers: $customers, selectedCustomer: $selectedCustomer, searchQuery: $searchQuery, isCheckingCode: $isCheckingCode, customerCodeExists: $customerCodeExists, totalCustomers: $totalCustomers, activeCustomers: $activeCustomers, errorMessage: $errorMessage, successMessage: $successMessage, isWatching: $isWatching)';
  }
}

/// @nodoc
abstract mixin class $CustomersStateCopyWith<$Res> {
  factory $CustomersStateCopyWith(
          CustomersState value, $Res Function(CustomersState) _then) =
      _$CustomersStateCopyWithImpl;
  @useResult
  $Res call(
      {CustomersStatus status,
      List<Customer> customers,
      Customer? selectedCustomer,
      String searchQuery,
      bool isCheckingCode,
      bool? customerCodeExists,
      int totalCustomers,
      int activeCustomers,
      String? errorMessage,
      String? successMessage,
      bool isWatching});
}

/// @nodoc
class _$CustomersStateCopyWithImpl<$Res>
    implements $CustomersStateCopyWith<$Res> {
  _$CustomersStateCopyWithImpl(this._self, this._then);

  final CustomersState _self;
  final $Res Function(CustomersState) _then;

  /// Create a copy of CustomersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? customers = null,
    Object? selectedCustomer = freezed,
    Object? searchQuery = null,
    Object? isCheckingCode = null,
    Object? customerCodeExists = freezed,
    Object? totalCustomers = null,
    Object? activeCustomers = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isWatching = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomersStatus,
      customers: null == customers
          ? _self.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      selectedCustomer: freezed == selectedCustomer
          ? _self.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckingCode: null == isCheckingCode
          ? _self.isCheckingCode
          : isCheckingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCodeExists: freezed == customerCodeExists
          ? _self.customerCodeExists
          : customerCodeExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCustomers: null == totalCustomers
          ? _self.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      activeCustomers: null == activeCustomers
          ? _self.activeCustomers
          : activeCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomersState].
extension CustomersStatePatterns on CustomersState {
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
    TResult Function(_CustomersState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomersState() when $default != null:
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
    TResult Function(_CustomersState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomersState():
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
    TResult? Function(_CustomersState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomersState() when $default != null:
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
            CustomersStatus status,
            List<Customer> customers,
            Customer? selectedCustomer,
            String searchQuery,
            bool isCheckingCode,
            bool? customerCodeExists,
            int totalCustomers,
            int activeCustomers,
            String? errorMessage,
            String? successMessage,
            bool isWatching)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomersState() when $default != null:
        return $default(
            _that.status,
            _that.customers,
            _that.selectedCustomer,
            _that.searchQuery,
            _that.isCheckingCode,
            _that.customerCodeExists,
            _that.totalCustomers,
            _that.activeCustomers,
            _that.errorMessage,
            _that.successMessage,
            _that.isWatching);
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
            CustomersStatus status,
            List<Customer> customers,
            Customer? selectedCustomer,
            String searchQuery,
            bool isCheckingCode,
            bool? customerCodeExists,
            int totalCustomers,
            int activeCustomers,
            String? errorMessage,
            String? successMessage,
            bool isWatching)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomersState():
        return $default(
            _that.status,
            _that.customers,
            _that.selectedCustomer,
            _that.searchQuery,
            _that.isCheckingCode,
            _that.customerCodeExists,
            _that.totalCustomers,
            _that.activeCustomers,
            _that.errorMessage,
            _that.successMessage,
            _that.isWatching);
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
            CustomersStatus status,
            List<Customer> customers,
            Customer? selectedCustomer,
            String searchQuery,
            bool isCheckingCode,
            bool? customerCodeExists,
            int totalCustomers,
            int activeCustomers,
            String? errorMessage,
            String? successMessage,
            bool isWatching)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomersState() when $default != null:
        return $default(
            _that.status,
            _that.customers,
            _that.selectedCustomer,
            _that.searchQuery,
            _that.isCheckingCode,
            _that.customerCodeExists,
            _that.totalCustomers,
            _that.activeCustomers,
            _that.errorMessage,
            _that.successMessage,
            _that.isWatching);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CustomersState extends CustomersState {
  const _CustomersState(
      {this.status = CustomersStatus.initial,
      final List<Customer> customers = const [],
      this.selectedCustomer,
      this.searchQuery = '',
      this.isCheckingCode = false,
      this.customerCodeExists,
      this.totalCustomers = 0,
      this.activeCustomers = 0,
      this.errorMessage,
      this.successMessage,
      this.isWatching = false})
      : _customers = customers,
        super._();

// =================================================
// General
// =================================================
  @override
  @JsonKey()
  final CustomersStatus status;
// =================================================
// Customers
// =================================================
  final List<Customer> _customers;
// =================================================
// Customers
// =================================================
  @override
  @JsonKey()
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  final Customer? selectedCustomer;
// =================================================
// Search
// =================================================
  @override
  @JsonKey()
  final String searchQuery;
// =================================================
// Customer Code
// =================================================
  @override
  @JsonKey()
  final bool isCheckingCode;
  @override
  final bool? customerCodeExists;
// =================================================
// Statistics
// =================================================
  @override
  @JsonKey()
  final int totalCustomers;
  @override
  @JsonKey()
  final int activeCustomers;
// =================================================
// Messages
// =================================================
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
// =================================================
// Stream
// =================================================
  @override
  @JsonKey()
  final bool isWatching;

  /// Create a copy of CustomersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomersStateCopyWith<_CustomersState> get copyWith =>
      __$CustomersStateCopyWithImpl<_CustomersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomersState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isCheckingCode, isCheckingCode) ||
                other.isCheckingCode == isCheckingCode) &&
            (identical(other.customerCodeExists, customerCodeExists) ||
                other.customerCodeExists == customerCodeExists) &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(other.activeCustomers, activeCustomers) ||
                other.activeCustomers == activeCustomers) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_customers),
      selectedCustomer,
      searchQuery,
      isCheckingCode,
      customerCodeExists,
      totalCustomers,
      activeCustomers,
      errorMessage,
      successMessage,
      isWatching);

  @override
  String toString() {
    return 'CustomersState(status: $status, customers: $customers, selectedCustomer: $selectedCustomer, searchQuery: $searchQuery, isCheckingCode: $isCheckingCode, customerCodeExists: $customerCodeExists, totalCustomers: $totalCustomers, activeCustomers: $activeCustomers, errorMessage: $errorMessage, successMessage: $successMessage, isWatching: $isWatching)';
  }
}

/// @nodoc
abstract mixin class _$CustomersStateCopyWith<$Res>
    implements $CustomersStateCopyWith<$Res> {
  factory _$CustomersStateCopyWith(
          _CustomersState value, $Res Function(_CustomersState) _then) =
      __$CustomersStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CustomersStatus status,
      List<Customer> customers,
      Customer? selectedCustomer,
      String searchQuery,
      bool isCheckingCode,
      bool? customerCodeExists,
      int totalCustomers,
      int activeCustomers,
      String? errorMessage,
      String? successMessage,
      bool isWatching});
}

/// @nodoc
class __$CustomersStateCopyWithImpl<$Res>
    implements _$CustomersStateCopyWith<$Res> {
  __$CustomersStateCopyWithImpl(this._self, this._then);

  final _CustomersState _self;
  final $Res Function(_CustomersState) _then;

  /// Create a copy of CustomersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? customers = null,
    Object? selectedCustomer = freezed,
    Object? searchQuery = null,
    Object? isCheckingCode = null,
    Object? customerCodeExists = freezed,
    Object? totalCustomers = null,
    Object? activeCustomers = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isWatching = null,
  }) {
    return _then(_CustomersState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomersStatus,
      customers: null == customers
          ? _self._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      selectedCustomer: freezed == selectedCustomer
          ? _self.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckingCode: null == isCheckingCode
          ? _self.isCheckingCode
          : isCheckingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCodeExists: freezed == customerCodeExists
          ? _self.customerCodeExists
          : customerCodeExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCustomers: null == totalCustomers
          ? _self.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      activeCustomers: null == activeCustomers
          ? _self.activeCustomers
          : activeCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
