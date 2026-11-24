// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_item_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseReceiptItemInputModel {
  int get purchaseItemId;
  int get productId;
  int? get productUnitId;
  String get productName;
  String get unitName;
  double get quantity;
  double get conversionFactor;
  double get unitPrice;

  /// Create a copy of PurchaseReceiptItemInputModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseReceiptItemInputModelCopyWith<PurchaseReceiptItemInputModel>
      get copyWith => _$PurchaseReceiptItemInputModelCopyWithImpl<
              PurchaseReceiptItemInputModel>(
          this as PurchaseReceiptItemInputModel, _$identity);

  /// Serializes this PurchaseReceiptItemInputModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseReceiptItemInputModel &&
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
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseItemId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      unitPrice);

  @override
  String toString() {
    return 'PurchaseReceiptItemInputModel(purchaseItemId: $purchaseItemId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, unitPrice: $unitPrice)';
  }
}

/// @nodoc
abstract mixin class $PurchaseReceiptItemInputModelCopyWith<$Res> {
  factory $PurchaseReceiptItemInputModelCopyWith(
          PurchaseReceiptItemInputModel value,
          $Res Function(PurchaseReceiptItemInputModel) _then) =
      _$PurchaseReceiptItemInputModelCopyWithImpl;
  @useResult
  $Res call(
      {int purchaseItemId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double unitPrice});
}

/// @nodoc
class _$PurchaseReceiptItemInputModelCopyWithImpl<$Res>
    implements $PurchaseReceiptItemInputModelCopyWith<$Res> {
  _$PurchaseReceiptItemInputModelCopyWithImpl(this._self, this._then);

  final PurchaseReceiptItemInputModel _self;
  final $Res Function(PurchaseReceiptItemInputModel) _then;

  /// Create a copy of PurchaseReceiptItemInputModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseItemId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? unitPrice = null,
  }) {
    return _then(_self.copyWith(
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
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseReceiptItemInputModel].
extension PurchaseReceiptItemInputModelPatterns
    on PurchaseReceiptItemInputModel {
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
    TResult Function(_PurchaseReceiptItemInputModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel() when $default != null:
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
    TResult Function(_PurchaseReceiptItemInputModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel():
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
    TResult? Function(_PurchaseReceiptItemInputModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel() when $default != null:
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
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel() when $default != null:
        return $default(
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice);
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
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel():
        return $default(
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice);
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
            int purchaseItemId,
            int productId,
            int? productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseReceiptItemInputModel() when $default != null:
        return $default(
            _that.purchaseItemId,
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseReceiptItemInputModel extends PurchaseReceiptItemInputModel {
  const _PurchaseReceiptItemInputModel(
      {required this.purchaseItemId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      required this.conversionFactor,
      required this.unitPrice})
      : super._();
  factory _PurchaseReceiptItemInputModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReceiptItemInputModelFromJson(json);

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
  final double unitPrice;

  /// Create a copy of PurchaseReceiptItemInputModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseReceiptItemInputModelCopyWith<_PurchaseReceiptItemInputModel>
      get copyWith => __$PurchaseReceiptItemInputModelCopyWithImpl<
          _PurchaseReceiptItemInputModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseReceiptItemInputModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseReceiptItemInputModel &&
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
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseItemId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      unitPrice);

  @override
  String toString() {
    return 'PurchaseReceiptItemInputModel(purchaseItemId: $purchaseItemId, productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, unitPrice: $unitPrice)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseReceiptItemInputModelCopyWith<$Res>
    implements $PurchaseReceiptItemInputModelCopyWith<$Res> {
  factory _$PurchaseReceiptItemInputModelCopyWith(
          _PurchaseReceiptItemInputModel value,
          $Res Function(_PurchaseReceiptItemInputModel) _then) =
      __$PurchaseReceiptItemInputModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int purchaseItemId,
      int productId,
      int? productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double unitPrice});
}

/// @nodoc
class __$PurchaseReceiptItemInputModelCopyWithImpl<$Res>
    implements _$PurchaseReceiptItemInputModelCopyWith<$Res> {
  __$PurchaseReceiptItemInputModelCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptItemInputModel _self;
  final $Res Function(_PurchaseReceiptItemInputModel) _then;

  /// Create a copy of PurchaseReceiptItemInputModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? purchaseItemId = null,
    Object? productId = null,
    Object? productUnitId = freezed,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? unitPrice = null,
  }) {
    return _then(_PurchaseReceiptItemInputModel(
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
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
