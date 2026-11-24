// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierProductModel {
  int? get id;
  int get supplierId;
  int get productId;
  int? get productUnitId;
  String? get supplierProductCode;
  String? get supplierBarcode;
  double get purchasePrice;
  double get minimumOrderQuantity;
  double get maximumOrderQuantity;
  int get deliveryDays;
  bool get isPreferred;
  bool get isActive;
  DateTime? get lastPurchaseAt;
  double get lastPurchasedPrice;
  String? get notes;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of SupplierProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierProductModelCopyWith<SupplierProductModel> get copyWith =>
      _$SupplierProductModelCopyWithImpl<SupplierProductModel>(
          this as SupplierProductModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.supplierProductCode, supplierProductCode) ||
                other.supplierProductCode == supplierProductCode) &&
            (identical(other.supplierBarcode, supplierBarcode) ||
                other.supplierBarcode == supplierBarcode) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.minimumOrderQuantity, minimumOrderQuantity) ||
                other.minimumOrderQuantity == minimumOrderQuantity) &&
            (identical(other.maximumOrderQuantity, maximumOrderQuantity) ||
                other.maximumOrderQuantity == maximumOrderQuantity) &&
            (identical(other.deliveryDays, deliveryDays) ||
                other.deliveryDays == deliveryDays) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.lastPurchasedPrice, lastPurchasedPrice) ||
                other.lastPurchasedPrice == lastPurchasedPrice) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      supplierId,
      productId,
      productUnitId,
      supplierProductCode,
      supplierBarcode,
      purchasePrice,
      minimumOrderQuantity,
      maximumOrderQuantity,
      deliveryDays,
      isPreferred,
      isActive,
      lastPurchaseAt,
      lastPurchasedPrice,
      notes,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SupplierProductModel(id: $id, supplierId: $supplierId, productId: $productId, productUnitId: $productUnitId, supplierProductCode: $supplierProductCode, supplierBarcode: $supplierBarcode, purchasePrice: $purchasePrice, minimumOrderQuantity: $minimumOrderQuantity, maximumOrderQuantity: $maximumOrderQuantity, deliveryDays: $deliveryDays, isPreferred: $isPreferred, isActive: $isActive, lastPurchaseAt: $lastPurchaseAt, lastPurchasedPrice: $lastPurchasedPrice, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SupplierProductModelCopyWith<$Res> {
  factory $SupplierProductModelCopyWith(SupplierProductModel value,
          $Res Function(SupplierProductModel) _then) =
      _$SupplierProductModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      int supplierId,
      int productId,
      int? productUnitId,
      String? supplierProductCode,
      String? supplierBarcode,
      double purchasePrice,
      double minimumOrderQuantity,
      double maximumOrderQuantity,
      int deliveryDays,
      bool isPreferred,
      bool isActive,
      DateTime? lastPurchaseAt,
      double lastPurchasedPrice,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$SupplierProductModelCopyWithImpl<$Res>
    implements $SupplierProductModelCopyWith<$Res> {
  _$SupplierProductModelCopyWithImpl(this._self, this._then);

  final SupplierProductModel _self;
  final $Res Function(SupplierProductModel) _then;

  /// Create a copy of SupplierProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? supplierId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? supplierProductCode = freezed,
    Object? supplierBarcode = freezed,
    Object? purchasePrice = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = null,
    Object? deliveryDays = null,
    Object? isPreferred = null,
    Object? isActive = null,
    Object? lastPurchaseAt = freezed,
    Object? lastPurchasedPrice = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: null == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierProductCode: freezed == supplierProductCode
          ? _self.supplierProductCode
          : supplierProductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierBarcode: freezed == supplierBarcode
          ? _self.supplierBarcode
          : supplierBarcode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrderQuantity: null == minimumOrderQuantity
          ? _self.minimumOrderQuantity
          : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumOrderQuantity: null == maximumOrderQuantity
          ? _self.maximumOrderQuantity
          : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDays: null == deliveryDays
          ? _self.deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      isPreferred: null == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPurchasedPrice: null == lastPurchasedPrice
          ? _self.lastPurchasedPrice
          : lastPurchasedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SupplierProductModel].
extension SupplierProductModelPatterns on SupplierProductModel {
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
    TResult Function(_SupplierProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel() when $default != null:
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
    TResult Function(_SupplierProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel():
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
    TResult? Function(_SupplierProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel() when $default != null:
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
            int? id,
            int supplierId,
            int productId,
            int? productUnitId,
            String? supplierProductCode,
            String? supplierBarcode,
            double purchasePrice,
            double minimumOrderQuantity,
            double maximumOrderQuantity,
            int deliveryDays,
            bool isPreferred,
            bool isActive,
            DateTime? lastPurchaseAt,
            double lastPurchasedPrice,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel() when $default != null:
        return $default(
            _that.id,
            _that.supplierId,
            _that.productId,
            _that.productUnitId,
            _that.supplierProductCode,
            _that.supplierBarcode,
            _that.purchasePrice,
            _that.minimumOrderQuantity,
            _that.maximumOrderQuantity,
            _that.deliveryDays,
            _that.isPreferred,
            _that.isActive,
            _that.lastPurchaseAt,
            _that.lastPurchasedPrice,
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
            int? id,
            int supplierId,
            int productId,
            int? productUnitId,
            String? supplierProductCode,
            String? supplierBarcode,
            double purchasePrice,
            double minimumOrderQuantity,
            double maximumOrderQuantity,
            int deliveryDays,
            bool isPreferred,
            bool isActive,
            DateTime? lastPurchaseAt,
            double lastPurchasedPrice,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel():
        return $default(
            _that.id,
            _that.supplierId,
            _that.productId,
            _that.productUnitId,
            _that.supplierProductCode,
            _that.supplierBarcode,
            _that.purchasePrice,
            _that.minimumOrderQuantity,
            _that.maximumOrderQuantity,
            _that.deliveryDays,
            _that.isPreferred,
            _that.isActive,
            _that.lastPurchaseAt,
            _that.lastPurchasedPrice,
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
            int? id,
            int supplierId,
            int productId,
            int? productUnitId,
            String? supplierProductCode,
            String? supplierBarcode,
            double purchasePrice,
            double minimumOrderQuantity,
            double maximumOrderQuantity,
            int deliveryDays,
            bool isPreferred,
            bool isActive,
            DateTime? lastPurchaseAt,
            double lastPurchasedPrice,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierProductModel() when $default != null:
        return $default(
            _that.id,
            _that.supplierId,
            _that.productId,
            _that.productUnitId,
            _that.supplierProductCode,
            _that.supplierBarcode,
            _that.purchasePrice,
            _that.minimumOrderQuantity,
            _that.maximumOrderQuantity,
            _that.deliveryDays,
            _that.isPreferred,
            _that.isActive,
            _that.lastPurchaseAt,
            _that.lastPurchasedPrice,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SupplierProductModel implements SupplierProductModel {
  const _SupplierProductModel(
      {this.id,
      required this.supplierId,
      required this.productId,
      this.productUnitId,
      this.supplierProductCode,
      this.supplierBarcode,
      this.purchasePrice = 0.0,
      this.minimumOrderQuantity = 1.0,
      this.maximumOrderQuantity = 0.0,
      this.deliveryDays = 0,
      this.isPreferred = false,
      this.isActive = true,
      this.lastPurchaseAt,
      this.lastPurchasedPrice = 0.0,
      this.notes,
      this.createdAt,
      this.updatedAt});

  @override
  final int? id;
  @override
  final int supplierId;
  @override
  final int productId;
  @override
  final int? productUnitId;
  @override
  final String? supplierProductCode;
  @override
  final String? supplierBarcode;
  @override
  @JsonKey()
  final double purchasePrice;
  @override
  @JsonKey()
  final double minimumOrderQuantity;
  @override
  @JsonKey()
  final double maximumOrderQuantity;
  @override
  @JsonKey()
  final int deliveryDays;
  @override
  @JsonKey()
  final bool isPreferred;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? lastPurchaseAt;
  @override
  @JsonKey()
  final double lastPurchasedPrice;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of SupplierProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierProductModelCopyWith<_SupplierProductModel> get copyWith =>
      __$SupplierProductModelCopyWithImpl<_SupplierProductModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SupplierProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.supplierProductCode, supplierProductCode) ||
                other.supplierProductCode == supplierProductCode) &&
            (identical(other.supplierBarcode, supplierBarcode) ||
                other.supplierBarcode == supplierBarcode) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.minimumOrderQuantity, minimumOrderQuantity) ||
                other.minimumOrderQuantity == minimumOrderQuantity) &&
            (identical(other.maximumOrderQuantity, maximumOrderQuantity) ||
                other.maximumOrderQuantity == maximumOrderQuantity) &&
            (identical(other.deliveryDays, deliveryDays) ||
                other.deliveryDays == deliveryDays) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.lastPurchasedPrice, lastPurchasedPrice) ||
                other.lastPurchasedPrice == lastPurchasedPrice) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      supplierId,
      productId,
      productUnitId,
      supplierProductCode,
      supplierBarcode,
      purchasePrice,
      minimumOrderQuantity,
      maximumOrderQuantity,
      deliveryDays,
      isPreferred,
      isActive,
      lastPurchaseAt,
      lastPurchasedPrice,
      notes,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'SupplierProductModel(id: $id, supplierId: $supplierId, productId: $productId, productUnitId: $productUnitId, supplierProductCode: $supplierProductCode, supplierBarcode: $supplierBarcode, purchasePrice: $purchasePrice, minimumOrderQuantity: $minimumOrderQuantity, maximumOrderQuantity: $maximumOrderQuantity, deliveryDays: $deliveryDays, isPreferred: $isPreferred, isActive: $isActive, lastPurchaseAt: $lastPurchaseAt, lastPurchasedPrice: $lastPurchasedPrice, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SupplierProductModelCopyWith<$Res>
    implements $SupplierProductModelCopyWith<$Res> {
  factory _$SupplierProductModelCopyWith(_SupplierProductModel value,
          $Res Function(_SupplierProductModel) _then) =
      __$SupplierProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      int supplierId,
      int productId,
      int? productUnitId,
      String? supplierProductCode,
      String? supplierBarcode,
      double purchasePrice,
      double minimumOrderQuantity,
      double maximumOrderQuantity,
      int deliveryDays,
      bool isPreferred,
      bool isActive,
      DateTime? lastPurchaseAt,
      double lastPurchasedPrice,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$SupplierProductModelCopyWithImpl<$Res>
    implements _$SupplierProductModelCopyWith<$Res> {
  __$SupplierProductModelCopyWithImpl(this._self, this._then);

  final _SupplierProductModel _self;
  final $Res Function(_SupplierProductModel) _then;

  /// Create a copy of SupplierProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? supplierId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? supplierProductCode = freezed,
    Object? supplierBarcode = freezed,
    Object? purchasePrice = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = null,
    Object? deliveryDays = null,
    Object? isPreferred = null,
    Object? isActive = null,
    Object? lastPurchaseAt = freezed,
    Object? lastPurchasedPrice = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_SupplierProductModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: null == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierProductCode: freezed == supplierProductCode
          ? _self.supplierProductCode
          : supplierProductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierBarcode: freezed == supplierBarcode
          ? _self.supplierBarcode
          : supplierBarcode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrderQuantity: null == minimumOrderQuantity
          ? _self.minimumOrderQuantity
          : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumOrderQuantity: null == maximumOrderQuantity
          ? _self.maximumOrderQuantity
          : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDays: null == deliveryDays
          ? _self.deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      isPreferred: null == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPurchasedPrice: null == lastPurchasedPrice
          ? _self.lastPurchasedPrice
          : lastPurchasedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
