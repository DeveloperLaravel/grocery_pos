// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchasePaymentModel {
  int get id;
  int get purchaseOrderId;
  String get paymentNumber;
  double get amount;
  DateTime get paymentDate;
  String get paymentMethod;
  String? get referenceNumber;
  String? get notes;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of PurchasePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePaymentModelCopyWith<PurchasePaymentModel> get copyWith =>
      _$PurchasePaymentModelCopyWithImpl<PurchasePaymentModel>(
          this as PurchasePaymentModel, _$identity);

  /// Serializes this PurchasePaymentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.paymentNumber, paymentNumber) ||
                other.paymentNumber == paymentNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseOrderId,
      paymentNumber,
      amount,
      paymentDate,
      paymentMethod,
      referenceNumber,
      notes,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PurchasePaymentModel(id: $id, purchaseOrderId: $purchaseOrderId, paymentNumber: $paymentNumber, amount: $amount, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNumber: $referenceNumber, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PurchasePaymentModelCopyWith<$Res> {
  factory $PurchasePaymentModelCopyWith(PurchasePaymentModel value,
          $Res Function(PurchasePaymentModel) _then) =
      _$PurchasePaymentModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      String paymentNumber,
      double amount,
      DateTime paymentDate,
      String paymentMethod,
      String? referenceNumber,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PurchasePaymentModelCopyWithImpl<$Res>
    implements $PurchasePaymentModelCopyWith<$Res> {
  _$PurchasePaymentModelCopyWithImpl(this._self, this._then);

  final PurchasePaymentModel _self;
  final $Res Function(PurchasePaymentModel) _then;

  /// Create a copy of PurchasePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? paymentNumber = null,
    Object? amount = null,
    Object? paymentDate = null,
    Object? paymentMethod = null,
    Object? referenceNumber = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      paymentNumber: null == paymentNumber
          ? _self.paymentNumber
          : paymentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNumber: freezed == referenceNumber
          ? _self.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchasePaymentModel].
extension PurchasePaymentModelPatterns on PurchasePaymentModel {
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
    TResult Function(_PurchasePaymentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel() when $default != null:
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
    TResult Function(_PurchasePaymentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel():
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
    TResult? Function(_PurchasePaymentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel() when $default != null:
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
            int purchaseOrderId,
            String paymentNumber,
            double amount,
            DateTime paymentDate,
            String paymentMethod,
            String? referenceNumber,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.paymentNumber,
            _that.amount,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNumber,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
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
            int purchaseOrderId,
            String paymentNumber,
            double amount,
            DateTime paymentDate,
            String paymentMethod,
            String? referenceNumber,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel():
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.paymentNumber,
            _that.amount,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNumber,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
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
            int purchaseOrderId,
            String paymentNumber,
            double amount,
            DateTime paymentDate,
            String paymentMethod,
            String? referenceNumber,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchasePaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.paymentNumber,
            _that.amount,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNumber,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchasePaymentModel extends PurchasePaymentModel {
  const _PurchasePaymentModel(
      {required this.id,
      required this.purchaseOrderId,
      required this.paymentNumber,
      required this.amount,
      required this.paymentDate,
      required this.paymentMethod,
      this.referenceNumber,
      this.notes,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  factory _PurchasePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasePaymentModelFromJson(json);

  @override
  final int id;
  @override
  final int purchaseOrderId;
  @override
  final String paymentNumber;
  @override
  final double amount;
  @override
  final DateTime paymentDate;
  @override
  final String paymentMethod;
  @override
  final String? referenceNumber;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of PurchasePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchasePaymentModelCopyWith<_PurchasePaymentModel> get copyWith =>
      __$PurchasePaymentModelCopyWithImpl<_PurchasePaymentModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchasePaymentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchasePaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.paymentNumber, paymentNumber) ||
                other.paymentNumber == paymentNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseOrderId,
      paymentNumber,
      amount,
      paymentDate,
      paymentMethod,
      referenceNumber,
      notes,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PurchasePaymentModel(id: $id, purchaseOrderId: $purchaseOrderId, paymentNumber: $paymentNumber, amount: $amount, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNumber: $referenceNumber, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PurchasePaymentModelCopyWith<$Res>
    implements $PurchasePaymentModelCopyWith<$Res> {
  factory _$PurchasePaymentModelCopyWith(_PurchasePaymentModel value,
          $Res Function(_PurchasePaymentModel) _then) =
      __$PurchasePaymentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      String paymentNumber,
      double amount,
      DateTime paymentDate,
      String paymentMethod,
      String? referenceNumber,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$PurchasePaymentModelCopyWithImpl<$Res>
    implements _$PurchasePaymentModelCopyWith<$Res> {
  __$PurchasePaymentModelCopyWithImpl(this._self, this._then);

  final _PurchasePaymentModel _self;
  final $Res Function(_PurchasePaymentModel) _then;

  /// Create a copy of PurchasePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? paymentNumber = null,
    Object? amount = null,
    Object? paymentDate = null,
    Object? paymentMethod = null,
    Object? referenceNumber = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_PurchasePaymentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _self.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentNumber: null == paymentNumber
          ? _self.paymentNumber
          : paymentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNumber: freezed == referenceNumber
          ? _self.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
