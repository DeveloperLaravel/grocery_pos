// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseItemModel {
  int get id;
  int get purchaseOrderId;
  int get productId;
  int? get productUnitId;
  String get productName;
  String? get unitName;
  double get quantity;
  double get conversionFactor;
  double get baseQuantity;
  double get unitPrice;
  double get baseUnitCost;
  double get total;
  String? get notes;

  /// Create a copy of PurchaseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseItemModelCopyWith<PurchaseItemModel> get copyWith =>
      _$PurchaseItemModelCopyWithImpl<PurchaseItemModel>(
          this as PurchaseItemModel, _$identity);

  /// Serializes this PurchaseItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
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
            (identical(other.total, total) || other.total == total) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseOrderId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      baseUnitCost,
      total,
      notes);

  @override
  String toString() {
    return 'PurchaseItemModel(id: $id, purchaseOrderId: $purchaseOrderId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, baseUnitCost: $baseUnitCost, total: $total, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $PurchaseItemModelCopyWith<$Res> {
  factory $PurchaseItemModelCopyWith(
          PurchaseItemModel value, $Res Function(PurchaseItemModel) _then) =
      _$PurchaseItemModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      int productId,
      int? productUnitId,
      String productName,
      String? unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double baseUnitCost,
      double total,
      String? notes});
}

/// @nodoc
class _$PurchaseItemModelCopyWithImpl<$Res>
    implements $PurchaseItemModelCopyWith<$Res> {
  _$PurchaseItemModelCopyWithImpl(this._self, this._then);

  final PurchaseItemModel _self;
  final $Res Function(PurchaseItemModel) _then;

  /// Create a copy of PurchaseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = freezed,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? baseUnitCost = null,
    Object? total = null,
    Object? notes = freezed,
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
      unitName: freezed == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseItemModel].
extension PurchaseItemModelPatterns on PurchaseItemModel {
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
    TResult Function(_PurchaseItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel() when $default != null:
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
    TResult Function(_PurchaseItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel():
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
    TResult? Function(_PurchaseItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel() when $default != null:
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
            int productId,
            int? productUnitId,
            String productName,
            String? unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total,
            _that.notes);
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
            int productId,
            int? productUnitId,
            String productName,
            String? unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel():
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total,
            _that.notes);
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
            int productId,
            int? productUnitId,
            String productName,
            String? unitName,
            double quantity,
            double conversionFactor,
            double baseQuantity,
            double unitPrice,
            double baseUnitCost,
            double total,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseItemModel() when $default != null:
        return $default(
            _that.id,
            _that.purchaseOrderId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.baseQuantity,
            _that.unitPrice,
            _that.baseUnitCost,
            _that.total,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseItemModel extends PurchaseItemModel {
  const _PurchaseItemModel(
      {required this.id,
      required this.purchaseOrderId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      this.unitName,
      this.quantity = 0.0,
      this.conversionFactor = 1.0,
      this.baseQuantity = 0.0,
      this.unitPrice = 0.0,
      this.baseUnitCost = 0.0,
      this.total = 0.0,
      this.notes})
      : super._();
  factory _PurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemModelFromJson(json);

  @override
  final int id;
  @override
  final int purchaseOrderId;
  @override
  final int productId;
  @override
  final int? productUnitId;
  @override
  final String productName;
  @override
  final String? unitName;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey()
  final double conversionFactor;
  @override
  @JsonKey()
  final double baseQuantity;
  @override
  @JsonKey()
  final double unitPrice;
  @override
  @JsonKey()
  final double baseUnitCost;
  @override
  @JsonKey()
  final double total;
  @override
  final String? notes;

  /// Create a copy of PurchaseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseItemModelCopyWith<_PurchaseItemModel> get copyWith =>
      __$PurchaseItemModelCopyWithImpl<_PurchaseItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
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
            (identical(other.total, total) || other.total == total) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      purchaseOrderId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      baseUnitCost,
      total,
      notes);

  @override
  String toString() {
    return 'PurchaseItemModel(id: $id, purchaseOrderId: $purchaseOrderId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, baseQuantity: $baseQuantity, unitPrice: $unitPrice, baseUnitCost: $baseUnitCost, total: $total, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseItemModelCopyWith<$Res>
    implements $PurchaseItemModelCopyWith<$Res> {
  factory _$PurchaseItemModelCopyWith(
          _PurchaseItemModel value, $Res Function(_PurchaseItemModel) _then) =
      __$PurchaseItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int purchaseOrderId,
      int productId,
      int? productUnitId,
      String productName,
      String? unitName,
      double quantity,
      double conversionFactor,
      double baseQuantity,
      double unitPrice,
      double baseUnitCost,
      double total,
      String? notes});
}

/// @nodoc
class __$PurchaseItemModelCopyWithImpl<$Res>
    implements _$PurchaseItemModelCopyWith<$Res> {
  __$PurchaseItemModelCopyWithImpl(this._self, this._then);

  final _PurchaseItemModel _self;
  final $Res Function(_PurchaseItemModel) _then;

  /// Create a copy of PurchaseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = freezed,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? baseQuantity = null,
    Object? unitPrice = null,
    Object? baseUnitCost = null,
    Object? total = null,
    Object? notes = freezed,
  }) {
    return _then(_PurchaseItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _self.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
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
      unitName: freezed == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
