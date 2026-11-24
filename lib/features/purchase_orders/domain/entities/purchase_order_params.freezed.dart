// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrderParams {
  int get supplierId;
  String get invoiceNumber;
  String? get supplierInvoiceNumber;
  DateTime get purchaseDate;
  DateTime? get expectedDeliveryDate;
  double get subtotal;
  double get discount;
  double get tax;
  double get shippingCost;
  double get additionalCost;
  double get paidAmount;
  PurchaseOrderStatus get status;
  PurchasePaymentMethod get paymentMethod;
  String? get notes;
  String? get internalNotes;

  /// Create a copy of PurchaseOrderParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseOrderParamsCopyWith<PurchaseOrderParams> get copyWith =>
      _$PurchaseOrderParamsCopyWithImpl<PurchaseOrderParams>(
          this as PurchaseOrderParams, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseOrderParams &&
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
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      supplierId,
      invoiceNumber,
      supplierInvoiceNumber,
      purchaseDate,
      expectedDeliveryDate,
      subtotal,
      discount,
      tax,
      shippingCost,
      additionalCost,
      paidAmount,
      status,
      paymentMethod,
      notes,
      internalNotes);

  @override
  String toString() {
    return 'PurchaseOrderParams(supplierId: $supplierId, invoiceNumber: $invoiceNumber, supplierInvoiceNumber: $supplierInvoiceNumber, purchaseDate: $purchaseDate, expectedDeliveryDate: $expectedDeliveryDate, subtotal: $subtotal, discount: $discount, tax: $tax, shippingCost: $shippingCost, additionalCost: $additionalCost, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes)';
  }
}

/// @nodoc
abstract mixin class $PurchaseOrderParamsCopyWith<$Res> {
  factory $PurchaseOrderParamsCopyWith(
          PurchaseOrderParams value, $Res Function(PurchaseOrderParams) _then) =
      _$PurchaseOrderParamsCopyWithImpl;
  @useResult
  $Res call(
      {int supplierId,
      String invoiceNumber,
      String? supplierInvoiceNumber,
      DateTime purchaseDate,
      DateTime? expectedDeliveryDate,
      double subtotal,
      double discount,
      double tax,
      double shippingCost,
      double additionalCost,
      double paidAmount,
      PurchaseOrderStatus status,
      PurchasePaymentMethod paymentMethod,
      String? notes,
      String? internalNotes});
}

