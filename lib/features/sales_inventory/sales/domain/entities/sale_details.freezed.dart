// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleDetails {
  Sale get sale;
  List<SaleItem> get items;
  List<SalePayment> get payments;

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleDetailsCopyWith<SaleDetails> get copyWith =>
      _$SaleDetailsCopyWithImpl<SaleDetails>(this as SaleDetails, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleDetails &&
            (identical(other.sale, sale) || other.sale == sale) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.payments, payments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sale,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(payments));

  @override
  String toString() {
    return 'SaleDetails(sale: $sale, items: $items, payments: $payments)';
  }
}

/// @nodoc
abstract mixin class $SaleDetailsCopyWith<$Res> {
  factory $SaleDetailsCopyWith(
          SaleDetails value, $Res Function(SaleDetails) _then) =
      _$SaleDetailsCopyWithImpl;
  @useResult
  $Res call({Sale sale, List<SaleItem> items, List<SalePayment> payments});

  $SaleCopyWith<$Res> get sale;
}

/// @nodoc
class _$SaleDetailsCopyWithImpl<$Res> implements $SaleDetailsCopyWith<$Res> {
  _$SaleDetailsCopyWithImpl(this._self, this._then);

  final SaleDetails _self;
  final $Res Function(SaleDetails) _then;

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sale = null,
    Object? items = null,
    Object? payments = null,
  }) {
    return _then(_self.copyWith(
      sale: null == sale
          ? _self.sale
          : sale // ignore: cast_nullable_to_non_nullable
              as Sale,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>,
      payments: null == payments
          ? _self.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<SalePayment>,
    ));
  }

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleCopyWith<$Res> get sale {
    return $SaleCopyWith<$Res>(_self.sale, (value) {
      return _then(_self.copyWith(sale: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SaleDetails].
extension SaleDetailsPatterns on SaleDetails {
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
    TResult Function(_SaleDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleDetails() when $default != null:
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
    TResult Function(_SaleDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetails():
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
    TResult? Function(_SaleDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetails() when $default != null:
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
            Sale sale, List<SaleItem> items, List<SalePayment> payments)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleDetails() when $default != null:
        return $default(_that.sale, _that.items, _that.payments);
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
            Sale sale, List<SaleItem> items, List<SalePayment> payments)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetails():
        return $default(_that.sale, _that.items, _that.payments);
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
            Sale sale, List<SaleItem> items, List<SalePayment> payments)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetails() when $default != null:
        return $default(_that.sale, _that.items, _that.payments);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SaleDetails implements SaleDetails {
  const _SaleDetails(
      {required this.sale,
      final List<SaleItem> items = const [],
      final List<SalePayment> payments = const []})
      : _items = items,
        _payments = payments;

  @override
  final Sale sale;
  final List<SaleItem> _items;
  @override
  @JsonKey()
  List<SaleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<SalePayment> _payments;
  @override
  @JsonKey()
  List<SalePayment> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleDetailsCopyWith<_SaleDetails> get copyWith =>
      __$SaleDetailsCopyWithImpl<_SaleDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleDetails &&
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
    return 'SaleDetails(sale: $sale, items: $items, payments: $payments)';
  }
}

/// @nodoc
abstract mixin class _$SaleDetailsCopyWith<$Res>
    implements $SaleDetailsCopyWith<$Res> {
  factory _$SaleDetailsCopyWith(
          _SaleDetails value, $Res Function(_SaleDetails) _then) =
      __$SaleDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({Sale sale, List<SaleItem> items, List<SalePayment> payments});

  @override
  $SaleCopyWith<$Res> get sale;
}

/// @nodoc
class __$SaleDetailsCopyWithImpl<$Res> implements _$SaleDetailsCopyWith<$Res> {
  __$SaleDetailsCopyWithImpl(this._self, this._then);

  final _SaleDetails _self;
  final $Res Function(_SaleDetails) _then;

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sale = null,
    Object? items = null,
    Object? payments = null,
  }) {
    return _then(_SaleDetails(
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

  /// Create a copy of SaleDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleCopyWith<$Res> get sale {
    return $SaleCopyWith<$Res>(_self.sale, (value) {
      return _then(_self.copyWith(sale: value));
    });
  }
}

// dart format on
