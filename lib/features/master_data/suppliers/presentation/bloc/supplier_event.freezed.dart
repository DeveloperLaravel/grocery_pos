// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierEvent {
  SupplierEventType get type; // Query
  SupplierListQuery? get query;
  SupplierWatchQuery? get watchQuery; // Supplier
  Supplier? get supplier;
  List<Supplier>? get suppliers; // IDs
  int? get id;
  int? get excludeId; // Pagination
  int? get limit;
  int? get offset; // Search / Filter / Code
  String? get value;
  String? get code;
  String? get message; // Financial
  double? get balance; // Rating
  double? get rating; // Status
  bool? get isPreferred;
  bool? get isActive; // Dates
  DateTime? get date;

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierEventCopyWith<SupplierEvent> get copyWith =>
      _$SupplierEventCopyWithImpl<SupplierEvent>(
          this as SupplierEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierEvent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.watchQuery, watchQuery) ||
                other.watchQuery == watchQuery) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            const DeepCollectionEquality().equals(other.suppliers, suppliers) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.excludeId, excludeId) ||
                other.excludeId == excludeId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      query,
      watchQuery,
      supplier,
      const DeepCollectionEquality().hash(suppliers),
      id,
      excludeId,
      limit,
      offset,
      value,
      code,
      message,
      balance,
      rating,
      isPreferred,
      isActive,
      date);

  @override
  String toString() {
    return 'SupplierEvent(type: $type, query: $query, watchQuery: $watchQuery, supplier: $supplier, suppliers: $suppliers, id: $id, excludeId: $excludeId, limit: $limit, offset: $offset, value: $value, code: $code, message: $message, balance: $balance, rating: $rating, isPreferred: $isPreferred, isActive: $isActive, date: $date)';
  }
}

