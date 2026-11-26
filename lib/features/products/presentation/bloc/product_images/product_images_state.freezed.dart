// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductImagesState {
  List<ProductImage> get images;
  bool get isLoading;
  bool get isOperationInProgress;
  bool get isWatching;
  String? get errorMessage;
  String? get successMessage;
  int? get currentProductId;

  /// Create a copy of ProductImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductImagesStateCopyWith<ProductImagesState> get copyWith =>
      _$ProductImagesStateCopyWithImpl<ProductImagesState>(
          this as ProductImagesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductImagesState &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(images),
      isLoading,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage,
      currentProductId);

  @override
  String toString() {
    return 'ProductImagesState(images: $images, isLoading: $isLoading, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage, currentProductId: $currentProductId)';
  }
}

/// @nodoc
abstract mixin class $ProductImagesStateCopyWith<$Res> {
  factory $ProductImagesStateCopyWith(
          ProductImagesState value, $Res Function(ProductImagesState) _then) =
      _$ProductImagesStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductImage> images,
      bool isLoading,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage,
      int? currentProductId});
}

/// @nodoc
class _$ProductImagesStateCopyWithImpl<$Res>
    implements $ProductImagesStateCopyWith<$Res> {
  _$ProductImagesStateCopyWithImpl(this._self, this._then);

  final ProductImagesState _self;
  final $Res Function(ProductImagesState) _then;

  /// Create a copy of ProductImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isLoading = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? currentProductId = freezed,
  }) {
    return _then(_self.copyWith(
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
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
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductImagesState].
extension ProductImagesStatePatterns on ProductImagesState {
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
    TResult Function(_ProductImagesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState() when $default != null:
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
    TResult Function(_ProductImagesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState():
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
    TResult? Function(_ProductImagesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState() when $default != null:
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
            List<ProductImage> images,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? currentProductId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState() when $default != null:
        return $default(
            _that.images,
            _that.isLoading,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.currentProductId);
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
            List<ProductImage> images,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? currentProductId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState():
        return $default(
            _that.images,
            _that.isLoading,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.currentProductId);
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
            List<ProductImage> images,
            bool isLoading,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? currentProductId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductImagesState() when $default != null:
        return $default(
            _that.images,
            _that.isLoading,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.currentProductId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductImagesState implements ProductImagesState {
  const _ProductImagesState(
      {final List<ProductImage> images = const [],
      this.isLoading = false,
      this.isOperationInProgress = false,
      this.isWatching = false,
      this.errorMessage,
      this.successMessage,
      this.currentProductId})
      : _images = images;

  final List<ProductImage> _images;
  @override
  @JsonKey()
  List<ProductImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
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
  @override
  final int? currentProductId;

  /// Create a copy of ProductImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductImagesStateCopyWith<_ProductImagesState> get copyWith =>
      __$ProductImagesStateCopyWithImpl<_ProductImagesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductImagesState &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      isLoading,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage,
      currentProductId);

  @override
  String toString() {
    return 'ProductImagesState(images: $images, isLoading: $isLoading, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage, currentProductId: $currentProductId)';
  }
}

/// @nodoc
abstract mixin class _$ProductImagesStateCopyWith<$Res>
    implements $ProductImagesStateCopyWith<$Res> {
  factory _$ProductImagesStateCopyWith(
          _ProductImagesState value, $Res Function(_ProductImagesState) _then) =
      __$ProductImagesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductImage> images,
      bool isLoading,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage,
      int? currentProductId});
}

/// @nodoc
class __$ProductImagesStateCopyWithImpl<$Res>
    implements _$ProductImagesStateCopyWith<$Res> {
  __$ProductImagesStateCopyWithImpl(this._self, this._then);

  final _ProductImagesState _self;
  final $Res Function(_ProductImagesState) _then;

  /// Create a copy of ProductImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? images = null,
    Object? isLoading = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? currentProductId = freezed,
  }) {
    return _then(_ProductImagesState(
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
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
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
