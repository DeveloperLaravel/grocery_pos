// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseReceiptItemModel {
  int get id;
  int get purchaseReceiptId;
  int get purchaseItemId;
  int get productId;
  int? get productUnitId;
  String get productName;
  String get unitName;
  double get quantity;
  double get conversionFactor;
  double get baseQuantity;
  double get unitPrice;
  double get baseUnitCost;
  double get total;

  /// Create a copy of PurchaseReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseReceiptItemModelCopyWith<PurchaseReceiptItemModel> get copyWith =>
      _$PurchaseReceiptItemModelCopyWithImpl<PurchaseReceiptItemModel>(
          this as PurchaseReceiptItemModel, _$identity);

  /// Serializes this PurchaseReceiptItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseReceiptItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseReceiptId, purchaseReceiptId) ||
                other.purchaseReceiptId == purchaseReceiptId) &&
            (identical(other.purchaseItemId, purchaseItemId) ||
                other.purchaseItemId == purchaseItemId) &&
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
            (identical(other.baseUnitCost, baseUnitCost) ||
                other.baseUnitCost == baseUnitCost) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseReceiptId,
      purchaseItemId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      baseUnitCost,
      total);

  @override
  String toString() {
    return 'PurchaseReceiptItemModel(id: $id, purchaseReceiptId: $purchaseReceiptId, purchaseItemId: $purchaseItemId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, baseUnitCost: $baseUnitCost, total: $total)';
  }
}

/// @nodoc
abstract mixin class $PurchaseReceiptItemModelCopyWith<$Res> {
  factory $PurchaseReceiptItemModelCopyWith(PurchaseReceiptItemModel value,
          $Res Function(PurchaseReceiptItemModel) _then) =
      _$PurchaseReceiptItemModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int purchaseReceiptId,
      int purchaseItemId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double baseUnitCost,
      double total});
}

/// @nodoc
class _$PurchaseReceiptItemModelCopyWithImpl<$Res>
    implements $PurchaseReceiptItemModelCopyWith<$Res> {
  _$PurchaseReceiptItemModelCopyWithImpl(this._self, this._then);

  final PurchaseReceiptItemModel _self;
  final $Res Function(PurchaseReceiptItemModel) _then;

  /// Create a copy of PurchaseReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseReceiptId = null,
    Object? purchaseItemId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? baseUnitCost = null,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseReceiptId: null == purchaseReceiptId
          ? _self.purchaseReceiptId
          : purchaseReceiptId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseItemId: null == purchaseItemId
          ? _self.purchaseItemId
          : purchaseItemId // ignore: cast_nullable_to_non_nullable
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
      baseUnitCost: null == baseUnitCost
          ? _self.baseUnitCost
          : baseUnitCost // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseReceiptItemModel].
extension PurchaseReceiptItemModelPatterns on PurchaseReceiptItemModel {
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
    TResult Function(_PurchaseReceiptItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel() when $default != null:
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
    TResult Function(_PurchaseReceiptItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel():
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
    TResult? Function(_PurchaseReceiptItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel() when $default != null:
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
            int purchaseReceiptId,
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseReceiptId,
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total);
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
            int purchaseReceiptId,
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel():
        return $default(
            _that.id,
            _that.purchaseReceiptId,
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total);
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
            int purchaseReceiptId,
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseReceiptId,
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseReceiptItemModel implements PurchaseReceiptItemModel {
  const _PurchaseReceiptItemModel(
      {required this.id,
      required this.purchaseReceiptId,
      required this.purchaseItemId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      required this.conversionFactor,
      required this.baseQuantity,
      required this.unitPrice,
      required this.baseUnitCost,
      required this.total});
  factory _PurchaseReceiptItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReceiptItemModelFromJson(json);

  @override
  final int id;
  @override
  final int purchaseReceiptId;
  @override
  final int purchaseItemId;
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
  final double baseUnitCost;
  @override
  final double total;

  /// Create a copy of PurchaseReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseReceiptItemModelCopyWith<_PurchaseReceiptItemModel> get copyWith =>
      __$PurchaseReceiptItemModelCopyWithImpl<_PurchaseReceiptItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseReceiptItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseReceiptItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseReceiptId, purchaseReceiptId) ||
                other.purchaseReceiptId == purchaseReceiptId) &&
            (identical(other.purchaseItemId, purchaseItemId) ||
                other.purchaseItemId == purchaseItemId) &&
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
            (identical(other.baseUnitCost, baseUnitCost) ||
                other.baseUnitCost == baseUnitCost) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseReceiptId,
      purchaseItemId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      baseUnitCost,
      total);

  @override
  String toString() {
    return 'PurchaseReceiptItemModel(id: $id, purchaseReceiptId: $purchaseReceiptId, purchaseItemId: $purchaseItemId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, baseUnitCost: $baseUnitCost, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseReceiptItemModelCopyWith<$Res>
    implements $PurchaseReceiptItemModelCopyWith<$Res> {
  factory _$PurchaseReceiptItemModelCopyWith(_PurchaseReceiptItemModel value,
          $Res Function(_PurchaseReceiptItemModel) _then) =
      __$PurchaseReceiptItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int purchaseReceiptId,
      int purchaseItemId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double baseUnitCost,
      double total});
}

/// @nodoc
class __$PurchaseReceiptItemModelCopyWithImpl<$Res>
    implements _$PurchaseReceiptItemModelCopyWith<$Res> {
  __$PurchaseReceiptItemModelCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptItemModel _self;
  final $Res Function(_PurchaseReceiptItemModel) _then;

  /// Create a copy of PurchaseReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? purchaseReceiptId = null,
    Object? purchaseItemId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? baseUnitCost = null,
    Object? total = null,
  }) {
    return _then(_PurchaseReceiptItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseReceiptId: null == purchaseReceiptId
          ? _self.purchaseReceiptId
          : purchaseReceiptId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseItemId: null == purchaseItemId
          ? _self.purchaseItemId
          : purchaseItemId // ignore: cast_nullable_to_non_nullable
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
      baseUnitCost: null == baseUnitCost
          ? _self.baseUnitCost
          : baseUnitCost // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
