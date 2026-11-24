// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleItemModel {
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

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaleItemModelCopyWith<SaleItemModel> get copyWith =>
      _$SaleItemModelCopyWithImpl<SaleItemModel>(
          this as SaleItemModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaleItemModel &&
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
    return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, costPrice: $costPrice, discountAmount: $discountAmount, taxRate: $taxRate, taxAmount: $taxAmount, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SaleItemModelCopyWith<$Res> {
  factory $SaleItemModelCopyWith(
          SaleItemModel value, $Res Function(SaleItemModel) _then) =
      _$SaleItemModelCopyWithImpl;
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
class _$SaleItemModelCopyWithImpl<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  _$SaleItemModelCopyWithImpl(this._self, this._then);

  final SaleItemModel _self;
  final $Res Function(SaleItemModel) _then;

  /// Create a copy of SaleItemModel
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

/// Adds pattern-matching-related methods to [SaleItemModel].
extension SaleItemModelPatterns on SaleItemModel {
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
    TResult Function(_SaleItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
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
    TResult Function(_SaleItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel():
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
    TResult? Function(_SaleItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaleItemModel() when $default != null:
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
      case _SaleItemModel() when $default != null:
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
      case _SaleItemModel():
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
      case _SaleItemModel() when $default != null:
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

class _SaleItemModel implements SaleItemModel {
  const _SaleItemModel(
      {required this.id,
      required this.saleId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      required this.conversionFactor,
      required this.baseQuantity,
      required this.unitPrice,
      required this.costPrice,
      required this.discountAmount,
      required this.taxRate,
      required this.taxAmount,
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
  final double conversionFactor;
  @override
  final double baseQuantity;
  @override
  final double unitPrice;
  @override
  final double costPrice;
  @override
  final double discountAmount;
  @override
  final double taxRate;
  @override
  final double taxAmount;
  @override
  final double totalAmount;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaleItemModelCopyWith<_SaleItemModel> get copyWith =>
      __$SaleItemModelCopyWithImpl<_SaleItemModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleItemModel &&
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
    return 'SaleItemModel(id: $id, saleId: $saleId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, costPrice: $costPrice, discountAmount: $discountAmount, taxRate: $taxRate, taxAmount: $taxAmount, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SaleItemModelCopyWith<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  factory _$SaleItemModelCopyWith(
          _SaleItemModel value, $Res Function(_SaleItemModel) _then) =
      __$SaleItemModelCopyWithImpl;
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
class __$SaleItemModelCopyWithImpl<$Res>
    implements _$SaleItemModelCopyWith<$Res> {
  __$SaleItemModelCopyWithImpl(this._self, this._then);

  final _SaleItemModel _self;
  final $Res Function(_SaleItemModel) _then;

  /// Create a copy of SaleItemModel
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
    return _then(_SaleItemModel(
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
