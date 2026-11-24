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
    TResult Function(SalesWatchRequested value)? watchRequested,
    TResult Function(SalesLoadRequested value)? loadRequested,
    TResult Function(SalesSearchRequested value)? searchRequested,
    TResult Function(SalesDateFilterRequested value)? dateFilterRequested,
    TResult Function(SalesUnpaidRequested value)? unpaidRequested,
    TResult Function(SalesPaymentStatusRequested value)? paymentStatusRequested,
    TResult Function(SalesStatisticsRequested value)? statisticsRequested,
    TResult Function(SalesCheckoutRequested value)? checkoutRequested,
    TResult Function(SalesRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case SalesSearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case SalesDateFilterRequested() when dateFilterRequested != null:
        return dateFilterRequested(_that);
      case SalesUnpaidRequested() when unpaidRequested != null:
        return unpaidRequested(_that);
      case SalesPaymentStatusRequested() when paymentStatusRequested != null:
        return paymentStatusRequested(_that);
      case SalesStatisticsRequested() when statisticsRequested != null:
        return statisticsRequested(_that);
      case SalesCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that);
      case SalesRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
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
    required TResult Function(SalesWatchRequested value) watchRequested,
    required TResult Function(SalesLoadRequested value) loadRequested,
    required TResult Function(SalesSearchRequested value) searchRequested,
    required TResult Function(SalesDateFilterRequested value)
        dateFilterRequested,
    required TResult Function(SalesUnpaidRequested value) unpaidRequested,
    required TResult Function(SalesPaymentStatusRequested value)
        paymentStatusRequested,
    required TResult Function(SalesStatisticsRequested value)
        statisticsRequested,
    required TResult Function(SalesCheckoutRequested value) checkoutRequested,
    required TResult Function(SalesRefreshRequested value) refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested():
        return watchRequested(_that);
      case SalesLoadRequested():
        return loadRequested(_that);
      case SalesSearchRequested():
        return searchRequested(_that);
      case SalesDateFilterRequested():
        return dateFilterRequested(_that);
      case SalesUnpaidRequested():
        return unpaidRequested(_that);
      case SalesPaymentStatusRequested():
        return paymentStatusRequested(_that);
      case SalesStatisticsRequested():
        return statisticsRequested(_that);
      case SalesCheckoutRequested():
        return checkoutRequested(_that);
      case SalesRefreshRequested():
        return refreshRequested(_that);
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
    TResult? Function(SalesWatchRequested value)? watchRequested,
    TResult? Function(SalesLoadRequested value)? loadRequested,
    TResult? Function(SalesSearchRequested value)? searchRequested,
    TResult? Function(SalesDateFilterRequested value)? dateFilterRequested,
    TResult? Function(SalesUnpaidRequested value)? unpaidRequested,
    TResult? Function(SalesPaymentStatusRequested value)?
        paymentStatusRequested,
    TResult? Function(SalesStatisticsRequested value)? statisticsRequested,
    TResult? Function(SalesCheckoutRequested value)? checkoutRequested,
    TResult? Function(SalesRefreshRequested value)? refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case SalesSearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case SalesDateFilterRequested() when dateFilterRequested != null:
        return dateFilterRequested(_that);
      case SalesUnpaidRequested() when unpaidRequested != null:
        return unpaidRequested(_that);
      case SalesPaymentStatusRequested() when paymentStatusRequested != null:
        return paymentStatusRequested(_that);
      case SalesStatisticsRequested() when statisticsRequested != null:
        return statisticsRequested(_that);
      case SalesCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that);
      case SalesRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
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
    TResult Function()? watchRequested,
    TResult Function()? loadRequested,
    TResult Function(String query)? searchRequested,
    TResult Function(DateTime startDate, DateTime endDate)? dateFilterRequested,
    TResult Function()? unpaidRequested,
    TResult Function(String status)? paymentStatusRequested,
    TResult Function()? statisticsRequested,
    TResult Function(
            Sale sale, List<SaleItem> items, List<SalePayment> payments)?
        checkoutRequested,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested();
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested();
      case SalesSearchRequested() when searchRequested != null:
        return searchRequested(_that.query);
      case SalesDateFilterRequested() when dateFilterRequested != null:
        return dateFilterRequested(_that.startDate, _that.endDate);
      case SalesUnpaidRequested() when unpaidRequested != null:
        return unpaidRequested();
      case SalesPaymentStatusRequested() when paymentStatusRequested != null:
        return paymentStatusRequested(_that.status);
      case SalesStatisticsRequested() when statisticsRequested != null:
        return statisticsRequested();
      case SalesCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that.sale, _that.items, _that.payments);
      case SalesRefreshRequested() when refreshRequested != null:
        return refreshRequested();
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
    required TResult Function() watchRequested,
    required TResult Function() loadRequested,
    required TResult Function(String query) searchRequested,
    required TResult Function(DateTime startDate, DateTime endDate)
        dateFilterRequested,
    required TResult Function() unpaidRequested,
    required TResult Function(String status) paymentStatusRequested,
    required TResult Function() statisticsRequested,
    required TResult Function(
            Sale sale, List<SaleItem> items, List<SalePayment> payments)
        checkoutRequested,
    required TResult Function() refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested():
        return watchRequested();
      case SalesLoadRequested():
        return loadRequested();
      case SalesSearchRequested():
        return searchRequested(_that.query);
      case SalesDateFilterRequested():
        return dateFilterRequested(_that.startDate, _that.endDate);
      case SalesUnpaidRequested():
        return unpaidRequested();
      case SalesPaymentStatusRequested():
        return paymentStatusRequested(_that.status);
      case SalesStatisticsRequested():
        return statisticsRequested();
      case SalesCheckoutRequested():
        return checkoutRequested(_that.sale, _that.items, _that.payments);
      case SalesRefreshRequested():
        return refreshRequested();
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
    TResult? Function()? watchRequested,
    TResult? Function()? loadRequested,
    TResult? Function(String query)? searchRequested,
    TResult? Function(DateTime startDate, DateTime endDate)?
        dateFilterRequested,
    TResult? Function()? unpaidRequested,
    TResult? Function(String status)? paymentStatusRequested,
    TResult? Function()? statisticsRequested,
    TResult? Function(
            Sale sale, List<SaleItem> items, List<SalePayment> payments)?
        checkoutRequested,
    TResult? Function()? refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case SalesWatchRequested() when watchRequested != null:
        return watchRequested();
      case SalesLoadRequested() when loadRequested != null:
        return loadRequested();
      case SalesSearchRequested() when searchRequested != null:
        return searchRequested(_that.query);
      case SalesDateFilterRequested() when dateFilterRequested != null:
        return dateFilterRequested(_that.startDate, _that.endDate);
      case SalesUnpaidRequested() when unpaidRequested != null:
        return unpaidRequested();
      case SalesPaymentStatusRequested() when paymentStatusRequested != null:
        return paymentStatusRequested(_that.status);
      case SalesStatisticsRequested() when statisticsRequested != null:
        return statisticsRequested();
      case SalesCheckoutRequested() when checkoutRequested != null:
        return checkoutRequested(_that.sale, _that.items, _that.payments);
      case SalesRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case _:
        return null;
    }
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

