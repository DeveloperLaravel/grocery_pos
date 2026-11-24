// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseReceiptModel {
  int get id;
  int get purchaseOrderId;
  String get receiptNumber;
  DateTime get receivedAt;
  String? get notes;
  DateTime get createdAt;

  /// Create a copy of PurchaseReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseReceiptModelCopyWith<PurchaseReceiptModel> get copyWith =>
      _$PurchaseReceiptModelCopyWithImpl<PurchaseReceiptModel>(
          this as PurchaseReceiptModel, _$identity);

  /// Serializes this PurchaseReceiptModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseReceiptModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, purchaseOrderId,
      receiptNumber, receivedAt, notes, createdAt);

  @override
  String toString() {
    return 'PurchaseReceiptModel(id: $id, purchaseOrderId: $purchaseOrderId, receiptNumber: $receiptNumber, receivedAt: $receivedAt, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PurchaseReceiptModelCopyWith<$Res> {
  factory $PurchaseReceiptModelCopyWith(PurchaseReceiptModel value,
          $Res Function(PurchaseReceiptModel) _then) =
      _$PurchaseReceiptModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      String receiptNumber,
      DateTime receivedAt,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class _$PurchaseReceiptModelCopyWithImpl<$Res>
    implements $PurchaseReceiptModelCopyWith<$Res> {
  _$PurchaseReceiptModelCopyWithImpl(this._self, this._then);

  final PurchaseReceiptModel _self;
  final $Res Function(PurchaseReceiptModel) _then;

  /// Create a copy of PurchaseReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? receiptNumber = null,
    Object? receivedAt = null,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _self.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiptNumber: null == receiptNumber
          ? _self.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseReceiptModel].
extension PurchaseReceiptModelPatterns on PurchaseReceiptModel {
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
    TResult Function(_PurchaseReceiptModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel() when $default != null:
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
    TResult Function(_PurchaseReceiptModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel():
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
    TResult? Function(_PurchaseReceiptModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel() when $default != null:
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
    TResult Function(int id, int purchaseOrderId, String receiptNumber,
            DateTime receivedAt, String? notes, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel() when $default != null:
        return $default(_that.id, _that.purchaseOrderId, _that.receiptNumber,
            _that.receivedAt, _that.notes, _that.createdAt);
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
    TResult Function(int id, int purchaseOrderId, String receiptNumber,
            DateTime receivedAt, String? notes, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel():
        return $default(_that.id, _that.purchaseOrderId, _that.receiptNumber,
            _that.receivedAt, _that.notes, _that.createdAt);
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
    TResult? Function(int id, int purchaseOrderId, String receiptNumber,
            DateTime receivedAt, String? notes, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptModel() when $default != null:
        return $default(_that.id, _that.purchaseOrderId, _that.receiptNumber,
            _that.receivedAt, _that.notes, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseReceiptModel extends PurchaseReceiptModel {
  const _PurchaseReceiptModel(
      {required this.id,
      required this.purchaseOrderId,
      required this.receiptNumber,
      required this.receivedAt,
      this.notes,
      required this.createdAt})
      : super._();
  factory _PurchaseReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReceiptModelFromJson(json);

  @override
  final int id;
  @override
  final int purchaseOrderId;
  @override
  final String receiptNumber;
  @override
  final DateTime receivedAt;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  /// Create a copy of PurchaseReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseReceiptModelCopyWith<_PurchaseReceiptModel> get copyWith =>
      __$PurchaseReceiptModelCopyWithImpl<_PurchaseReceiptModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseReceiptModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseReceiptModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, purchaseOrderId,
      receiptNumber, receivedAt, notes, createdAt);

  @override
  String toString() {
    return 'PurchaseReceiptModel(id: $id, purchaseOrderId: $purchaseOrderId, receiptNumber: $receiptNumber, receivedAt: $receivedAt, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseReceiptModelCopyWith<$Res>
    implements $PurchaseReceiptModelCopyWith<$Res> {
  factory _$PurchaseReceiptModelCopyWith(_PurchaseReceiptModel value,
          $Res Function(_PurchaseReceiptModel) _then) =
      __$PurchaseReceiptModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      String receiptNumber,
      DateTime receivedAt,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class __$PurchaseReceiptModelCopyWithImpl<$Res>
    implements _$PurchaseReceiptModelCopyWith<$Res> {
  __$PurchaseReceiptModelCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptModel _self;
  final $Res Function(_PurchaseReceiptModel) _then;

  /// Create a copy of PurchaseReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? receiptNumber = null,
    Object? receivedAt = null,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_PurchaseReceiptModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _self.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiptNumber: null == receiptNumber
          ? _self.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