/// @nodoc
abstract mixin class $SupplierEventCopyWith<$Res> {
  factory $SupplierEventCopyWith(
          SupplierEvent value, $Res Function(SupplierEvent) _then) =
      _$SupplierEventCopyWithImpl;
  @useResult
  $Res call(
      {SupplierEventType type,
      SupplierListQuery? query,
      SupplierWatchQuery? watchQuery,
      Supplier? supplier,
      List<Supplier>? suppliers,
      int? id,
      int? excludeId,
      int? limit,
      int? offset,
      String? value,
      String? code,
      String? message,
      double? balance,
      double? rating,
      bool? isPreferred,
      bool? isActive,
      DateTime? date});

  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class _$SupplierEventCopyWithImpl<$Res>
    implements $SupplierEventCopyWith<$Res> {
  _$SupplierEventCopyWithImpl(this._self, this._then);

  final SupplierEvent _self;
  final $Res Function(SupplierEvent) _then;

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? query = freezed,
    Object? watchQuery = freezed,
    Object? supplier = freezed,
    Object? suppliers = freezed,
    Object? id = freezed,
    Object? excludeId = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? value = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? balance = freezed,
    Object? rating = freezed,
    Object? isPreferred = freezed,
    Object? isActive = freezed,
    Object? date = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SupplierEventType,
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as SupplierListQuery?,
      watchQuery: freezed == watchQuery
          ? _self.watchQuery
          : watchQuery // ignore: cast_nullable_to_non_nullable
              as SupplierWatchQuery?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      suppliers: freezed == suppliers
          ? _self.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      excludeId: freezed == excludeId
          ? _self.excludeId
          : excludeId // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isPreferred: freezed == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.supplier!, (value) {
      return _then(_self.copyWith(supplier: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SupplierEvent].
extension SupplierEventPatterns on SupplierEvent {
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
    TResult Function(_SupplierEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent() when $default != null:
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
    TResult Function(_SupplierEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent():
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
    TResult? Function(_SupplierEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent() when $default != null:
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
            SupplierEventType type,
            SupplierListQuery? query,
            SupplierWatchQuery? watchQuery,
            Supplier? supplier,
            List<Supplier>? suppliers,
            int? id,
            int? excludeId,
            int? limit,
            int? offset,
            String? value,
            String? code,
            String? message,
            double? balance,
            double? rating,
            bool? isPreferred,
            bool? isActive,
            DateTime? date)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent() when $default != null:
        return $default(
            _that.type,
            _that.query,
            _that.watchQuery,
            _that.supplier,
            _that.suppliers,
            _that.id,
            _that.excludeId,
            _that.limit,
            _that.offset,
            _that.value,
            _that.code,
            _that.message,
            _that.balance,
            _that.rating,
            _that.isPreferred,
            _that.isActive,
            _that.date);
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
            SupplierEventType type,
            SupplierListQuery? query,
            SupplierWatchQuery? watchQuery,
            Supplier? supplier,
            List<Supplier>? suppliers,
            int? id,
            int? excludeId,
            int? limit,
            int? offset,
            String? value,
            String? code,
            String? message,
            double? balance,
            double? rating,
            bool? isPreferred,
            bool? isActive,
            DateTime? date)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent():
        return $default(
            _that.type,
            _that.query,
            _that.watchQuery,
            _that.supplier,
            _that.suppliers,
            _that.id,
            _that.excludeId,
            _that.limit,
            _that.offset,
            _that.value,
            _that.code,
            _that.message,
            _that.balance,
            _that.rating,
            _that.isPreferred,
            _that.isActive,
            _that.date);
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
            SupplierEventType type,
            SupplierListQuery? query,
            SupplierWatchQuery? watchQuery,
            Supplier? supplier,
            List<Supplier>? suppliers,
            int? id,
            int? excludeId,
            int? limit,
            int? offset,
            String? value,
            String? code,
            String? message,
            double? balance,
            double? rating,
            bool? isPreferred,
            bool? isActive,
            DateTime? date)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierEvent() when $default != null:
        return $default(
            _that.type,
            _that.query,
            _that.watchQuery,
            _that.supplier,
            _that.suppliers,
            _that.id,
            _that.excludeId,
            _that.limit,
            _that.offset,
            _that.value,
            _that.code,
            _that.message,
            _that.balance,
            _that.rating,
            _that.isPreferred,
            _that.isActive,
            _that.date);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SupplierEvent implements SupplierEvent {
  const _SupplierEvent(
      {required this.type,
      this.query,
      this.watchQuery,
      this.supplier,
      final List<Supplier>? suppliers,
      this.id,
      this.excludeId,
      this.limit,
      this.offset,
      this.value,
      this.code,
      this.message,
      this.balance,
      this.rating,
      this.isPreferred,
      this.isActive,
      this.date})
      : _suppliers = suppliers;

  @override
  final SupplierEventType type;
// Query
  @override
  final SupplierListQuery? query;
  @override
  final SupplierWatchQuery? watchQuery;
// Supplier
  @override
  final Supplier? supplier;
  final List<Supplier>? _suppliers;
  @override
  List<Supplier>? get suppliers {
    final value = _suppliers;
    if (value == null) return null;
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// IDs
  @override
  final int? id;
  @override
  final int? excludeId;
// Pagination
  @override
  final int? limit;
  @override
  final int? offset;
// Search / Filter / Code
  @override
  final String? value;
  @override
  final String? code;
  @override
  final String? message;
// Financial
  @override
  final double? balance;
// Rating
  @override
  final double? rating;
// Status
  @override
  final bool? isPreferred;
  @override
  final bool? isActive;
// Dates
  @override
  final DateTime? date;

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierEventCopyWith<_SupplierEvent> get copyWith =>
      __$SupplierEventCopyWithImpl<_SupplierEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SupplierEvent &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.watchQuery, watchQuery) ||
                other.watchQuery == watchQuery) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            const DeepCollectionEquality()
                .equals(other._suppliers, _suppliers) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.excludeId, excludeId) ||
                other.excludeId == excludeId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      query,
      watchQuery,
      supplier,
      const DeepCollectionEquality().hash(_suppliers),
      id,
      excludeId,
      limit,
      offset,
      value,
      code,
      message,
      balance,
      rating,
      isPreferred,
      isActive,
      date);

  @override
  String toString() {
    return 'SupplierEvent(type: $type, query: $query, watchQuery: $watchQuery, supplier: $supplier, suppliers: $suppliers, id: $id, excludeId: $excludeId, limit: $limit, offset: $offset, value: $value, code: $code, message: $message, balance: $balance, rating: $rating, isPreferred: $isPreferred, isActive: $isActive, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$SupplierEventCopyWith<$Res>
    implements $SupplierEventCopyWith<$Res> {
  factory _$SupplierEventCopyWith(
          _SupplierEvent value, $Res Function(_SupplierEvent) _then) =
      __$SupplierEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SupplierEventType type,
      SupplierListQuery? query,
      SupplierWatchQuery? watchQuery,
      Supplier? supplier,
      List<Supplier>? suppliers,
      int? id,
      int? excludeId,
      int? limit,
      int? offset,
      String? value,
      String? code,
      String? message,
      double? balance,
      double? rating,
      bool? isPreferred,
      bool? isActive,
      DateTime? date});

  @override
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class __$SupplierEventCopyWithImpl<$Res>
    implements _$SupplierEventCopyWith<$Res> {
  __$SupplierEventCopyWithImpl(this._self, this._then);

  final _SupplierEvent _self;
  final $Res Function(_SupplierEvent) _then;

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? query = freezed,
    Object? watchQuery = freezed,
    Object? supplier = freezed,
    Object? suppliers = freezed,
    Object? id = freezed,
    Object? excludeId = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? value = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? balance = freezed,
    Object? rating = freezed,
    Object? isPreferred = freezed,
    Object? isActive = freezed,
    Object? date = freezed,
  }) {
    return _then(_SupplierEvent(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SupplierEventType,
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as SupplierListQuery?,
      watchQuery: freezed == watchQuery
          ? _self.watchQuery
          : watchQuery // ignore: cast_nullable_to_non_nullable
              as SupplierWatchQuery?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      suppliers: freezed == suppliers
          ? _self._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      excludeId: freezed == excludeId
          ? _self.excludeId
          : excludeId // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isPreferred: freezed == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of SupplierEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.supplier!, (value) {
      return _then(_self.copyWith(supplier: value));
    });
  }
}

// dart format on
