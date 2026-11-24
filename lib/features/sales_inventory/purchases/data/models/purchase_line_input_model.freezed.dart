// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_line_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseLineInputModel {
  int get productId;
  int get productUnitId;
  String get productName;
  String get unitName;
  double get quantity;
  double get conversionFactor;
  double get unitPrice;
  String? get notes;

  /// Create a copy of PurchaseLineInputModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseLineInputModelCopyWith<PurchaseLineInputModel> get copyWith =>
      _$PurchaseLineInputModelCopyWithImpl<PurchaseLineInputModel>(
          this as PurchaseLineInputModel, _$identity);

  /// Serializes this PurchaseLineInputModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseLineInputModel &&
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
                other.unitPrice == unitPrice) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productUnitId,
      productName, unitName, quantity, conversionFactor, unitPrice, notes);

  @override
  String toString() {
    return 'PurchaseLineInputModel(productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, unitPrice: $unitPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $PurchaseLineInputModelCopyWith<$Res> {
  factory $PurchaseLineInputModelCopyWith(PurchaseLineInputModel value,
          $Res Function(PurchaseLineInputModel) _then) =
      _$PurchaseLineInputModelCopyWithImpl;
  @useResult
  $Res call(
      {int productId,
      int productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double unitPrice,
      String? notes});
}

/// @nodoc
class _$PurchaseLineInputModelCopyWithImpl<$Res>
    implements $PurchaseLineInputModelCopyWith<$Res> {
  _$PurchaseLineInputModelCopyWithImpl(this._self, this._then);

  final PurchaseLineInputModel _self;
  final $Res Function(PurchaseLineInputModel) _then;

  /// Create a copy of PurchaseLineInputModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productUnitId = null,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? unitPrice = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: null == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int,
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseLineInputModel].
extension PurchaseLineInputModelPatterns on PurchaseLineInputModel {
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
    TResult Function(_PurchaseLineInputModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel() when $default != null:
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
    TResult Function(_PurchaseLineInputModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel():
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
    TResult? Function(_PurchaseLineInputModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel() when $default != null:
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
            int productId,
            int productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel() when $default != null:
        return $default(
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice,
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
            int productId,
            int productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel():
        return $default(
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice,
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
            int productId,
            int productUnitId,
            String productName,
            String unitName,
            double quantity,
            double conversionFactor,
            double unitPrice,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseLineInputModel() when $default != null:
        return $default(
            _that.productId,
            _that.productUnitId,
            _that.productName,
            _that.unitName,
            _that.quantity,
            _that.conversionFactor,
            _that.unitPrice,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseLineInputModel extends PurchaseLineInputModel {
  const _PurchaseLineInputModel(
      {required this.productId,
      required this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      required this.conversionFactor,
      required this.unitPrice,
      this.notes})
      : super._();
  factory _PurchaseLineInputModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseLineInputModelFromJson(json);

  @override
  final int productId;
  @override
  final int productUnitId;
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
  @override
  final String? notes;

  /// Create a copy of PurchaseLineInputModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseLineInputModelCopyWith<_PurchaseLineInputModel> get copyWith =>
      __$PurchaseLineInputModelCopyWithImpl<_PurchaseLineInputModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseLineInputModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseLineInputModel &&
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
                other.unitPrice == unitPrice) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productUnitId,
      productName, unitName, quantity, conversionFactor, unitPrice, notes);

  @override
  String toString() {
    return 'PurchaseLineInputModel(productId: $productId, productUnitId: $productUnitId, productName: $productName, unitName: $unitName, quantity: $quantity, conversionFactor: $conversionFactor, unitPrice: $unitPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseLineInputModelCopyWith<$Res>
    implements $PurchaseLineInputModelCopyWith<$Res> {
  factory _$PurchaseLineInputModelCopyWith(_PurchaseLineInputModel value,
          $Res Function(_PurchaseLineInputModel) _then) =
      __$PurchaseLineInputModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int productId,
      int productUnitId,
      String productName,
      String unitName,
      double quantity,
      double conversionFactor,
      double unitPrice,
      String? notes});
}

/// @nodoc
class __$PurchaseLineInputModelCopyWithImpl<$Res>
    implements _$PurchaseLineInputModelCopyWith<$Res> {
  __$PurchaseLineInputModelCopyWithImpl(this._self, this._then);

  final _PurchaseLineInputModel _self;
  final $Res Function(_PurchaseLineInputModel) _then;

  /// Create a copy of PurchaseLineInputModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productUnitId = null,
    Object? productName = null,
    Object? unitName = null,
    Object? quantity = null,
    Object? conversionFactor = null,
    Object? unitPrice = null,
    Object? notes = freezed,
  }) {
    return _then(_PurchaseLineInputModel(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productUnitId: null == productUnitId
          ? _self.productUnitId
          : productUnitId // ignore: cast_nullable_to_non_nullable
              as int,
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
