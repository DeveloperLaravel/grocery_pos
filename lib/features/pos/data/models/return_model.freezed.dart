// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnModel {
  int get id;
  @JsonKey(name: 'sale_id')
  int get saleId;
  double get total;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  List<ReturnItemModel> get items;

  /// Create a copy of ReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReturnModelCopyWith<ReturnModel> get copyWith =>
      _$ReturnModelCopyWithImpl<ReturnModel>(this as ReturnModel, _$identity);

  /// Serializes this ReturnModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReturnModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, total, createdAt,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ReturnModel(id: $id, saleId: $saleId, total: $total, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ReturnModelCopyWith<$Res> {
  factory $ReturnModelCopyWith(
          ReturnModel value, $Res Function(ReturnModel) _then) =
      _$ReturnModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_id') int saleId,
      double total,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<ReturnItemModel> items});
}

/// @nodoc
class _$ReturnModelCopyWithImpl<$Res> implements $ReturnModelCopyWith<$Res> {
  _$ReturnModelCopyWithImpl(this._self, this._then);

  final ReturnModel _self;
  final $Res Function(ReturnModel) _then;

  /// Create a copy of ReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? total = null,
    Object? createdAt = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReturnModel].
extension ReturnModelPatterns on ReturnModel {
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
    TResult Function(_ReturnModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnModel() when $default != null:
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
    TResult Function(_ReturnModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnModel():
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
    TResult? Function(_ReturnModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnModel() when $default != null:
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
            int id,
            @JsonKey(name: 'sale_id') int saleId,
            double total,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<ReturnItemModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnModel() when $default != null:
        return $default(
            _that.id, _that.saleId, _that.total, _that.createdAt, _that.items);
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
            int id,
            @JsonKey(name: 'sale_id') int saleId,
            double total,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<ReturnItemModel> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnModel():
        return $default(
            _that.id, _that.saleId, _that.total, _that.createdAt, _that.items);
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
            int id,
            @JsonKey(name: 'sale_id') int saleId,
            double total,
            @JsonKey(name: 'created_at') DateTime createdAt,
            List<ReturnItemModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnModel() when $default != null:
        return $default(
            _that.id, _that.saleId, _that.total, _that.createdAt, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReturnModel implements ReturnModel {
  const _ReturnModel(
      {required this.id,
      @JsonKey(name: 'sale_id') required this.saleId,
      required this.total,
      @JsonKey(name: 'created_at') required this.createdAt,
      final List<ReturnItemModel> items = const []})
      : _items = items;
  factory _ReturnModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sale_id')
  final int saleId;
  @override
  final double total;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<ReturnItemModel> _items;
  @override
  @JsonKey()
  List<ReturnItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReturnModelCopyWith<_ReturnModel> get copyWith =>
      __$ReturnModelCopyWithImpl<_ReturnModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReturnModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReturnModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, total, createdAt,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ReturnModel(id: $id, saleId: $saleId, total: $total, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ReturnModelCopyWith<$Res>
    implements $ReturnModelCopyWith<$Res> {
  factory _$ReturnModelCopyWith(
          _ReturnModel value, $Res Function(_ReturnModel) _then) =
      __$ReturnModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_id') int saleId,
      double total,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<ReturnItemModel> items});
}

/// @nodoc
class __$ReturnModelCopyWithImpl<$Res> implements _$ReturnModelCopyWith<$Res> {
  __$ReturnModelCopyWithImpl(this._self, this._then);

  final _ReturnModel _self;
  final $Res Function(_ReturnModel) _then;

  /// Create a copy of ReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? total = null,
    Object? createdAt = null,
    Object? items = null,
  }) {
    return _then(_ReturnModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemModel>,
    ));
  }
}

// dart format on
