// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUnitModel {
  int get id;
  int get productId;
  String get unitName;
  String? get unitSymbol;
  double get conversionFactor;
  double get salePrice;
  double get purchasePrice;
  bool get isBaseUnit;
  bool get isDefault;
  bool get isActive;
  int get sortOrder;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ProductUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductUnitModelCopyWith<ProductUnitModel> get copyWith =>
      _$ProductUnitModelCopyWithImpl<ProductUnitModel>(
          this as ProductUnitModel, _$identity);

  /// Serializes this ProductUnitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductUnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.unitSymbol, unitSymbol) ||
                other.unitSymbol == unitSymbol) &&
            (identical(other.conversionFactor, conversionFactor) ||
                other.conversionFactor == conversionFactor) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.isBaseUnit, isBaseUnit) ||
                other.isBaseUnit == isBaseUnit) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
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
      productId,
      unitName,
      unitSymbol,
      conversionFactor,
      salePrice,
      purchasePrice,
      isBaseUnit,
      isDefault,
      isActive,
      sortOrder,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ProductUnitModel(id: $id, productId: $productId, unitName: $unitName, unitSymbol: $unitSymbol, conversionFactor: $conversionFactor, salePrice: $salePrice, purchasePrice: $purchasePrice, isBaseUnit: $isBaseUnit, isDefault: $isDefault, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProductUnitModelCopyWith<$Res> {
  factory $ProductUnitModelCopyWith(
          ProductUnitModel value, $Res Function(ProductUnitModel) _then) =
      _$ProductUnitModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int productId,
      String unitName,
      String? unitSymbol,
      double conversionFactor,
      double salePrice,
      double purchasePrice,
      bool isBaseUnit,
      bool isDefault,
      bool isActive,
      int sortOrder,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ProductUnitModelCopyWithImpl<$Res>
    implements $ProductUnitModelCopyWith<$Res> {
  _$ProductUnitModelCopyWithImpl(this._self, this._then);

  final ProductUnitModel _self;
  final $Res Function(ProductUnitModel) _then;

  /// Create a copy of ProductUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? unitName = null,
    Object? unitSymbol = freezed,
    Object? conversionFactor = null,
    Object? salePrice = null,
    Object? purchasePrice = null,
    Object? isBaseUnit = null,
    Object? isDefault = null,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      unitSymbol: freezed == unitSymbol
          ? _self.unitSymbol
          : unitSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionFactor: null == conversionFactor
          ? _self.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      isBaseUnit: null == isBaseUnit
          ? _self.isBaseUnit
          : isBaseUnit // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
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

/// Adds pattern-matching-related methods to [ProductUnitModel].
extension ProductUnitModelPatterns on ProductUnitModel {
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
    TResult Function(_ProductUnitModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel() when $default != null:
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
    TResult Function(_ProductUnitModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel():
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
    TResult? Function(_ProductUnitModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel() when $default != null:
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
            int productId,
            String unitName,
            String? unitSymbol,
            double conversionFactor,
            double salePrice,
            double purchasePrice,
            bool isBaseUnit,
            bool isDefault,
            bool isActive,
            int sortOrder,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.unitName,
            _that.unitSymbol,
            _that.conversionFactor,
            _that.salePrice,
            _that.purchasePrice,
            _that.isBaseUnit,
            _that.isDefault,
            _that.isActive,
            _that.sortOrder,
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
            int productId,
            String unitName,
            String? unitSymbol,
            double conversionFactor,
            double salePrice,
            double purchasePrice,
            bool isBaseUnit,
            bool isDefault,
            bool isActive,
            int sortOrder,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel():
        return $default(
            _that.id,
            _that.productId,
            _that.unitName,
            _that.unitSymbol,
            _that.conversionFactor,
            _that.salePrice,
            _that.purchasePrice,
            _that.isBaseUnit,
            _that.isDefault,
            _that.isActive,
            _that.sortOrder,
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
            int productId,
            String unitName,
            String? unitSymbol,
            double conversionFactor,
            double salePrice,
            double purchasePrice,
            bool isBaseUnit,
            bool isDefault,
            bool isActive,
            int sortOrder,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.unitName,
            _that.unitSymbol,
            _that.conversionFactor,
            _that.salePrice,
            _that.purchasePrice,
            _that.isBaseUnit,
            _that.isDefault,
            _that.isActive,
            _that.sortOrder,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductUnitModel implements ProductUnitModel {
  const _ProductUnitModel(
      {required this.id,
      required this.productId,
      required this.unitName,
      this.unitSymbol,
      this.conversionFactor = 1.0,
      this.salePrice = 0.0,
      this.purchasePrice = 0.0,
      this.isBaseUnit = false,
      this.isDefault = false,
      this.isActive = true,
      this.sortOrder = 0,
      required this.createdAt,
      required this.updatedAt});
  factory _ProductUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitModelFromJson(json);

  @override
  final int id;
  @override
  final int productId;
  @override
  final String unitName;
  @override
  final String? unitSymbol;
  @override
  @JsonKey()
  final double conversionFactor;
  @override
  @JsonKey()
  final double salePrice;
  @override
  @JsonKey()
  final double purchasePrice;
  @override
  @JsonKey()
  final bool isBaseUnit;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ProductUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductUnitModelCopyWith<_ProductUnitModel> get copyWith =>
      __$ProductUnitModelCopyWithImpl<_ProductUnitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductUnitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductUnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.unitSymbol, unitSymbol) ||
                other.unitSymbol == unitSymbol) &&
            (identical(other.conversionFactor, conversionFactor) ||
                other.conversionFactor == conversionFactor) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.isBaseUnit, isBaseUnit) ||
                other.isBaseUnit == isBaseUnit) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
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
      productId,
      unitName,
      unitSymbol,
      conversionFactor,
      salePrice,
      purchasePrice,
      isBaseUnit,
      isDefault,
      isActive,
      sortOrder,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ProductUnitModel(id: $id, productId: $productId, unitName: $unitName, unitSymbol: $unitSymbol, conversionFactor: $conversionFactor, salePrice: $salePrice, purchasePrice: $purchasePrice, isBaseUnit: $isBaseUnit, isDefault: $isDefault, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProductUnitModelCopyWith<$Res>
    implements $ProductUnitModelCopyWith<$Res> {
  factory _$ProductUnitModelCopyWith(
          _ProductUnitModel value, $Res Function(_ProductUnitModel) _then) =
      __$ProductUnitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int productId,
      String unitName,
      String? unitSymbol,
      double conversionFactor,
      double salePrice,
      double purchasePrice,
      bool isBaseUnit,
      bool isDefault,
      bool isActive,
      int sortOrder,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ProductUnitModelCopyWithImpl<$Res>
    implements _$ProductUnitModelCopyWith<$Res> {
  __$ProductUnitModelCopyWithImpl(this._self, this._then);

  final _ProductUnitModel _self;
  final $Res Function(_ProductUnitModel) _then;

  /// Create a copy of ProductUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? unitName = null,
    Object? unitSymbol = freezed,
    Object? conversionFactor = null,
    Object? salePrice = null,
    Object? purchasePrice = null,
    Object? isBaseUnit = null,
    Object? isDefault = null,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ProductUnitModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      unitSymbol: freezed == unitSymbol
          ? _self.unitSymbol
          : unitSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionFactor: null == conversionFactor
          ? _self.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      isBaseUnit: null == isBaseUnit
          ? _self.isBaseUnit
          : isBaseUnit // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
