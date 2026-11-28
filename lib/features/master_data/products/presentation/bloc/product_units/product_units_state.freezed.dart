// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_units_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUnitsState {
  List<ProductUnit> get units;
  ProductUnit? get selectedUnit;
  bool get isLoading;
  bool get isSaving;
  bool get isDeleting;
  bool get isSettingBase;
  bool get isSettingDefault;
  bool get isWatching;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of ProductUnitsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductUnitsStateCopyWith<ProductUnitsState> get copyWith =>
      _$ProductUnitsStateCopyWithImpl<ProductUnitsState>(
          this as ProductUnitsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductUnitsState &&
            const DeepCollectionEquality().equals(other.units, units) &&
            (identical(other.selectedUnit, selectedUnit) ||
                other.selectedUnit == selectedUnit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSettingBase, isSettingBase) ||
                other.isSettingBase == isSettingBase) &&
            (identical(other.isSettingDefault, isSettingDefault) ||
                other.isSettingDefault == isSettingDefault) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(units),
      selectedUnit,
      isLoading,
      isSaving,
      isDeleting,
      isSettingBase,
      isSettingDefault,
      isWatching,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'ProductUnitsState(units: $units, selectedUnit: $selectedUnit, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSettingBase: $isSettingBase, isSettingDefault: $isSettingDefault, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $ProductUnitsStateCopyWith<$Res> {
  factory $ProductUnitsStateCopyWith(
          ProductUnitsState value, $Res Function(ProductUnitsState) _then) =
      _$ProductUnitsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductUnit> units,
      ProductUnit? selectedUnit,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSettingBase,
      bool isSettingDefault,
      bool isWatching,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$ProductUnitsStateCopyWithImpl<$Res>
    implements $ProductUnitsStateCopyWith<$Res> {
  _$ProductUnitsStateCopyWithImpl(this._self, this._then);

  final ProductUnitsState _self;
  final $Res Function(ProductUnitsState) _then;

  /// Create a copy of ProductUnitsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? selectedUnit = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSettingBase = null,
    Object? isSettingDefault = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      units: null == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<ProductUnit>,
      selectedUnit: freezed == selectedUnit
          ? _self.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as ProductUnit?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingBase: null == isSettingBase
          ? _self.isSettingBase
          : isSettingBase // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingDefault: null == isSettingDefault
          ? _self.isSettingDefault
          : isSettingDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductUnitsState].
extension ProductUnitsStatePatterns on ProductUnitsState {
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
    TResult Function(_ProductUnitsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState() when $default != null:
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
    TResult Function(_ProductUnitsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState():
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
    TResult? Function(_ProductUnitsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState() when $default != null:
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
            List<ProductUnit> units,
            ProductUnit? selectedUnit,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingBase,
            bool isSettingDefault,
            bool isWatching,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState() when $default != null:
        return $default(
            _that.units,
            _that.selectedUnit,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingBase,
            _that.isSettingDefault,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage);
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
            List<ProductUnit> units,
            ProductUnit? selectedUnit,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingBase,
            bool isSettingDefault,
            bool isWatching,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState():
        return $default(
            _that.units,
            _that.selectedUnit,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingBase,
            _that.isSettingDefault,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage);
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
            List<ProductUnit> units,
            ProductUnit? selectedUnit,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingBase,
            bool isSettingDefault,
            bool isWatching,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUnitsState() when $default != null:
        return $default(
            _that.units,
            _that.selectedUnit,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingBase,
            _that.isSettingDefault,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductUnitsState implements ProductUnitsState {
  const _ProductUnitsState(
      {final List<ProductUnit> units = const [],
      this.selectedUnit,
      this.isLoading = false,
      this.isSaving = false,
      this.isDeleting = false,
      this.isSettingBase = false,
      this.isSettingDefault = false,
      this.isWatching = false,
      this.errorMessage,
      this.successMessage})
      : _units = units;

  final List<ProductUnit> _units;
  @override
  @JsonKey()
  List<ProductUnit> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  final ProductUnit? selectedUnit;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isSettingBase;
  @override
  @JsonKey()
  final bool isSettingDefault;
  @override
  @JsonKey()
  final bool isWatching;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of ProductUnitsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductUnitsStateCopyWith<_ProductUnitsState> get copyWith =>
      __$ProductUnitsStateCopyWithImpl<_ProductUnitsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductUnitsState &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            (identical(other.selectedUnit, selectedUnit) ||
                other.selectedUnit == selectedUnit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSettingBase, isSettingBase) ||
                other.isSettingBase == isSettingBase) &&
            (identical(other.isSettingDefault, isSettingDefault) ||
                other.isSettingDefault == isSettingDefault) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_units),
      selectedUnit,
      isLoading,
      isSaving,
      isDeleting,
      isSettingBase,
      isSettingDefault,
      isWatching,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'ProductUnitsState(units: $units, selectedUnit: $selectedUnit, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSettingBase: $isSettingBase, isSettingDefault: $isSettingDefault, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$ProductUnitsStateCopyWith<$Res>
    implements $ProductUnitsStateCopyWith<$Res> {
  factory _$ProductUnitsStateCopyWith(
          _ProductUnitsState value, $Res Function(_ProductUnitsState) _then) =
      __$ProductUnitsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductUnit> units,
      ProductUnit? selectedUnit,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSettingBase,
      bool isSettingDefault,
      bool isWatching,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$ProductUnitsStateCopyWithImpl<$Res>
    implements _$ProductUnitsStateCopyWith<$Res> {
  __$ProductUnitsStateCopyWithImpl(this._self, this._then);

  final _ProductUnitsState _self;
  final $Res Function(_ProductUnitsState) _then;

  /// Create a copy of ProductUnitsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? units = null,
    Object? selectedUnit = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSettingBase = null,
    Object? isSettingDefault = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_ProductUnitsState(
      units: null == units
          ? _self._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<ProductUnit>,
      selectedUnit: freezed == selectedUnit
          ? _self.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as ProductUnit?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingBase: null == isSettingBase
          ? _self.isSettingBase
          : isSettingBase // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingDefault: null == isSettingDefault
          ? _self.isSettingDefault
          : isSettingDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
