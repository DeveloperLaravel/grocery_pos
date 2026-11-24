// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalePaymentModel {
  int get id;
  int get saleId;
  double get amount;
  String get paymentMethod;
  String? get transactionReference;
  String? get notes;
  DateTime get paymentDate;
  DateTime get createdAt;

  /// Create a copy of SalePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalePaymentModelCopyWith<SalePaymentModel> get copyWith =>
      _$SalePaymentModelCopyWithImpl<SalePaymentModel>(
          this as SalePaymentModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalePaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, amount,
      paymentMethod, transactionReference, notes, paymentDate, createdAt);

  @override
  String toString() {
    return 'SalePaymentModel(id: $id, saleId: $saleId, amount: $amount, paymentMethod: $paymentMethod, transactionReference: $transactionReference, notes: $notes, paymentDate: $paymentDate, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SalePaymentModelCopyWith<$Res> {
  factory $SalePaymentModelCopyWith(
          SalePaymentModel value, $Res Function(SalePaymentModel) _then) =
      _$SalePaymentModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int saleId,
      double amount,
      String paymentMethod,
      String? transactionReference,
      String? notes,
      DateTime paymentDate,
      DateTime createdAt});
}

/// @nodoc
class _$SalePaymentModelCopyWithImpl<$Res>
    implements $SalePaymentModelCopyWith<$Res> {
  _$SalePaymentModelCopyWithImpl(this._self, this._then);

  final SalePaymentModel _self;
  final $Res Function(SalePaymentModel) _then;

  /// Create a copy of SalePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? transactionReference = freezed,
    Object? notes = freezed,
    Object? paymentDate = null,
    Object? createdAt = null,
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
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionReference: freezed == transactionReference
          ? _self.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SalePaymentModel].
extension SalePaymentModelPatterns on SalePaymentModel {
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
    TResult Function(_SalePaymentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel() when $default != null:
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
    TResult Function(_SalePaymentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel():
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
    TResult? Function(_SalePaymentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel() when $default != null:
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
            int saleId,
            double amount,
            String paymentMethod,
            String? transactionReference,
            String? notes,
            DateTime paymentDate,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.amount,
            _that.paymentMethod,
            _that.transactionReference,
            _that.notes,
            _that.paymentDate,
            _that.createdAt);
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
            int saleId,
            double amount,
            String paymentMethod,
            String? transactionReference,
            String? notes,
            DateTime paymentDate,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel():
        return $default(
            _that.id,
            _that.saleId,
            _that.amount,
            _that.paymentMethod,
            _that.transactionReference,
            _that.notes,
            _that.paymentDate,
            _that.createdAt);
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
            int saleId,
            double amount,
            String paymentMethod,
            String? transactionReference,
            String? notes,
            DateTime paymentDate,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SalePaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.amount,
            _that.paymentMethod,
            _that.transactionReference,
            _that.notes,
            _that.paymentDate,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SalePaymentModel implements SalePaymentModel {
  const _SalePaymentModel(
      {required this.id,
      required this.saleId,
      required this.amount,
      required this.paymentMethod,
      this.transactionReference,
      this.notes,
      required this.paymentDate,
      required this.createdAt});

  @override
  final int id;
  @override
  final int saleId;
  @override
  final double amount;
  @override
  final String paymentMethod;
  @override
  final String? transactionReference;
  @override
  final String? notes;
  @override
  final DateTime paymentDate;
  @override
  final DateTime createdAt;

  /// Create a copy of SalePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SalePaymentModelCopyWith<_SalePaymentModel> get copyWith =>
      __$SalePaymentModelCopyWithImpl<_SalePaymentModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SalePaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, saleId, amount,
      paymentMethod, transactionReference, notes, paymentDate, createdAt);

  @override
  String toString() {
    return 'SalePaymentModel(id: $id, saleId: $saleId, amount: $amount, paymentMethod: $paymentMethod, transactionReference: $transactionReference, notes: $notes, paymentDate: $paymentDate, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SalePaymentModelCopyWith<$Res>
    implements $SalePaymentModelCopyWith<$Res> {
  factory _$SalePaymentModelCopyWith(
          _SalePaymentModel value, $Res Function(_SalePaymentModel) _then) =
      __$SalePaymentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int saleId,
      double amount,
      String paymentMethod,
      String? transactionReference,
      String? notes,
      DateTime paymentDate,
      DateTime createdAt});
}

/// @nodoc
class __$SalePaymentModelCopyWithImpl<$Res>
    implements _$SalePaymentModelCopyWith<$Res> {
  __$SalePaymentModelCopyWithImpl(this._self, this._then);

  final _SalePaymentModel _self;
  final $Res Function(_SalePaymentModel) _then;

  /// Create a copy of SalePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? transactionReference = freezed,
    Object? notes = freezed,
    Object? paymentDate = null,
    Object? createdAt = null,
  }) {
    return _then(_SalePaymentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionReference: freezed == transactionReference
          ? _self.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
