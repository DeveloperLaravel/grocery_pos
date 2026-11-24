// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_brand_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBrandParams {
  String get name;
  String? get description;
  String? get imagePath;
  bool get isActive;

  /// Create a copy of CreateBrandParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateBrandParamsCopyWith<CreateBrandParams> get copyWith =>
      _$CreateBrandParamsCopyWithImpl<CreateBrandParams>(
          this as CreateBrandParams, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateBrandParams &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, imagePath, isActive);

  @override
  String toString() {
    return 'CreateBrandParams(name: $name, description: $description, imagePath: $imagePath, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $CreateBrandParamsCopyWith<$Res> {
  factory $CreateBrandParamsCopyWith(
          CreateBrandParams value, $Res Function(CreateBrandParams) _then) =
      _$CreateBrandParamsCopyWithImpl;
  @useResult
  $Res call(
      {String name, String? description, String? imagePath, bool isActive});
}

/// @nodoc
class _$CreateBrandParamsCopyWithImpl<$Res>
    implements $CreateBrandParamsCopyWith<$Res> {
  _$CreateBrandParamsCopyWithImpl(this._self, this._then);

  final CreateBrandParams _self;
  final $Res Function(CreateBrandParams) _then;

  /// Create a copy of CreateBrandParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? isActive = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateBrandParams].
extension CreateBrandParamsPatterns on CreateBrandParams {
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
    TResult Function(_CreateBrandParams value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams() when $default != null:
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
    TResult Function(_CreateBrandParams value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams():
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
    TResult? Function(_CreateBrandParams value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams() when $default != null:
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
            String name, String? description, String? imagePath, bool isActive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams() when $default != null:
        return $default(
            _that.name, _that.description, _that.imagePath, _that.isActive);
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
            String name, String? description, String? imagePath, bool isActive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams():
        return $default(
            _that.name, _that.description, _that.imagePath, _that.isActive);
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
            String name, String? description, String? imagePath, bool isActive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateBrandParams() when $default != null:
        return $default(
            _that.name, _that.description, _that.imagePath, _that.isActive);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreateBrandParams implements CreateBrandParams {
  const _CreateBrandParams(
      {required this.name,
      this.description,
      this.imagePath,
      this.isActive = true});

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imagePath;
  @override
  @JsonKey()
  final bool isActive;

  /// Create a copy of CreateBrandParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateBrandParamsCopyWith<_CreateBrandParams> get copyWith =>
      __$CreateBrandParamsCopyWithImpl<_CreateBrandParams>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateBrandParams &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, imagePath, isActive);

  @override
  String toString() {
    return 'CreateBrandParams(name: $name, description: $description, imagePath: $imagePath, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$CreateBrandParamsCopyWith<$Res>
    implements $CreateBrandParamsCopyWith<$Res> {
  factory _$CreateBrandParamsCopyWith(
          _CreateBrandParams value, $Res Function(_CreateBrandParams) _then) =
      __$CreateBrandParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String? description, String? imagePath, bool isActive});
}

/// @nodoc
class __$CreateBrandParamsCopyWithImpl<$Res>
    implements _$CreateBrandParamsCopyWith<$Res> {
  __$CreateBrandParamsCopyWithImpl(this._self, this._then);

  final _CreateBrandParams _self;
  final $Res Function(_CreateBrandParams) _then;

  /// Create a copy of CreateBrandParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? isActive = null,
  }) {
    return _then(_CreateBrandParams(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
