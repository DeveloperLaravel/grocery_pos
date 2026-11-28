// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brands_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandsState {
  List<Brand> get brands;
  bool get isLoading;
  bool get isOperationInProgress;
  bool get isWatching;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of BrandsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrandsStateCopyWith<BrandsState> get copyWith =>
      _$BrandsStateCopyWithImpl<BrandsState>(this as BrandsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrandsState &&
            const DeepCollectionEquality().equals(other.brands, brands) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
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
      const DeepCollectionEquality().hash(brands),
      isLoading,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BrandsState(brands: $brands, isLoading: $isLoading, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $BrandsStateCopyWith<$Res> {
  factory $BrandsStateCopyWith(
          BrandsState value, $Res Function(BrandsState) _then) =
      _$BrandsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Brand> brands,
      bool isLoading,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$BrandsStateCopyWithImpl<$Res> implements $BrandsStateCopyWith<$Res> {
  _$BrandsStateCopyWithImpl(this._self, this._then);

  final BrandsState _self;
  final $Res Function(BrandsState) _then;

  /// Create a copy of BrandsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? isLoading = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      brands: null == brands
          ? _self.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOperationInProgress: null == isOperationInProgress
          ? _self.isOperationInProgress
          : isOperationInProgress // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [BrandsState].
extension BrandsStatePatterns on BrandsState {
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
    TResult Function(_BrandsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandsState() when $default != null:
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
    TResult Function(_BrandsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandsState():
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
    TResult? Function(_BrandsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandsState() when $default != null:
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
            List<Brand> brands,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandsState() when $default != null:
        return $default(
            _that.brands,
            _that.isLoading,
            _that.isOperationInProgress,
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
            List<Brand> brands,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandsState():
        return $default(
            _that.brands,
            _that.isLoading,
            _that.isOperationInProgress,
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
            List<Brand> brands,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandsState() when $default != null:
        return $default(
            _that.brands,
            _that.isLoading,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BrandsState extends BrandsState {
  const _BrandsState(
      {final List<Brand> brands = const [],
      this.isLoading = false,
      this.isOperationInProgress = false,
      this.isWatching = false,
      this.errorMessage,
      this.successMessage})
      : _brands = brands,
        super._();

  final List<Brand> _brands;
  @override
  @JsonKey()
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isOperationInProgress;
  @override
  @JsonKey()
  final bool isWatching;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of BrandsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrandsStateCopyWith<_BrandsState> get copyWith =>
      __$BrandsStateCopyWithImpl<_BrandsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrandsState &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
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
      const DeepCollectionEquality().hash(_brands),
      isLoading,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BrandsState(brands: $brands, isLoading: $isLoading, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$BrandsStateCopyWith<$Res>
    implements $BrandsStateCopyWith<$Res> {
  factory _$BrandsStateCopyWith(
          _BrandsState value, $Res Function(_BrandsState) _then) =
      __$BrandsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Brand> brands,
      bool isLoading,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$BrandsStateCopyWithImpl<$Res> implements _$BrandsStateCopyWith<$Res> {
  __$BrandsStateCopyWithImpl(this._self, this._then);

  final _BrandsState _self;
  final $Res Function(_BrandsState) _then;

  /// Create a copy of BrandsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brands = null,
    Object? isLoading = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_BrandsState(
      brands: null == brands
          ? _self._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOperationInProgress: null == isOperationInProgress
          ? _self.isOperationInProgress
          : isOperationInProgress // ignore: cast_nullable_to_non_nullable
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
