// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentSaleModel {
  int get id;
  String get invoiceNumber;
  double get total;
  double get paidAmount;
  String get paymentMethod;
  DateTime get createdAt;

  /// Create a copy of RecentSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentSaleModelCopyWith<RecentSaleModel> get copyWith =>
      _$RecentSaleModelCopyWithImpl<RecentSaleModel>(
          this as RecentSaleModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNumber, total,
      paidAmount, paymentMethod, createdAt);

  @override
  String toString() {
    return 'RecentSaleModel(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $RecentSaleModelCopyWith<$Res> {
  factory $RecentSaleModelCopyWith(
          RecentSaleModel value, $Res Function(RecentSaleModel) _then) =
      _$RecentSaleModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double total,
      double paidAmount,
      String paymentMethod,
      DateTime createdAt});
}

/// @nodoc
class _$RecentSaleModelCopyWithImpl<$Res>
    implements $RecentSaleModelCopyWith<$Res> {
  _$RecentSaleModelCopyWithImpl(this._self, this._then);

  final RecentSaleModel _self;
  final $Res Function(RecentSaleModel) _then;

  /// Create a copy of RecentSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecentSaleModel].
extension RecentSaleModelPatterns on RecentSaleModel {
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
    TResult Function(_RecentSaleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel() when $default != null:
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
    TResult Function(_RecentSaleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel():
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
    TResult? Function(_RecentSaleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel() when $default != null:
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
    TResult Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel() when $default != null:
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
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
    TResult Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel():
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
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
    TResult? Function(int id, String invoiceNumber, double total,
            double paidAmount, String paymentMethod, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSaleModel() when $default != null:
        return $default(_that.id, _that.invoiceNumber, _that.total,
            _that.paidAmount, _that.paymentMethod, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecentSaleModel implements RecentSaleModel {
  const _RecentSaleModel(
      {required this.id,
      required this.invoiceNumber,
      required this.total,
      required this.paidAmount,
      required this.paymentMethod,
      required this.createdAt});

  @override
  final int id;
  @override
  final String invoiceNumber;
  @override
  final double total;
  @override
  final double paidAmount;
  @override
  final String paymentMethod;
  @override
  final DateTime createdAt;

  /// Create a copy of RecentSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentSaleModelCopyWith<_RecentSaleModel> get copyWith =>
      __$RecentSaleModelCopyWithImpl<_RecentSaleModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNumber, total,
      paidAmount, paymentMethod, createdAt);

  @override
  String toString() {
    return 'RecentSaleModel(id: $id, invoiceNumber: $invoiceNumber, total: $total, paidAmount: $paidAmount, paymentMethod: $paymentMethod, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$RecentSaleModelCopyWith<$Res>
    implements $RecentSaleModelCopyWith<$Res> {
  factory _$RecentSaleModelCopyWith(
          _RecentSaleModel value, $Res Function(_RecentSaleModel) _then) =
      __$RecentSaleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String invoiceNumber,
      double total,
      double paidAmount,
      String paymentMethod,
      DateTime createdAt});
}

/// @nodoc
class __$RecentSaleModelCopyWithImpl<$Res>
    implements _$RecentSaleModelCopyWith<$Res> {
  __$RecentSaleModelCopyWithImpl(this._self, this._then);

  final _RecentSaleModel _self;
  final $Res Function(_RecentSaleModel) _then;

  /// Create a copy of RecentSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? invoiceNumber = null,
    Object? total = null,
    Object? paidAmount = null,
    Object? paymentMethod = null,
    Object? createdAt = null,
  }) {
    return _then(_RecentSaleModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
