// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrderModel {
  int get id;
  int get supplierId;
  String get invoiceNumber;
  String? get supplierInvoiceNumber;
  DateTime get purchaseDate;
  DateTime? get expectedDeliveryDate;
  DateTime? get completedAt;
  double get subtotal;
  double get discount;
  double get tax;
  double get shippingCost;
  double get additionalCost;
  double get total;
  double get paidAmount;
  double get remainingAmount;
  String get status;
  String get paymentStatus;
  String get paymentMethod;
  String? get notes;
  String? get internalNotes;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of PurchaseOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseOrderModelCopyWith<PurchaseOrderModel> get copyWith =>
      _$PurchaseOrderModelCopyWithImpl<PurchaseOrderModel>(
          this as PurchaseOrderModel, _$identity);

  /// Serializes this PurchaseOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseOrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.supplierInvoiceNumber, supplierInvoiceNumber) ||
                other.supplierInvoiceNumber == supplierInvoiceNumber) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expectedDeliveryDate, expectedDeliveryDate) ||
                other.expectedDeliveryDate == expectedDeliveryDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        supplierId,
        invoiceNumber,
        supplierInvoiceNumber,
        purchaseDate,
        expectedDeliveryDate,
        completedAt,
        subtotal,
        discount,
        tax,
        shippingCost,
        additionalCost,
        total,
        paidAmount,
        remainingAmount,
        status,
        paymentStatus,
        paymentMethod,
        notes,
        internalNotes,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'PurchaseOrderModel(id: $id, supplierId: $supplierId, invoiceNumber: $invoiceNumber, supplierInvoiceNumber: $supplierInvoiceNumber, purchaseDate: $purchaseDate, expectedDeliveryDate: $expectedDeliveryDate, completedAt: $completedAt, subtotal: $subtotal, discount: $discount, tax: $tax, shippingCost: $shippingCost, additionalCost: $additionalCost, total: $total, paidAmount: $paidAmount, remainingAmount: $remainingAmount, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PurchaseOrderModelCopyWith<$Res> {
  factory $PurchaseOrderModelCopyWith(
          PurchaseOrderModel value, $Res Function(PurchaseOrderModel) _then) =
      _$PurchaseOrderModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int supplierId,
      String invoiceNumber,
      String? supplierInvoiceNumber,
      DateTime purchaseDate,
      DateTime? expectedDeliveryDate,
      DateTime? completedAt,
      double subtotal,
      double discount,
      double tax,
      double shippingCost,
      double additionalCost,
      double total,
      double paidAmount,
      double remainingAmount,
      String status,
      String paymentStatus,
      String paymentMethod,
      String? notes,
      String? internalNotes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PurchaseOrderModelCopyWithImpl<$Res>
    implements $PurchaseOrderModelCopyWith<$Res> {
  _$PurchaseOrderModelCopyWithImpl(this._self, this._then);

  final PurchaseOrderModel _self;
  final $Res Function(PurchaseOrderModel) _then;

  /// Create a copy of PurchaseOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? supplierId = null,
    Object? invoiceNumber = null,
    Object? supplierInvoiceNumber = freezed,
    Object? purchaseDate = null,
    Object? expectedDeliveryDate = freezed,
    Object? completedAt = freezed,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? shippingCost = null,
    Object? additionalCost = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      supplierId: null == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierInvoiceNumber: freezed == supplierInvoiceNumber
          ? _self.supplierInvoiceNumber
          : supplierInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: null == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryDate: freezed == expectedDeliveryDate
          ? _self.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCost: null == additionalCost
          ? _self.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _self.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [PurchaseOrderModel].
extension PurchaseOrderModelPatterns on PurchaseOrderModel {
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
    TResult Function(_PurchaseOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel() when $default != null:
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
    TResult Function(_PurchaseOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel():
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
    TResult? Function(_PurchaseOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel() when $default != null:
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            DateTime? completedAt,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double total,
            double paidAmount,
            double remainingAmount,
            String status,
            String paymentStatus,
            String paymentMethod,
            String? notes,
            String? internalNotes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.completedAt,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.total,
            _that.paidAmount,
            _that.remainingAmount,
            _that.status,
            _that.paymentStatus,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes,
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            DateTime? completedAt,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double total,
            double paidAmount,
            double remainingAmount,
            String status,
            String paymentStatus,
            String paymentMethod,
            String? notes,
            String? internalNotes,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel():
        return $default(
            _that.id,
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.completedAt,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.total,
            _that.paidAmount,
            _that.remainingAmount,
            _that.status,
            _that.paymentStatus,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes,
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            DateTime? completedAt,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double total,
            double paidAmount,
            double remainingAmount,
            String status,
            String paymentStatus,
            String paymentMethod,
            String? notes,
            String? internalNotes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.completedAt,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.total,
            _that.paidAmount,
            _that.remainingAmount,
            _that.status,
            _that.paymentStatus,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseOrderModel extends PurchaseOrderModel {
  const _PurchaseOrderModel(
      {required this.id,
      required this.supplierId,
      required this.invoiceNumber,
      this.supplierInvoiceNumber,
      required this.purchaseDate,
      this.expectedDeliveryDate,
      this.completedAt,
      required this.subtotal,
      required this.discount,
      required this.tax,
      required this.shippingCost,
      required this.additionalCost,
      required this.total,
      required this.paidAmount,
      required this.remainingAmount,
      this.status = 'draft',
      this.paymentStatus = 'unpaid',
      this.paymentMethod = 'bank_transfer',
      this.notes,
      this.internalNotes,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  factory _PurchaseOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderModelFromJson(json);

  @override
  final int id;
  @override
  final int supplierId;
  @override
  final String invoiceNumber;
  @override
  final String? supplierInvoiceNumber;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime? expectedDeliveryDate;
  @override
  final DateTime? completedAt;
  @override
  final double subtotal;
  @override
  final double discount;
  @override
  final double tax;
  @override
  final double shippingCost;
  @override
  final double additionalCost;
  @override
  final double total;
  @override
  final double paidAmount;
  @override
  final double remainingAmount;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String paymentStatus;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  final String? notes;
  @override
  final String? internalNotes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of PurchaseOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseOrderModelCopyWith<_PurchaseOrderModel> get copyWith =>
      __$PurchaseOrderModelCopyWithImpl<_PurchaseOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseOrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.supplierInvoiceNumber, supplierInvoiceNumber) ||
                other.supplierInvoiceNumber == supplierInvoiceNumber) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expectedDeliveryDate, expectedDeliveryDate) ||
                other.expectedDeliveryDate == expectedDeliveryDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        supplierId,
        invoiceNumber,
        supplierInvoiceNumber,
        purchaseDate,
        expectedDeliveryDate,
        completedAt,
        subtotal,
        discount,
        tax,
        shippingCost,
        additionalCost,
        total,
        paidAmount,
        remainingAmount,
        status,
        paymentStatus,
        paymentMethod,
        notes,
        internalNotes,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'PurchaseOrderModel(id: $id, supplierId: $supplierId, invoiceNumber: $invoiceNumber, supplierInvoiceNumber: $supplierInvoiceNumber, purchaseDate: $purchaseDate, expectedDeliveryDate: $expectedDeliveryDate, completedAt: $completedAt, subtotal: $subtotal, discount: $discount, tax: $tax, shippingCost: $shippingCost, additionalCost: $additionalCost, total: $total, paidAmount: $paidAmount, remainingAmount: $remainingAmount, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseOrderModelCopyWith<$Res>
    implements $PurchaseOrderModelCopyWith<$Res> {
  factory _$PurchaseOrderModelCopyWith(
          _PurchaseOrderModel value, $Res Function(_PurchaseOrderModel) _then) =
      __$PurchaseOrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int supplierId,
      String invoiceNumber,
      String? supplierInvoiceNumber,
      DateTime purchaseDate,
      DateTime? expectedDeliveryDate,
      DateTime? completedAt,
      double subtotal,
      double discount,
      double tax,
      double shippingCost,
      double additionalCost,
      double total,
      double paidAmount,
      double remainingAmount,
      String status,
      String paymentStatus,
      String paymentMethod,
      String? notes,
      String? internalNotes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$PurchaseOrderModelCopyWithImpl<$Res>
    implements _$PurchaseOrderModelCopyWith<$Res> {
  __$PurchaseOrderModelCopyWithImpl(this._self, this._then);

  final _PurchaseOrderModel _self;
  final $Res Function(_PurchaseOrderModel) _then;

  /// Create a copy of PurchaseOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? supplierId = null,
    Object? invoiceNumber = null,
    Object? supplierInvoiceNumber = freezed,
    Object? purchaseDate = null,
    Object? expectedDeliveryDate = freezed,
    Object? completedAt = freezed,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? shippingCost = null,
    Object? additionalCost = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? internalNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_PurchaseOrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      supplierId: null == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierInvoiceNumber: freezed == supplierInvoiceNumber
          ? _self.supplierInvoiceNumber
          : supplierInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: null == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryDate: freezed == expectedDeliveryDate
          ? _self.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCost: null == additionalCost
          ? _self.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _self.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
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
