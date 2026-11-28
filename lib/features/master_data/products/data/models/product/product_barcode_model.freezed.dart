// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_barcode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductBarcodeModel {
  int get id;
  int get productId;
  int? get productUnitId;
  String get barcode;
  String get barcodeType;
  String? get source;
  bool get isDefault;
  bool get isActive;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ProductBarcodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductBarcodeModelCopyWith<ProductBarcodeModel> get copyWith =>
      _$ProductBarcodeModelCopyWithImpl<ProductBarcodeModel>(
          this as ProductBarcodeModel, _$identity);

  /// Serializes this ProductBarcodeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductBarcodeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.barcodeType, barcodeType) ||
                other.barcodeType == barcodeType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productUnitId,
      barcode, barcodeType, source, isDefault, isActive, createdAt, updatedAt);

  @override
  String toString() {
    return 'ProductBarcodeModel(id: $id, productId: $productId, productUnitId: $productUnitId, barcode: $barcode, barcodeType: $barcodeType, source: $source, isDefault: $isDefault, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProductBarcodeModelCopyWith<$Res> {
  factory $ProductBarcodeModelCopyWith(
          ProductBarcodeModel value, $Res Function(ProductBarcodeModel) _then) =
      _$ProductBarcodeModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int productId,
      int? productUnitId,
      String barcode,
      String barcodeType,
      String? source,
      bool isDefault,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ProductBarcodeModelCopyWithImpl<$Res>
    implements $ProductBarcodeModelCopyWith<$Res> {
  _$ProductBarcodeModelCopyWithImpl(this._self, this._then);

  final ProductBarcodeModel _self;
  final $Res Function(ProductBarcodeModel) _then;

  /// Create a copy of ProductBarcodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? barcode = null,
    Object? barcodeType = null,
    Object? source = freezed,
    Object? isDefault = null,
    Object? isActive = null,
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
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeType: null == barcodeType
          ? _self.barcodeType
          : barcodeType // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
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

/// Adds pattern-matching-related methods to [ProductBarcodeModel].
extension ProductBarcodeModelPatterns on ProductBarcodeModel {
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
    TResult Function(_ProductBarcodeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel() when $default != null:
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
    TResult Function(_ProductBarcodeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel():
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
    TResult? Function(_ProductBarcodeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel() when $default != null:
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
            int? productUnitId,
            String barcode,
            String barcodeType,
            String? source,
            bool isDefault,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productUnitId,
            _that.barcode,
            _that.barcodeType,
            _that.source,
            _that.isDefault,
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
            int productId,
            int? productUnitId,
            String barcode,
            String barcodeType,
            String? source,
            bool isDefault,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel():
        return $default(
            _that.id,
            _that.productId,
            _that.productUnitId,
            _that.barcode,
            _that.barcodeType,
            _that.source,
            _that.isDefault,
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
            int productId,
            int? productUnitId,
            String barcode,
            String barcodeType,
            String? source,
            bool isDefault,
            bool isActive,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductBarcodeModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productUnitId,
            _that.barcode,
            _that.barcodeType,
            _that.source,
            _that.isDefault,
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
class _ProductBarcodeModel implements ProductBarcodeModel {
  const _ProductBarcodeModel(
      {required this.id,
      required this.productId,
      this.productUnitId,
      required this.barcode,
      required this.barcodeType,
      this.source,
      required this.isDefault,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  factory _ProductBarcodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBarcodeModelFromJson(json);

  @override
  final int id;
  @override
  final int productId;
  @override
  final int? productUnitId;
  @override
  final String barcode;
  @override
  final String barcodeType;
  @override
  final String? source;
  @override
  final bool isDefault;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ProductBarcodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductBarcodeModelCopyWith<_ProductBarcodeModel> get copyWith =>
      __$ProductBarcodeModelCopyWithImpl<_ProductBarcodeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductBarcodeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductBarcodeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUnitId, productUnitId) ||
                other.productUnitId == productUnitId) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.barcodeType, barcodeType) ||
                other.barcodeType == barcodeType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productUnitId,
      barcode, barcodeType, source, isDefault, isActive, createdAt, updatedAt);

  @override
  String toString() {
    return 'ProductBarcodeModel(id: $id, productId: $productId, productUnitId: $productUnitId, barcode: $barcode, barcodeType: $barcodeType, source: $source, isDefault: $isDefault, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProductBarcodeModelCopyWith<$Res>
    implements $ProductBarcodeModelCopyWith<$Res> {
  factory _$ProductBarcodeModelCopyWith(_ProductBarcodeModel value,
          $Res Function(_ProductBarcodeModel) _then) =
      __$ProductBarcodeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int productId,
      int? productUnitId,
      String barcode,
      String barcodeType,
      String? source,
      bool isDefault,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ProductBarcodeModelCopyWithImpl<$Res>
    implements _$ProductBarcodeModelCopyWith<$Res> {
  __$ProductBarcodeModelCopyWithImpl(this._self, this._then);

  final _ProductBarcodeModel _self;
  final $Res Function(_ProductBarcodeModel) _then;

  /// Create a copy of ProductBarcodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? barcode = null,
    Object? barcodeType = null,
    Object? source = freezed,
    Object? isDefault = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ProductBarcodeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: freezed == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeType: null == barcodeType
          ? _self.barcodeType
          : barcodeType // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
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