class SalesSearchRequested implements SalesEvent {
  const SalesSearchRequested({required this.query});

  final String query;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesSearchRequestedCopyWith<SalesSearchRequested> get copyWith =>
      _$SalesSearchRequestedCopyWithImpl<SalesSearchRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesSearchRequested &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SalesEvent.searchRequested(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SalesSearchRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesSearchRequestedCopyWith(SalesSearchRequested value,
          $Res Function(SalesSearchRequested) _then) =
      _$SalesSearchRequestedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SalesSearchRequestedCopyWithImpl<$Res>
    implements $SalesSearchRequestedCopyWith<$Res> {
  _$SalesSearchRequestedCopyWithImpl(this._self, this._then);

  final SalesSearchRequested _self;
  final $Res Function(SalesSearchRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SalesSearchRequested(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SalesDateFilterRequested implements SalesEvent {
  const SalesDateFilterRequested(
      {required this.startDate, required this.endDate});

  final DateTime startDate;
  final DateTime endDate;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesDateFilterRequestedCopyWith<SalesDateFilterRequested> get copyWith =>
      _$SalesDateFilterRequestedCopyWithImpl<SalesDateFilterRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesDateFilterRequested &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'SalesEvent.dateFilterRequested(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $SalesDateFilterRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesDateFilterRequestedCopyWith(SalesDateFilterRequested value,
          $Res Function(SalesDateFilterRequested) _then) =
      _$SalesDateFilterRequestedCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$SalesDateFilterRequestedCopyWithImpl<$Res>
    implements $SalesDateFilterRequestedCopyWith<$Res> {
  _$SalesDateFilterRequestedCopyWithImpl(this._self, this._then);

  final SalesDateFilterRequested _self;
  final $Res Function(SalesDateFilterRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(SalesDateFilterRequested(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class SalesUnpaidRequested implements SalesEvent {
  const SalesUnpaidRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesUnpaidRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.unpaidRequested()';
  }
}

/// @nodoc

class SalesPaymentStatusRequested implements SalesEvent {
  const SalesPaymentStatusRequested({required this.status});

  final String status;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesPaymentStatusRequestedCopyWith<SalesPaymentStatusRequested>
      get copyWith => _$SalesPaymentStatusRequestedCopyWithImpl<
          SalesPaymentStatusRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesPaymentStatusRequested &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'SalesEvent.paymentStatusRequested(status: $status)';
  }
}

/// @nodoc
abstract mixin class $SalesPaymentStatusRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesPaymentStatusRequestedCopyWith(
          SalesPaymentStatusRequested value,
          $Res Function(SalesPaymentStatusRequested) _then) =
      _$SalesPaymentStatusRequestedCopyWithImpl;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$SalesPaymentStatusRequestedCopyWithImpl<$Res>
    implements $SalesPaymentStatusRequestedCopyWith<$Res> {
  _$SalesPaymentStatusRequestedCopyWithImpl(this._self, this._then);

  final SalesPaymentStatusRequested _self;
  final $Res Function(SalesPaymentStatusRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(SalesPaymentStatusRequested(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SalesStatisticsRequested implements SalesEvent {
  const SalesStatisticsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesStatisticsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.statisticsRequested()';
  }
}

/// @nodoc

class SalesCheckoutRequested implements SalesEvent {
  const SalesCheckoutRequested(
      {required this.sale,
      required final List<SaleItem> items,
      required final List<SalePayment> payments})
      : _items = items,
        _payments = payments;

  final Sale sale;
  final List<SaleItem> _items;
  List<SaleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<SalePayment> _payments;
  List<SalePayment> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalesCheckoutRequestedCopyWith<SalesCheckoutRequested> get copyWith =>
      _$SalesCheckoutRequestedCopyWithImpl<SalesCheckoutRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalesCheckoutRequested &&
            (identical(other.sale, sale) || other.sale == sale) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sale,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_payments));

  @override
  String toString() {
    return 'SalesEvent.checkoutRequested(sale: $sale, items: $items, payments: $payments)';
  }
}

/// @nodoc
abstract mixin class $SalesCheckoutRequestedCopyWith<$Res>
    implements $SalesEventCopyWith<$Res> {
  factory $SalesCheckoutRequestedCopyWith(SalesCheckoutRequested value,
          $Res Function(SalesCheckoutRequested) _then) =
      _$SalesCheckoutRequestedCopyWithImpl;
  @useResult
  $Res call({Sale sale, List<SaleItem> items, List<SalePayment> payments});

  $SaleCopyWith<$Res> get sale;
}

/// @nodoc
class _$SalesCheckoutRequestedCopyWithImpl<$Res>
    implements $SalesCheckoutRequestedCopyWith<$Res> {
  _$SalesCheckoutRequestedCopyWithImpl(this._self, this._then);

  final SalesCheckoutRequested _self;
  final $Res Function(SalesCheckoutRequested) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sale = null,
    Object? items = null,
    Object? payments = null,
  }) {
    return _then(SalesCheckoutRequested(
      sale: null == sale
          ? _self.sale
          : sale // ignore: cast_nullable_to_non_nullable
              as Sale,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>,
      payments: null == payments
          ? _self._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<SalePayment>,
    ));
  }

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleCopyWith<$Res> get sale {
    return $SaleCopyWith<$Res>(_self.sale, (value) {
      return _then(_self.copyWith(sale: value));
    });
  }
}

/// @nodoc

class SalesRefreshRequested implements SalesEvent {
  const SalesRefreshRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalesRefreshRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalesEvent.refreshRequested()';
  }
}

// dart format on
