// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {
  int get id;
  String get name;
  String? get description;
  int? get categoryId;
  int? get brandId;
  String get productType;
  String get baseUnit;
  bool get allowDecimalQuantity;
  double get costPrice;
  double get salePrice;
  double get minStock;
  double get quantity;
  bool get isActive;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.baseUnit, baseUnit) ||
                other.baseUnit == baseUnit) &&
            (identical(other.allowDecimalQuantity, allowDecimalQuantity) ||
                other.allowDecimalQuantity == allowDecimalQuantity) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
      name,
      description,
      categoryId,
      brandId,
      productType,
      baseUnit,
      allowDecimalQuantity,
      costPrice,
      salePrice,
      minStock,
      quantity,
      isActive,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, categoryId: $categoryId, brandId: $brandId, productType: $productType, baseUnit: $baseUnit, allowDecimalQuantity: $allowDecimalQuantity, costPrice: $costPrice, salePrice: $salePrice, minStock: $minStock, quantity: $quantity, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int? categoryId,
      int? brandId,
      String productType,
      String baseUnit,
      bool allowDecimalQuantity,
      double costPrice,
      double salePrice,
      double minStock,
      double quantity,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? brandId = freezed,
    Object? productType = null,
    Object? baseUnit = null,
    Object? allowDecimalQuantity = null,
    Object? costPrice = null,
    Object? salePrice = null,
    Object? minStock = null,
    Object? quantity = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      productType: null == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      baseUnit: null == baseUnit
          ? _self.baseUnit
          : baseUnit // ignore: cast_nullable_to_non_nullable
              as String,
      allowDecimalQuantity: null == allowDecimalQuantity
          ? _self.allowDecimalQuantity
          : allowDecimalQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minStock: null == minStock
          ? _self.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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

/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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
    TResult Function(_ProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
    TResult Function(_ProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
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
    TResult? Function(_ProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
            String name,
            String? description,
            int? categoryId,
            int? brandId,
            String productType,
            String baseUnit,
            bool allowDecimalQuantity,
            double costPrice,
            double salePrice,
            double minStock,
            double quantity,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.brandId,
            _that.productType,
            _that.baseUnit,
            _that.allowDecimalQuantity,
            _that.costPrice,
            _that.salePrice,
            _that.minStock,
            _that.quantity,
            _that.isActive,
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
            String name,
            String? description,
            int? categoryId,
            int? brandId,
            String productType,
            String baseUnit,
            bool allowDecimalQuantity,
            double costPrice,
            double salePrice,
            double minStock,
            double quantity,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.brandId,
            _that.productType,
            _that.baseUnit,
            _that.allowDecimalQuantity,
            _that.costPrice,
            _that.salePrice,
            _that.minStock,
            _that.quantity,
            _that.isActive,
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
            String name,
            String? description,
            int? categoryId,
            int? brandId,
            String productType,
            String baseUnit,
            bool allowDecimalQuantity,
            double costPrice,
            double salePrice,
            double minStock,
            double quantity,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.brandId,
            _that.productType,
            _that.baseUnit,
            _that.allowDecimalQuantity,
            _that.costPrice,
            _that.salePrice,
            _that.minStock,
            _that.quantity,
            _that.isActive,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductModel implements ProductModel {
  const _ProductModel(
      {required this.id,
      required this.name,
      this.description,
      this.categoryId,
      this.brandId,
      required this.productType,
      required this.baseUnit,
      required this.allowDecimalQuantity,
      required this.costPrice,
      required this.salePrice,
      required this.minStock,
      required this.quantity,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  factory _ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int? categoryId;
  @override
  final int? brandId;
  @override
  final String productType;
  @override
  final String baseUnit;
  @override
  final bool allowDecimalQuantity;
  @override
  final double costPrice;
  @override
  final double salePrice;
  @override
  final double minStock;
  @override
  final double quantity;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.baseUnit, baseUnit) ||
                other.baseUnit == baseUnit) &&
            (identical(other.allowDecimalQuantity, allowDecimalQuantity) ||
                other.allowDecimalQuantity == allowDecimalQuantity) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
      name,
      description,
      categoryId,
      brandId,
      productType,
      baseUnit,
      allowDecimalQuantity,
      costPrice,
      salePrice,
      minStock,
      quantity,
      isActive,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, categoryId: $categoryId, brandId: $brandId, productType: $productType, baseUnit: $baseUnit, allowDecimalQuantity: $allowDecimalQuantity, costPrice: $costPrice, salePrice: $salePrice, minStock: $minStock, quantity: $quantity, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int? categoryId,
      int? brandId,
      String productType,
      String baseUnit,
      bool allowDecimalQuantity,
      double costPrice,
      double salePrice,
      double minStock,
      double quantity,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? brandId = freezed,
    Object? productType = null,
    Object? baseUnit = null,
    Object? allowDecimalQuantity = null,
    Object? costPrice = null,
    Object? salePrice = null,
    Object? minStock = null,
    Object? quantity = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ProductModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      productType: null == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      baseUnit: null == baseUnit
          ? _self.baseUnit
          : baseUnit // ignore: cast_nullable_to_non_nullable
              as String,
      allowDecimalQuantity: null == allowDecimalQuantity
          ? _self.allowDecimalQuantity
          : allowDecimalQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      costPrice: null == costPrice
          ? _self.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minStock: null == minStock
          ? _self.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
