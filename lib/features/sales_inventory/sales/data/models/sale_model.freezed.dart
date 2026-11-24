// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleModel {
  int get id;
  String get invoiceNumber;
  int? get customerId;
  double get subtotal;
  double get discountAmount;
  double get taxAmount;
  double get totalAmount;
  double get paidAmount;
  double get remainingAmount;
  String get saleType;
  String get paymentMethod;
  String get paymentStatus;
  String get status;
  String? get notes;
  int? get createdBy;
  DateTime get saleDate;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleModelCopyWith<SaleModel> get copyWith =>
      _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNumber,
      customerId,
      subtotal,
      discountAmount,
      taxAmount,
      totalAmount,
      paidAmount,
      remainingAmount,
      saleType,
      paymentMethod,
      paymentStatus,
      status,
      notes,
      createdBy,
      saleDate,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, subtotal: $subtotal, discountAmount: $discountAmount, taxAmount: $taxAmount, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, saleType: $saleType, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, status: $status, notes: $notes, createdBy: $createdBy, saleDate: $saleDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) =
      _$SaleModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      int? customerId,
      double subtotal,
      double discountAmount,
      double taxAmount,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String saleType,
      String paymentMethod,
      String paymentStatus,
      String status,
      String? notes,
      int? createdBy,
      DateTime saleDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res> implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? customerId = freezed,
    Object? subtotal = null,
    Object? discountAmount = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? saleType = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = freezed,
    Object? saleDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: freezed == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      saleType: null == saleType
          ? _self.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      saleDate: null == saleDate
          ? _self.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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
    TResult Function(_SaleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
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
    TResult Function(_SaleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel():
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
    TResult? Function(_SaleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
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
            String invoiceNumber,
            int? customerId,
            double subtotal,
            double discountAmount,
            double taxAmount,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String saleType,
            String paymentMethod,
            String paymentStatus,
            String status,
            String? notes,
            int? createdBy,
            DateTime saleDate,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.customerId,
            _that.subtotal,
            _that.discountAmount,
            _that.taxAmount,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.saleType,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.status,
            _that.notes,
            _that.createdBy,
            _that.saleDate,
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
            String invoiceNumber,
            int? customerId,
            double subtotal,
            double discountAmount,
            double taxAmount,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String saleType,
            String paymentMethod,
            String paymentStatus,
            String status,
            String? notes,
            int? createdBy,
            DateTime saleDate,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel():
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.customerId,
            _that.subtotal,
            _that.discountAmount,
            _that.taxAmount,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.saleType,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.status,
            _that.notes,
            _that.createdBy,
            _that.saleDate,
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
            String invoiceNumber,
            int? customerId,
            double subtotal,
            double discountAmount,
            double taxAmount,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String saleType,
            String paymentMethod,
            String paymentStatus,
            String status,
            String? notes,
            int? createdBy,
            DateTime saleDate,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleModel() when $default != null:
        return $default(
            _that.id,
            _that.invoiceNumber,
            _that.customerId,
            _that.subtotal,
            _that.discountAmount,
            _that.taxAmount,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.saleType,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.status,
            _that.notes,
            _that.createdBy,
            _that.saleDate,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SaleModel implements SaleModel {
  const _SaleModel(
      {required this.id,
      required this.invoiceNumber,
      this.customerId,
      required this.subtotal,
      required this.discountAmount,
      required this.taxAmount,
      required this.totalAmount,
      required this.paidAmount,
      required this.remainingAmount,
      required this.saleType,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.status,
      this.notes,
      this.createdBy,
      required this.saleDate,
      required this.createdAt,
      required this.updatedAt});

  @override
  final int id;
  @override
  final String invoiceNumber;
  @override
  final int? customerId;
  @override
  final double subtotal;
  @override
  final double discountAmount;
  @override
  final double taxAmount;
  @override
  final double totalAmount;
  @override
  final double paidAmount;
  @override
  final double remainingAmount;
  @override
  final String saleType;
  @override
  final String paymentMethod;
  @override
  final String paymentStatus;
  @override
  final String status;
  @override
  final String? notes;
  @override
  final int? createdBy;
  @override
  final DateTime saleDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleModelCopyWith<_SaleModel> get copyWith =>
      __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNumber,
      customerId,
      subtotal,
      discountAmount,
      taxAmount,
      totalAmount,
      paidAmount,
      remainingAmount,
      saleType,
      paymentMethod,
      paymentStatus,
      status,
      notes,
      createdBy,
      saleDate,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, subtotal: $subtotal, discountAmount: $discountAmount, taxAmount: $taxAmount, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, saleType: $saleType, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, status: $status, notes: $notes, createdBy: $createdBy, saleDate: $saleDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res>
    implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(
          _SaleModel value, $Res Function(_SaleModel) _then) =
      __$SaleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      int? customerId,
      double subtotal,
      double discountAmount,
      double taxAmount,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String saleType,
      String paymentMethod,
      String paymentStatus,
      String status,
      String? notes,
      int? createdBy,
      DateTime saleDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$SaleModelCopyWithImpl<$Res> implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? customerId = freezed,
    Object? subtotal = null,
    Object? discountAmount = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? saleType = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = freezed,
    Object? saleDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_SaleModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: freezed == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      saleType: null == saleType
          ? _self.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      saleDate: null == saleDate
          ? _self.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
