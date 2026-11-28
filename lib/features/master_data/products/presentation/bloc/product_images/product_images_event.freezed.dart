// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_images_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductImagesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductImagesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductImagesEvent()';
  }
}

/// @nodoc
class $ProductImagesEventCopyWith<$Res> {
  $ProductImagesEventCopyWith(
      ProductImagesEvent _, $Res Function(ProductImagesEvent) __);
}

/// Adds pattern-matching-related methods to [ProductImagesEvent].
extension ProductImagesEventPatterns on ProductImagesEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductImages value)? load,
    TResult Function(WatchProductImages value)? watch,
    TResult Function(ProductImagesUpdated value)? imagesUpdated,
    TResult Function(InsertProductImage value)? insert,
    TResult Function(SetPrimaryProductImage value)? setPrimary,
    TResult Function(DeleteProductImage value)? delete,
    TResult Function(ClearProductImagesMessages value)? clearMessages,
    TResult Function(ProductImagesStreamError value)? streamError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages() when load != null:
        return load(_that);
      case WatchProductImages() when watch != null:
        return watch(_that);
      case ProductImagesUpdated() when imagesUpdated != null:
        return imagesUpdated(_that);
      case InsertProductImage() when insert != null:
        return insert(_that);
      case SetPrimaryProductImage() when setPrimary != null:
        return setPrimary(_that);
      case DeleteProductImage() when delete != null:
        return delete(_that);
      case ClearProductImagesMessages() when clearMessages != null:
        return clearMessages(_that);
      case ProductImagesStreamError() when streamError != null:
        return streamError(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductImages value) load,
    required TResult Function(WatchProductImages value) watch,
    required TResult Function(ProductImagesUpdated value) imagesUpdated,
    required TResult Function(InsertProductImage value) insert,
    required TResult Function(SetPrimaryProductImage value) setPrimary,
    required TResult Function(DeleteProductImage value) delete,
    required TResult Function(ClearProductImagesMessages value) clearMessages,
    required TResult Function(ProductImagesStreamError value) streamError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages():
        return load(_that);
      case WatchProductImages():
        return watch(_that);
      case ProductImagesUpdated():
        return imagesUpdated(_that);
      case InsertProductImage():
        return insert(_that);
      case SetPrimaryProductImage():
        return setPrimary(_that);
      case DeleteProductImage():
        return delete(_that);
      case ClearProductImagesMessages():
        return clearMessages(_that);
      case ProductImagesStreamError():
        return streamError(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductImages value)? load,
    TResult? Function(WatchProductImages value)? watch,
    TResult? Function(ProductImagesUpdated value)? imagesUpdated,
    TResult? Function(InsertProductImage value)? insert,
    TResult? Function(SetPrimaryProductImage value)? setPrimary,
    TResult? Function(DeleteProductImage value)? delete,
    TResult? Function(ClearProductImagesMessages value)? clearMessages,
    TResult? Function(ProductImagesStreamError value)? streamError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages() when load != null:
        return load(_that);
      case WatchProductImages() when watch != null:
        return watch(_that);
      case ProductImagesUpdated() when imagesUpdated != null:
        return imagesUpdated(_that);
      case InsertProductImage() when insert != null:
        return insert(_that);
      case SetPrimaryProductImage() when setPrimary != null:
        return setPrimary(_that);
      case DeleteProductImage() when delete != null:
        return delete(_that);
      case ClearProductImagesMessages() when clearMessages != null:
        return clearMessages(_that);
      case ProductImagesStreamError() when streamError != null:
        return streamError(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? load,
    TResult Function(int productId)? watch,
    TResult Function(List<ProductImage> images)? imagesUpdated,
    TResult Function(ProductImage image)? insert,
    TResult Function(int productId, int imageId)? setPrimary,
    TResult Function(int id)? delete,
    TResult Function()? clearMessages,
    TResult Function(String message)? streamError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages() when load != null:
        return load(_that.productId);
      case WatchProductImages() when watch != null:
        return watch(_that.productId);
      case ProductImagesUpdated() when imagesUpdated != null:
        return imagesUpdated(_that.images);
      case InsertProductImage() when insert != null:
        return insert(_that.image);
      case SetPrimaryProductImage() when setPrimary != null:
        return setPrimary(_that.productId, _that.imageId);
      case DeleteProductImage() when delete != null:
        return delete(_that.id);
      case ClearProductImagesMessages() when clearMessages != null:
        return clearMessages();
      case ProductImagesStreamError() when streamError != null:
        return streamError(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) load,
    required TResult Function(int productId) watch,
    required TResult Function(List<ProductImage> images) imagesUpdated,
    required TResult Function(ProductImage image) insert,
    required TResult Function(int productId, int imageId) setPrimary,
    required TResult Function(int id) delete,
    required TResult Function() clearMessages,
    required TResult Function(String message) streamError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages():
        return load(_that.productId);
      case WatchProductImages():
        return watch(_that.productId);
      case ProductImagesUpdated():
        return imagesUpdated(_that.images);
      case InsertProductImage():
        return insert(_that.image);
      case SetPrimaryProductImage():
        return setPrimary(_that.productId, _that.imageId);
      case DeleteProductImage():
        return delete(_that.id);
      case ClearProductImagesMessages():
        return clearMessages();
      case ProductImagesStreamError():
        return streamError(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? load,
    TResult? Function(int productId)? watch,
    TResult? Function(List<ProductImage> images)? imagesUpdated,
    TResult? Function(ProductImage image)? insert,
    TResult? Function(int productId, int imageId)? setPrimary,
    TResult? Function(int id)? delete,
    TResult? Function()? clearMessages,
    TResult? Function(String message)? streamError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductImages() when load != null:
        return load(_that.productId);
      case WatchProductImages() when watch != null:
        return watch(_that.productId);
      case ProductImagesUpdated() when imagesUpdated != null:
        return imagesUpdated(_that.images);
      case InsertProductImage() when insert != null:
        return insert(_that.image);
      case SetPrimaryProductImage() when setPrimary != null:
        return setPrimary(_that.productId, _that.imageId);
      case DeleteProductImage() when delete != null:
        return delete(_that.id);
      case ClearProductImagesMessages() when clearMessages != null:
        return clearMessages();
      case ProductImagesStreamError() when streamError != null:
        return streamError(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadProductImages implements ProductImagesEvent {
  const LoadProductImages({required this.productId});

  final int productId;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadProductImagesCopyWith<LoadProductImages> get copyWith =>
      _$LoadProductImagesCopyWithImpl<LoadProductImages>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadProductImages &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductImagesEvent.load(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $LoadProductImagesCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $LoadProductImagesCopyWith(
          LoadProductImages value, $Res Function(LoadProductImages) _then) =
      _$LoadProductImagesCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$LoadProductImagesCopyWithImpl<$Res>
    implements $LoadProductImagesCopyWith<$Res> {
  _$LoadProductImagesCopyWithImpl(this._self, this._then);

  final LoadProductImages _self;
  final $Res Function(LoadProductImages) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(LoadProductImages(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class WatchProductImages implements ProductImagesEvent {
  const WatchProductImages({required this.productId});

  final int productId;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchProductImagesCopyWith<WatchProductImages> get copyWith =>
      _$WatchProductImagesCopyWithImpl<WatchProductImages>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchProductImages &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductImagesEvent.watch(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $WatchProductImagesCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $WatchProductImagesCopyWith(
          WatchProductImages value, $Res Function(WatchProductImages) _then) =
      _$WatchProductImagesCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$WatchProductImagesCopyWithImpl<$Res>
    implements $WatchProductImagesCopyWith<$Res> {
  _$WatchProductImagesCopyWithImpl(this._self, this._then);

  final WatchProductImages _self;
  final $Res Function(WatchProductImages) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(WatchProductImages(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductImagesUpdated implements ProductImagesEvent {
  const ProductImagesUpdated({required final List<ProductImage> images})
      : _images = images;

  final List<ProductImage> _images;
  List<ProductImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductImagesUpdatedCopyWith<ProductImagesUpdated> get copyWith =>
      _$ProductImagesUpdatedCopyWithImpl<ProductImagesUpdated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductImagesUpdated &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @override
  String toString() {
    return 'ProductImagesEvent.imagesUpdated(images: $images)';
  }
}

/// @nodoc
abstract mixin class $ProductImagesUpdatedCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $ProductImagesUpdatedCopyWith(ProductImagesUpdated value,
          $Res Function(ProductImagesUpdated) _then) =
      _$ProductImagesUpdatedCopyWithImpl;
  @useResult
  $Res call({List<ProductImage> images});
}

/// @nodoc
class _$ProductImagesUpdatedCopyWithImpl<$Res>
    implements $ProductImagesUpdatedCopyWith<$Res> {
  _$ProductImagesUpdatedCopyWithImpl(this._self, this._then);

  final ProductImagesUpdated _self;
  final $Res Function(ProductImagesUpdated) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? images = null,
  }) {
    return _then(ProductImagesUpdated(
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
    ));
  }
}

/// @nodoc

class InsertProductImage implements ProductImagesEvent {
  const InsertProductImage({required this.image});

  final ProductImage image;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InsertProductImageCopyWith<InsertProductImage> get copyWith =>
      _$InsertProductImageCopyWithImpl<InsertProductImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InsertProductImage &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @override
  String toString() {
    return 'ProductImagesEvent.insert(image: $image)';
  }
}

/// @nodoc
abstract mixin class $InsertProductImageCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $InsertProductImageCopyWith(
          InsertProductImage value, $Res Function(InsertProductImage) _then) =
      _$InsertProductImageCopyWithImpl;
  @useResult
  $Res call({ProductImage image});
}

/// @nodoc
class _$InsertProductImageCopyWithImpl<$Res>
    implements $InsertProductImageCopyWith<$Res> {
  _$InsertProductImageCopyWithImpl(this._self, this._then);

  final InsertProductImage _self;
  final $Res Function(InsertProductImage) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? image = null,
  }) {
    return _then(InsertProductImage(
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage,
    ));
  }
}

/// @nodoc

class SetPrimaryProductImage implements ProductImagesEvent {
  const SetPrimaryProductImage(
      {required this.productId, required this.imageId});

  final int productId;
  final int imageId;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetPrimaryProductImageCopyWith<SetPrimaryProductImage> get copyWith =>
      _$SetPrimaryProductImageCopyWithImpl<SetPrimaryProductImage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetPrimaryProductImage &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, imageId);

  @override
  String toString() {
    return 'ProductImagesEvent.setPrimary(productId: $productId, imageId: $imageId)';
  }
}

/// @nodoc
abstract mixin class $SetPrimaryProductImageCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $SetPrimaryProductImageCopyWith(SetPrimaryProductImage value,
          $Res Function(SetPrimaryProductImage) _then) =
      _$SetPrimaryProductImageCopyWithImpl;
  @useResult
  $Res call({int productId, int imageId});
}

/// @nodoc
class _$SetPrimaryProductImageCopyWithImpl<$Res>
    implements $SetPrimaryProductImageCopyWith<$Res> {
  _$SetPrimaryProductImageCopyWithImpl(this._self, this._then);

  final SetPrimaryProductImage _self;
  final $Res Function(SetPrimaryProductImage) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? imageId = null,
  }) {
    return _then(SetPrimaryProductImage(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      imageId: null == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DeleteProductImage implements ProductImagesEvent {
  const DeleteProductImage({required this.id});

  final int id;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteProductImageCopyWith<DeleteProductImage> get copyWith =>
      _$DeleteProductImageCopyWithImpl<DeleteProductImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteProductImage &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductImagesEvent.delete(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteProductImageCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $DeleteProductImageCopyWith(
          DeleteProductImage value, $Res Function(DeleteProductImage) _then) =
      _$DeleteProductImageCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteProductImageCopyWithImpl<$Res>
    implements $DeleteProductImageCopyWith<$Res> {
  _$DeleteProductImageCopyWithImpl(this._self, this._then);

  final DeleteProductImage _self;
  final $Res Function(DeleteProductImage) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteProductImage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClearProductImagesMessages implements ProductImagesEvent {
  const ClearProductImagesMessages();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClearProductImagesMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductImagesEvent.clearMessages()';
  }
}

/// @nodoc

class ProductImagesStreamError implements ProductImagesEvent {
  const ProductImagesStreamError({required this.message});

  final String message;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductImagesStreamErrorCopyWith<ProductImagesStreamError> get copyWith =>
      _$ProductImagesStreamErrorCopyWithImpl<ProductImagesStreamError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductImagesStreamError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProductImagesEvent.streamError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProductImagesStreamErrorCopyWith<$Res>
    implements $ProductImagesEventCopyWith<$Res> {
  factory $ProductImagesStreamErrorCopyWith(ProductImagesStreamError value,
          $Res Function(ProductImagesStreamError) _then) =
      _$ProductImagesStreamErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProductImagesStreamErrorCopyWithImpl<$Res>
    implements $ProductImagesStreamErrorCopyWith<$Res> {
  _$ProductImagesStreamErrorCopyWithImpl(this._self, this._then);

  final ProductImagesStreamError _self;
  final $Res Function(ProductImagesStreamError) _then;

  /// Create a copy of ProductImagesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProductImagesStreamError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