/// @nodoc
class _$PurchaseOrderParamsCopyWithImpl<$Res>
    implements $PurchaseOrderParamsCopyWith<$Res> {
  _$PurchaseOrderParamsCopyWithImpl(this._self, this._then);

  final PurchaseOrderParams _self;
  final $Res Function(PurchaseOrderParams) _then;

  /// Create a copy of PurchaseOrderParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierId = null,
    Object? invoiceNumber = null,
    Object? supplierInvoiceNumber = freezed,
    Object? purchaseDate = null,
    Object? expectedDeliveryDate = freezed,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? shippingCost = null,
    Object? additionalCost = null,
    Object? paidAmount = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? internalNotes = freezed,
  }) {
    return _then(_self.copyWith(
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
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderStatus,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PurchasePaymentMethod,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _self.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseOrderParams].
extension PurchaseOrderParamsPatterns on PurchaseOrderParams {
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
    TResult Function(_PurchaseOrderParams value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams() when $default != null:
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
    TResult Function(_PurchaseOrderParams value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams():
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
    TResult? Function(_PurchaseOrderParams value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams() when $default != null:
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double paidAmount,
            PurchaseOrderStatus status,
            PurchasePaymentMethod paymentMethod,
            String? notes,
            String? internalNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams() when $default != null:
        return $default(
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.paidAmount,
            _that.status,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes);
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double paidAmount,
            PurchaseOrderStatus status,
            PurchasePaymentMethod paymentMethod,
            String? notes,
            String? internalNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams():
        return $default(
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.paidAmount,
            _that.status,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes);
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
            int supplierId,
            String invoiceNumber,
            String? supplierInvoiceNumber,
            DateTime purchaseDate,
            DateTime? expectedDeliveryDate,
            double subtotal,
            double discount,
            double tax,
            double shippingCost,
            double additionalCost,
            double paidAmount,
            PurchaseOrderStatus status,
            PurchasePaymentMethod paymentMethod,
            String? notes,
            String? internalNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderParams() when $default != null:
        return $default(
            _that.supplierId,
            _that.invoiceNumber,
            _that.supplierInvoiceNumber,
            _that.purchaseDate,
            _that.expectedDeliveryDate,
            _that.subtotal,
            _that.discount,
            _that.tax,
            _that.shippingCost,
            _that.additionalCost,
            _that.paidAmount,
            _that.status,
            _that.paymentMethod,
            _that.notes,
            _that.internalNotes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PurchaseOrderParams implements PurchaseOrderParams {
  const _PurchaseOrderParams(
      {required this.supplierId,
      required this.invoiceNumber,
      this.supplierInvoiceNumber,
      required this.purchaseDate,
      this.expectedDeliveryDate,
      this.subtotal = 0.0,
      this.discount = 0.0,
      this.tax = 0.0,
      this.shippingCost = 0.0,
      this.additionalCost = 0.0,
      this.paidAmount = 0.0,
      this.status = PurchaseOrderStatus.draft,
      this.paymentMethod = PurchasePaymentMethod.bankTransfer,
      this.notes,
      this.internalNotes});

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
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double shippingCost;
  @override
  @JsonKey()
  final double additionalCost;
  @override
  @JsonKey()
  final double paidAmount;
  @override
  @JsonKey()
  final PurchaseOrderStatus status;
  @override
  @JsonKey()
  final PurchasePaymentMethod paymentMethod;
  @override
  final String? notes;
  @override
  final String? internalNotes;

  /// Create a copy of PurchaseOrderParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseOrderParamsCopyWith<_PurchaseOrderParams> get copyWith =>
      __$PurchaseOrderParamsCopyWithImpl<_PurchaseOrderParams>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseOrderParams &&
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
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      supplierId,
      invoiceNumber,
      supplierInvoiceNumber,
      purchaseDate,
      expectedDeliveryDate,
      subtotal,
      discount,
      tax,
      shippingCost,
      additionalCost,
      paidAmount,
      status,
      paymentMethod,
      notes,
      internalNotes);

  @override
  String toString() {
    return 'PurchaseOrderParams(supplierId: $supplierId, invoiceNumber: $invoiceNumber, supplierInvoiceNumber: $supplierInvoiceNumber, purchaseDate: $purchaseDate, expectedDeliveryDate: $expectedDeliveryDate, subtotal: $subtotal, discount: $discount, tax: $tax, shippingCost: $shippingCost, additionalCost: $additionalCost, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, notes: $notes, internalNotes: $internalNotes)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseOrderParamsCopyWith<$Res>
    implements $PurchaseOrderParamsCopyWith<$Res> {
  factory _$PurchaseOrderParamsCopyWith(_PurchaseOrderParams value,
          $Res Function(_PurchaseOrderParams) _then) =
      __$PurchaseOrderParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int supplierId,
      String invoiceNumber,
      String? supplierInvoiceNumber,
      DateTime purchaseDate,
      DateTime? expectedDeliveryDate,
      double subtotal,
      double discount,
      double tax,
      double shippingCost,
      double additionalCost,
      double paidAmount,
      PurchaseOrderStatus status,
      PurchasePaymentMethod paymentMethod,
      String? notes,
      String? internalNotes});
}

/// @nodoc
class __$PurchaseOrderParamsCopyWithImpl<$Res>
    implements _$PurchaseOrderParamsCopyWith<$Res> {
  __$PurchaseOrderParamsCopyWithImpl(this._self, this._then);

  final _PurchaseOrderParams _self;
  final $Res Function(_PurchaseOrderParams) _then;

  /// Create a copy of PurchaseOrderParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? supplierId = null,
    Object? invoiceNumber = null,
    Object? supplierInvoiceNumber = freezed,
    Object? purchaseDate = null,
    Object? expectedDeliveryDate = freezed,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? shippingCost = null,
    Object? additionalCost = null,
    Object? paidAmount = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? internalNotes = freezed,
  }) {
    return _then(_PurchaseOrderParams(
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
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderStatus,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PurchasePaymentMethod,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      internalNotes: freezed == internalNotes
          ? _self.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
