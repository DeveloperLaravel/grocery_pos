// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseReceiptDetailsModel {
  PurchaseReceiptModel get receipt;
  List<PurchaseReceiptItemModel> get items;

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseReceiptDetailsModelCopyWith<PurchaseReceiptDetailsModel>
      get copyWith => _$PurchaseReceiptDetailsModelCopyWithImpl<
              PurchaseReceiptDetailsModel>(
          this as PurchaseReceiptDetailsModel, _$identity);

  /// Serializes this PurchaseReceiptDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseReceiptDetailsModel &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, receipt, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'PurchaseReceiptDetailsModel(receipt: $receipt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $PurchaseReceiptDetailsModelCopyWith<$Res> {
  factory $PurchaseReceiptDetailsModelCopyWith(
          PurchaseReceiptDetailsModel value,
          $Res Function(PurchaseReceiptDetailsModel) _then) =
      _$PurchaseReceiptDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {PurchaseReceiptModel receipt, List<PurchaseReceiptItemModel> items});

  $PurchaseReceiptModelCopyWith<$Res> get receipt;
}

/// @nodoc
class _$PurchaseReceiptDetailsModelCopyWithImpl<$Res>
    implements $PurchaseReceiptDetailsModelCopyWith<$Res> {
  _$PurchaseReceiptDetailsModelCopyWithImpl(this._self, this._then);

  final PurchaseReceiptDetailsModel _self;
  final $Res Function(PurchaseReceiptDetailsModel) _then;

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receipt = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as PurchaseReceiptModel,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseReceiptItemModel>,
    ));
  }

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseReceiptModelCopyWith<$Res> get receipt {
    return $PurchaseReceiptModelCopyWith<$Res>(_self.receipt, (value) {
      return _then(_self.copyWith(receipt: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PurchaseReceiptDetailsModel].
extension PurchaseReceiptDetailsModelPatterns on PurchaseReceiptDetailsModel {
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
    TResult Function(_PurchaseReceiptDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel() when $default != null:
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
    TResult Function(_PurchaseReceiptDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel():
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
    TResult? Function(_PurchaseReceiptDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel() when $default != null:
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
            PurchaseReceiptModel receipt, List<PurchaseReceiptItemModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel() when $default != null:
        return $default(_that.receipt, _that.items);
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
            PurchaseReceiptModel receipt, List<PurchaseReceiptItemModel> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel():
        return $default(_that.receipt, _that.items);
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
            PurchaseReceiptModel receipt, List<PurchaseReceiptItemModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptDetailsModel() when $default != null:
        return $default(_that.receipt, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseReceiptDetailsModel extends PurchaseReceiptDetailsModel {
  const _PurchaseReceiptDetailsModel(
      {required this.receipt,
      final List<PurchaseReceiptItemModel> items = const []})
      : _items = items,
        super._();
  factory _PurchaseReceiptDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReceiptDetailsModelFromJson(json);

  @override
  final PurchaseReceiptModel receipt;
  final List<PurchaseReceiptItemModel> _items;
  @override
  @JsonKey()
  List<PurchaseReceiptItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseReceiptDetailsModelCopyWith<_PurchaseReceiptDetailsModel>
      get copyWith => __$PurchaseReceiptDetailsModelCopyWithImpl<
          _PurchaseReceiptDetailsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseReceiptDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseReceiptDetailsModel &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, receipt, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'PurchaseReceiptDetailsModel(receipt: $receipt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseReceiptDetailsModelCopyWith<$Res>
    implements $PurchaseReceiptDetailsModelCopyWith<$Res> {
  factory _$PurchaseReceiptDetailsModelCopyWith(
          _PurchaseReceiptDetailsModel value,
          $Res Function(_PurchaseReceiptDetailsModel) _then) =
      __$PurchaseReceiptDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PurchaseReceiptModel receipt, List<PurchaseReceiptItemModel> items});

  @override
  $PurchaseReceiptModelCopyWith<$Res> get receipt;
}

/// @nodoc
class __$PurchaseReceiptDetailsModelCopyWithImpl<$Res>
    implements _$PurchaseReceiptDetailsModelCopyWith<$Res> {
  __$PurchaseReceiptDetailsModelCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptDetailsModel _self;
  final $Res Function(_PurchaseReceiptDetailsModel) _then;

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? receipt = null,
    Object? items = null,
  }) {
    return _then(_PurchaseReceiptDetailsModel(
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as PurchaseReceiptModel,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseReceiptItemModel>,
    ));
  }

  /// Create a copy of PurchaseReceiptDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseReceiptModelCopyWith<$Res> get receipt {
    return $PurchaseReceiptModelCopyWith<$Res>(_self.receipt, (value) {
      return _then(_self.copyWith(receipt: value));
    });
  }
}

// dart format on
