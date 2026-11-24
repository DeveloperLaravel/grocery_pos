// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleDetailsModel {
  SaleModel get sale;
  List<SaleItemModel> get items;
  List<SalePaymentModel> get payments;

  /// Create a copy of SaleDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleDetailsModelCopyWith<SaleDetailsModel> get copyWith =>
      _$SaleDetailsModelCopyWithImpl<SaleDetailsModel>(
          this as SaleDetailsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleDetailsModel &&
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
    return 'SaleDetailsModel(sale: $sale, items: $items, payments: $payments)';
  }
}

/// @nodoc
abstract mixin class $SaleDetailsModelCopyWith<$Res> {
  factory $SaleDetailsModelCopyWith(
          SaleDetailsModel value, $Res Function(SaleDetailsModel) _then) =
      _$SaleDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {SaleModel sale,
      List<SaleItemModel> items,
      List<SalePaymentModel> payments});

  $SaleModelCopyWith<$Res> get sale;
}

/// @nodoc
class _$SaleDetailsModelCopyWithImpl<$Res>
    implements $SaleDetailsModelCopyWith<$Res> {
  _$SaleDetailsModelCopyWithImpl(this._self, this._then);

  final SaleDetailsModel _self;
  final $Res Function(SaleDetailsModel) _then;

  /// Create a copy of SaleDetailsModel
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
              as SaleModel,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItemModel>,
      payments: null == payments
          ? _self.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<SalePaymentModel>,
    ));
  }

  /// Create a copy of SaleDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleModelCopyWith<$Res> get sale {
    return $SaleModelCopyWith<$Res>(_self.sale, (value) {
      return _then(_self.copyWith(sale: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SaleDetailsModel].
extension SaleDetailsModelPatterns on SaleDetailsModel {
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
    TResult Function(_SaleDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel() when $default != null:
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
    TResult Function(_SaleDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel():
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
    TResult? Function(_SaleDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel() when $default != null:
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
    TResult Function(SaleModel sale, List<SaleItemModel> items,
            List<SalePaymentModel> payments)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel() when $default != null:
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
    TResult Function(SaleModel sale, List<SaleItemModel> items,
            List<SalePaymentModel> payments)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel():
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
    TResult? Function(SaleModel sale, List<SaleItemModel> items,
            List<SalePaymentModel> payments)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleDetailsModel() when $default != null:
        return $default(_that.sale, _that.items, _that.payments);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SaleDetailsModel implements SaleDetailsModel {
  const _SaleDetailsModel(
      {required this.sale,
      required final List<SaleItemModel> items,
      required final List<SalePaymentModel> payments})
      : _items = items,
        _payments = payments;

  @override
  final SaleModel sale;
  final List<SaleItemModel> _items;
  @override
  List<SaleItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<SalePaymentModel> _payments;
  @override
  List<SalePaymentModel> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  /// Create a copy of SaleDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleDetailsModelCopyWith<_SaleDetailsModel> get copyWith =>
      __$SaleDetailsModelCopyWithImpl<_SaleDetailsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleDetailsModel &&
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
    return 'SaleDetailsModel(sale: $sale, items: $items, payments: $payments)';
  }
}

/// @nodoc
abstract mixin class _$SaleDetailsModelCopyWith<$Res>
    implements $SaleDetailsModelCopyWith<$Res> {
  factory _$SaleDetailsModelCopyWith(
          _SaleDetailsModel value, $Res Function(_SaleDetailsModel) _then) =
      __$SaleDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SaleModel sale,
      List<SaleItemModel> items,
      List<SalePaymentModel> payments});

  @override
  $SaleModelCopyWith<$Res> get sale;
}

/// @nodoc
class __$SaleDetailsModelCopyWithImpl<$Res>
    implements _$SaleDetailsModelCopyWith<$Res> {
  __$SaleDetailsModelCopyWithImpl(this._self, this._then);

  final _SaleDetailsModel _self;
  final $Res Function(_SaleDetailsModel) _then;

  /// Create a copy of SaleDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sale = null,
    Object? items = null,
    Object? payments = null,
  }) {
    return _then(_SaleDetailsModel(
      sale: null == sale
          ? _self.sale
          : sale // ignore: cast_nullable_to_non_nullable
              as SaleModel,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleItemModel>,
      payments: null == payments
          ? _self._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<SalePaymentModel>,
    ));
  }

  /// Create a copy of SaleDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleModelCopyWith<$Res> get sale {
    return $SaleModelCopyWith<$Res>(_self.sale, (value) {
      return _then(_self.copyWith(sale: value));
    });
  }
}

// dart format on
