// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleItem {
  int get id;
  int get saleId;
  int get productId;
  int? get productUnitId;
  String get productName;
  String get unitName;
  double get quantity;
  double get conversionFactor;
  double get baseQuantity;
  double get unitPrice;
  double get costPrice;
  double get discountAmount;
  double get taxRate;
  double get taxAmount;
  double get totalAmount;
  String? get notes;
  DateTime get createdAt;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleItemCopyWith<SaleItem> get copyWith =>
      _$SaleItemCopyWithImpl<SaleItem>(this as SaleItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.conversionFactor, conversionFactor) ||
                other.conversionFactor == conversionFactor) &&
            (identical(other.baseQuantity, baseQuantity) ||
                other.baseQuantity == baseQuantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      saleId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      costPrice,
      discountAmount,
      taxRate,
      taxAmount,
      totalAmount,
      notes,
      createdAt);

  @override
  String toString() {
    return 'SaleItem(id: $id, saleId: $saleId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, costPrice: $costPrice, discountAmount: $discountAmount, taxRate: $taxRate, taxAmount: $taxAmount, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SaleItemCopyWith<$Res> {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) _then) =
      _$SaleItemCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int saleId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double costPrice,
      double discountAmount,
      double taxRate,
      double taxAmount,
      double totalAmount,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class _$SaleItemCopyWithImpl<$Res> implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._self, this._then);

  final SaleItem _self;
  final $Res Function(SaleItem) _then;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? costPrice = null,
    Object? discountAmount = null,
    Object? taxRate = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? notes = freezed,
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
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      conversionFactor: null == conversionFactor
          ? _self.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double,
      baseQuantity: null == baseQuantity
          ? _self.baseQuantity
          : baseQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _self.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
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

/// Adds pattern-matching-related methods to [SaleItem].
extension SaleItemPatterns on SaleItem {
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
    TResult Function(_SaleItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleItem() when $default != null:
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
    TResult Function(_SaleItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItem():
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
    TResult? Function(_SaleItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItem() when $default != null:
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
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double costPrice,
            double discountAmount,
            double taxRate,
            double taxAmount,
            double totalAmount,
            String? notes,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleItem() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.costPrice,
            _that.discountAmount,
            _that.taxRate,
            _that.taxAmount,
            _that.totalAmount,
            _that.notes,
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
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double costPrice,
            double discountAmount,
            double taxRate,
            double taxAmount,
            double totalAmount,
            String? notes,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItem():
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.costPrice,
            _that.discountAmount,
            _that.taxRate,
            _that.taxAmount,
            _that.totalAmount,
            _that.notes,
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
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double costPrice,
            double discountAmount,
            double taxRate,
            double taxAmount,
            double totalAmount,
            String? notes,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItem() when $default != null:
        return $default(
            _that.id,
            _that.saleId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.costPrice,
            _that.discountAmount,
            _that.taxRate,
            _that.taxAmount,
            _that.totalAmount,
            _that.notes,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SaleItem implements SaleItem {
  const _SaleItem(
      {required this.id,
      required this.saleId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      this.conversionFactor = 1,
      required this.baseQuantity,
      required this.unitPrice,
      this.costPrice = 0,
      this.discountAmount = 0,
      this.taxRate = 0,
      this.taxAmount = 0,
      required this.totalAmount,
      this.notes,
      required this.createdAt});

  @override
  final int id;
  @override
  final int saleId;
  @override
  final int productId;
  @override
  final int? productUnitId;
  @override
  final String productName;
  @override
  final String unitName;
  @override
  final double quantity;
  @override
  @JsonKey()
  final double conversionFactor;
  @override
  final double baseQuantity;
  @override
  final double unitPrice;
  @override
  @JsonKey()
  final double costPrice;
  @override
  @JsonKey()
  final double discountAmount;
  @override
  @JsonKey()
  final double taxRate;
  @override
  @JsonKey()
  final double taxAmount;
  @override
  final double totalAmount;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleItemCopyWith<_SaleItem> get copyWith =>
      __$SaleItemCopyWithImpl<_SaleItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.conversionFactor, conversionFactor) ||
                other.conversionFactor == conversionFactor) &&
            (identical(other.baseQuantity, baseQuantity) ||
                other.baseQuantity == baseQuantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      saleId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      costPrice,
      discountAmount,
      taxRate,
      taxAmount,
      totalAmount,
      notes,
      createdAt);

  @override
  String toString() {
    return 'SaleItem(id: $id, saleId: $saleId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, costPrice: $costPrice, discountAmount: $discountAmount, taxRate: $taxRate, taxAmount: $taxAmount, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SaleItemCopyWith<$Res>
    implements $SaleItemCopyWith<$Res> {
  factory _$SaleItemCopyWith(_SaleItem value, $Res Function(_SaleItem) _then) =
      __$SaleItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int saleId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double costPrice,
      double discountAmount,
      double taxRate,
      double taxAmount,
      double totalAmount,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class __$SaleItemCopyWithImpl<$Res> implements _$SaleItemCopyWith<$Res> {
  __$SaleItemCopyWithImpl(this._self, this._then);

  final _SaleItem _self;
  final $Res Function(_SaleItem) _then;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? saleId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? costPrice = null,
    Object? discountAmount = null,
    Object? taxRate = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_SaleItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _self.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      conversionFactor: null == conversionFactor
          ? _self.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double,
      baseQuantity: null == baseQuantity
          ? _self.baseQuantity
          : baseQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _self.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
