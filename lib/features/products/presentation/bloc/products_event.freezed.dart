// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent()';
  }
}

/// @nodoc
class $ProductsEventCopyWith<$Res> {
  $ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}

/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
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
    TResult Function(ProductsStarted value)? started,
    TResult Function(ProductsLoadAll value)? loadAll,
    TResult Function(ProductsWatchRequested value)? watchRequested,
    TResult Function(ProductsStopWatching value)? stopWatching,
    TResult Function(ProductsChanged value)? productsChanged,
    TResult Function(ProductsStreamFailed value)? streamFailed,
    TResult Function(ProductsGetById value)? getById,
    TResult Function(ProductsGetByBarcode value)? getByBarcode,
    TResult Function(ProductsSearch value)? search,
    TResult Function(ProductsCreate value)? create,
    TResult Function(ProductsUpdate value)? update,
    TResult Function(ProductsDelete value)? delete,
    TResult Function(ProductsClearSelection value)? clearSelection,
    TResult Function(ProductsLoadUnits value)? loadUnits,
    TResult Function(ProductsAddUnit value)? addUnit,
    TResult Function(ProductsUpdateUnit value)? updateUnit,
    TResult Function(ProductsDeleteUnit value)? deleteUnit,
    TResult Function(ProductsSetDefaultUnit value)? setDefaultUnit,
    TResult Function(ProductsLoadBarcodes value)? loadBarcodes,
    TResult Function(ProductsGetBarcodeDetails value)? getBarcodeDetails,
    TResult Function(ProductsAddBarcode value)? addBarcode,
    TResult Function(ProductsDeleteBarcode value)? deleteBarcode,
    TResult Function(ProductsSetDefaultBarcode value)? setDefaultBarcode,
    TResult Function(ProductsLoadImages value)? loadImages,
    TResult Function(ProductsAddImage value)? addImage,
    TResult Function(ProductsDeleteImage value)? deleteImage,
    TResult Function(ProductsSetPrimaryImage value)? setPrimaryImage,
    TResult Function(ProductsClearMessages value)? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted() when started != null:
        return started(_that);
      case ProductsLoadAll() when loadAll != null:
        return loadAll(_that);
      case ProductsWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case ProductsStopWatching() when stopWatching != null:
        return stopWatching(_that);
      case ProductsChanged() when productsChanged != null:
        return productsChanged(_that);
      case ProductsStreamFailed() when streamFailed != null:
        return streamFailed(_that);
      case ProductsGetById() when getById != null:
        return getById(_that);
      case ProductsGetByBarcode() when getByBarcode != null:
        return getByBarcode(_that);
      case ProductsSearch() when search != null:
        return search(_that);
      case ProductsCreate() when create != null:
        return create(_that);
      case ProductsUpdate() when update != null:
        return update(_that);
      case ProductsDelete() when delete != null:
        return delete(_that);
      case ProductsClearSelection() when clearSelection != null:
        return clearSelection(_that);
      case ProductsLoadUnits() when loadUnits != null:
        return loadUnits(_that);
      case ProductsAddUnit() when addUnit != null:
        return addUnit(_that);
      case ProductsUpdateUnit() when updateUnit != null:
        return updateUnit(_that);
      case ProductsDeleteUnit() when deleteUnit != null:
        return deleteUnit(_that);
      case ProductsSetDefaultUnit() when setDefaultUnit != null:
        return setDefaultUnit(_that);
      case ProductsLoadBarcodes() when loadBarcodes != null:
        return loadBarcodes(_that);
      case ProductsGetBarcodeDetails() when getBarcodeDetails != null:
        return getBarcodeDetails(_that);
      case ProductsAddBarcode() when addBarcode != null:
        return addBarcode(_that);
      case ProductsDeleteBarcode() when deleteBarcode != null:
        return deleteBarcode(_that);
      case ProductsSetDefaultBarcode() when setDefaultBarcode != null:
        return setDefaultBarcode(_that);
      case ProductsLoadImages() when loadImages != null:
        return loadImages(_that);
      case ProductsAddImage() when addImage != null:
        return addImage(_that);
      case ProductsDeleteImage() when deleteImage != null:
        return deleteImage(_that);
      case ProductsSetPrimaryImage() when setPrimaryImage != null:
        return setPrimaryImage(_that);
      case ProductsClearMessages() when clearMessages != null:
        return clearMessages(_that);
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
    required TResult Function(ProductsStarted value) started,
    required TResult Function(ProductsLoadAll value) loadAll,
    required TResult Function(ProductsWatchRequested value) watchRequested,
    required TResult Function(ProductsStopWatching value) stopWatching,
    required TResult Function(ProductsChanged value) productsChanged,
    required TResult Function(ProductsStreamFailed value) streamFailed,
    required TResult Function(ProductsGetById value) getById,
    required TResult Function(ProductsGetByBarcode value) getByBarcode,
    required TResult Function(ProductsSearch value) search,
    required TResult Function(ProductsCreate value) create,
    required TResult Function(ProductsUpdate value) update,
    required TResult Function(ProductsDelete value) delete,
    required TResult Function(ProductsClearSelection value) clearSelection,
    required TResult Function(ProductsLoadUnits value) loadUnits,
    required TResult Function(ProductsAddUnit value) addUnit,
    required TResult Function(ProductsUpdateUnit value) updateUnit,
    required TResult Function(ProductsDeleteUnit value) deleteUnit,
    required TResult Function(ProductsSetDefaultUnit value) setDefaultUnit,
    required TResult Function(ProductsLoadBarcodes value) loadBarcodes,
    required TResult Function(ProductsGetBarcodeDetails value)
        getBarcodeDetails,
    required TResult Function(ProductsAddBarcode value) addBarcode,
    required TResult Function(ProductsDeleteBarcode value) deleteBarcode,
    required TResult Function(ProductsSetDefaultBarcode value)
        setDefaultBarcode,
    required TResult Function(ProductsLoadImages value) loadImages,
    required TResult Function(ProductsAddImage value) addImage,
    required TResult Function(ProductsDeleteImage value) deleteImage,
    required TResult Function(ProductsSetPrimaryImage value) setPrimaryImage,
    required TResult Function(ProductsClearMessages value) clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted():
        return started(_that);
      case ProductsLoadAll():
        return loadAll(_that);
      case ProductsWatchRequested():
        return watchRequested(_that);
      case ProductsStopWatching():
        return stopWatching(_that);
      case ProductsChanged():
        return productsChanged(_that);
      case ProductsStreamFailed():
        return streamFailed(_that);
      case ProductsGetById():
        return getById(_that);
      case ProductsGetByBarcode():
        return getByBarcode(_that);
      case ProductsSearch():
        return search(_that);
      case ProductsCreate():
        return create(_that);
      case ProductsUpdate():
        return update(_that);
      case ProductsDelete():
        return delete(_that);
      case ProductsClearSelection():
        return clearSelection(_that);
      case ProductsLoadUnits():
        return loadUnits(_that);
      case ProductsAddUnit():
        return addUnit(_that);
      case ProductsUpdateUnit():
        return updateUnit(_that);
      case ProductsDeleteUnit():
        return deleteUnit(_that);
      case ProductsSetDefaultUnit():
        return setDefaultUnit(_that);
      case ProductsLoadBarcodes():
        return loadBarcodes(_that);
      case ProductsGetBarcodeDetails():
        return getBarcodeDetails(_that);
      case ProductsAddBarcode():
        return addBarcode(_that);
      case ProductsDeleteBarcode():
        return deleteBarcode(_that);
      case ProductsSetDefaultBarcode():
        return setDefaultBarcode(_that);
      case ProductsLoadImages():
        return loadImages(_that);
      case ProductsAddImage():
        return addImage(_that);
      case ProductsDeleteImage():
        return deleteImage(_that);
      case ProductsSetPrimaryImage():
        return setPrimaryImage(_that);
      case ProductsClearMessages():
        return clearMessages(_that);
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
    TResult? Function(ProductsStarted value)? started,
    TResult? Function(ProductsLoadAll value)? loadAll,
    TResult? Function(ProductsWatchRequested value)? watchRequested,
    TResult? Function(ProductsStopWatching value)? stopWatching,
    TResult? Function(ProductsChanged value)? productsChanged,
    TResult? Function(ProductsStreamFailed value)? streamFailed,
    TResult? Function(ProductsGetById value)? getById,
    TResult? Function(ProductsGetByBarcode value)? getByBarcode,
    TResult? Function(ProductsSearch value)? search,
    TResult? Function(ProductsCreate value)? create,
    TResult? Function(ProductsUpdate value)? update,
    TResult? Function(ProductsDelete value)? delete,
    TResult? Function(ProductsClearSelection value)? clearSelection,
    TResult? Function(ProductsLoadUnits value)? loadUnits,
    TResult? Function(ProductsAddUnit value)? addUnit,
    TResult? Function(ProductsUpdateUnit value)? updateUnit,
    TResult? Function(ProductsDeleteUnit value)? deleteUnit,
    TResult? Function(ProductsSetDefaultUnit value)? setDefaultUnit,
    TResult? Function(ProductsLoadBarcodes value)? loadBarcodes,
    TResult? Function(ProductsGetBarcodeDetails value)? getBarcodeDetails,
    TResult? Function(ProductsAddBarcode value)? addBarcode,
    TResult? Function(ProductsDeleteBarcode value)? deleteBarcode,
    TResult? Function(ProductsSetDefaultBarcode value)? setDefaultBarcode,
    TResult? Function(ProductsLoadImages value)? loadImages,
    TResult? Function(ProductsAddImage value)? addImage,
    TResult? Function(ProductsDeleteImage value)? deleteImage,
    TResult? Function(ProductsSetPrimaryImage value)? setPrimaryImage,
    TResult? Function(ProductsClearMessages value)? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted() when started != null:
        return started(_that);
      case ProductsLoadAll() when loadAll != null:
        return loadAll(_that);
      case ProductsWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case ProductsStopWatching() when stopWatching != null:
        return stopWatching(_that);
      case ProductsChanged() when productsChanged != null:
        return productsChanged(_that);
      case ProductsStreamFailed() when streamFailed != null:
        return streamFailed(_that);
      case ProductsGetById() when getById != null:
        return getById(_that);
      case ProductsGetByBarcode() when getByBarcode != null:
        return getByBarcode(_that);
      case ProductsSearch() when search != null:
        return search(_that);
      case ProductsCreate() when create != null:
        return create(_that);
      case ProductsUpdate() when update != null:
        return update(_that);
      case ProductsDelete() when delete != null:
        return delete(_that);
      case ProductsClearSelection() when clearSelection != null:
        return clearSelection(_that);
      case ProductsLoadUnits() when loadUnits != null:
        return loadUnits(_that);
      case ProductsAddUnit() when addUnit != null:
        return addUnit(_that);
      case ProductsUpdateUnit() when updateUnit != null:
        return updateUnit(_that);
      case ProductsDeleteUnit() when deleteUnit != null:
        return deleteUnit(_that);
      case ProductsSetDefaultUnit() when setDefaultUnit != null:
        return setDefaultUnit(_that);
      case ProductsLoadBarcodes() when loadBarcodes != null:
        return loadBarcodes(_that);
      case ProductsGetBarcodeDetails() when getBarcodeDetails != null:
        return getBarcodeDetails(_that);
      case ProductsAddBarcode() when addBarcode != null:
        return addBarcode(_that);
      case ProductsDeleteBarcode() when deleteBarcode != null:
        return deleteBarcode(_that);
      case ProductsSetDefaultBarcode() when setDefaultBarcode != null:
        return setDefaultBarcode(_that);
      case ProductsLoadImages() when loadImages != null:
        return loadImages(_that);
      case ProductsAddImage() when addImage != null:
        return addImage(_that);
      case ProductsDeleteImage() when deleteImage != null:
        return deleteImage(_that);
      case ProductsSetPrimaryImage() when setPrimaryImage != null:
        return setPrimaryImage(_that);
      case ProductsClearMessages() when clearMessages != null:
        return clearMessages(_that);
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
    TResult Function()? started,
    TResult Function()? loadAll,
    TResult Function()? watchRequested,
    TResult Function()? stopWatching,
    TResult Function(List<Product> products)? productsChanged,
    TResult Function(String message)? streamFailed,
    TResult Function(int id)? getById,
    TResult Function(String barcode)? getByBarcode,
    TResult Function(String query)? search,
    TResult Function(Product product)? create,
    TResult Function(Product product)? update,
    TResult Function(int id)? delete,
    TResult Function()? clearSelection,
    TResult Function(int productId)? loadUnits,
    TResult Function(ProductUnit unit)? addUnit,
    TResult Function(ProductUnit unit)? updateUnit,
    TResult Function(int id, int productId)? deleteUnit,
    TResult Function(int productId, int unitId)? setDefaultUnit,
    TResult Function(int productId)? loadBarcodes,
    TResult Function(String barcode)? getBarcodeDetails,
    TResult Function(ProductBarcode barcode)? addBarcode,
    TResult Function(int id, int productId)? deleteBarcode,
    TResult Function(int id, int productId)? setDefaultBarcode,
    TResult Function(int productId)? loadImages,
    TResult Function(ProductImage image)? addImage,
    TResult Function(int id, int productId)? deleteImage,
    TResult Function(int id, int productId)? setPrimaryImage,
    TResult Function()? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted() when started != null:
        return started();
      case ProductsLoadAll() when loadAll != null:
        return loadAll();
      case ProductsWatchRequested() when watchRequested != null:
        return watchRequested();
      case ProductsStopWatching() when stopWatching != null:
        return stopWatching();
      case ProductsChanged() when productsChanged != null:
        return productsChanged(_that.products);
      case ProductsStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
      case ProductsGetById() when getById != null:
        return getById(_that.id);
      case ProductsGetByBarcode() when getByBarcode != null:
        return getByBarcode(_that.barcode);
      case ProductsSearch() when search != null:
        return search(_that.query);
      case ProductsCreate() when create != null:
        return create(_that.product);
      case ProductsUpdate() when update != null:
        return update(_that.product);
      case ProductsDelete() when delete != null:
        return delete(_that.id);
      case ProductsClearSelection() when clearSelection != null:
        return clearSelection();
      case ProductsLoadUnits() when loadUnits != null:
        return loadUnits(_that.productId);
      case ProductsAddUnit() when addUnit != null:
        return addUnit(_that.unit);
      case ProductsUpdateUnit() when updateUnit != null:
        return updateUnit(_that.unit);
      case ProductsDeleteUnit() when deleteUnit != null:
        return deleteUnit(_that.id, _that.productId);
      case ProductsSetDefaultUnit() when setDefaultUnit != null:
        return setDefaultUnit(_that.productId, _that.unitId);
      case ProductsLoadBarcodes() when loadBarcodes != null:
        return loadBarcodes(_that.productId);
      case ProductsGetBarcodeDetails() when getBarcodeDetails != null:
        return getBarcodeDetails(_that.barcode);
      case ProductsAddBarcode() when addBarcode != null:
        return addBarcode(_that.barcode);
      case ProductsDeleteBarcode() when deleteBarcode != null:
        return deleteBarcode(_that.id, _that.productId);
      case ProductsSetDefaultBarcode() when setDefaultBarcode != null:
        return setDefaultBarcode(_that.id, _that.productId);
      case ProductsLoadImages() when loadImages != null:
        return loadImages(_that.productId);
      case ProductsAddImage() when addImage != null:
        return addImage(_that.image);
      case ProductsDeleteImage() when deleteImage != null:
        return deleteImage(_that.id, _that.productId);
      case ProductsSetPrimaryImage() when setPrimaryImage != null:
        return setPrimaryImage(_that.id, _that.productId);
      case ProductsClearMessages() when clearMessages != null:
        return clearMessages();
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
    required TResult Function() started,
    required TResult Function() loadAll,
    required TResult Function() watchRequested,
    required TResult Function() stopWatching,
    required TResult Function(List<Product> products) productsChanged,
    required TResult Function(String message) streamFailed,
    required TResult Function(int id) getById,
    required TResult Function(String barcode) getByBarcode,
    required TResult Function(String query) search,
    required TResult Function(Product product) create,
    required TResult Function(Product product) update,
    required TResult Function(int id) delete,
    required TResult Function() clearSelection,
    required TResult Function(int productId) loadUnits,
    required TResult Function(ProductUnit unit) addUnit,
    required TResult Function(ProductUnit unit) updateUnit,
    required TResult Function(int id, int productId) deleteUnit,
    required TResult Function(int productId, int unitId) setDefaultUnit,
    required TResult Function(int productId) loadBarcodes,
    required TResult Function(String barcode) getBarcodeDetails,
    required TResult Function(ProductBarcode barcode) addBarcode,
    required TResult Function(int id, int productId) deleteBarcode,
    required TResult Function(int id, int productId) setDefaultBarcode,
    required TResult Function(int productId) loadImages,
    required TResult Function(ProductImage image) addImage,
    required TResult Function(int id, int productId) deleteImage,
    required TResult Function(int id, int productId) setPrimaryImage,
    required TResult Function() clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted():
        return started();
      case ProductsLoadAll():
        return loadAll();
      case ProductsWatchRequested():
        return watchRequested();
      case ProductsStopWatching():
        return stopWatching();
      case ProductsChanged():
        return productsChanged(_that.products);
      case ProductsStreamFailed():
        return streamFailed(_that.message);
      case ProductsGetById():
        return getById(_that.id);
      case ProductsGetByBarcode():
        return getByBarcode(_that.barcode);
      case ProductsSearch():
        return search(_that.query);
      case ProductsCreate():
        return create(_that.product);
      case ProductsUpdate():
        return update(_that.product);
      case ProductsDelete():
        return delete(_that.id);
      case ProductsClearSelection():
        return clearSelection();
      case ProductsLoadUnits():
        return loadUnits(_that.productId);
      case ProductsAddUnit():
        return addUnit(_that.unit);
      case ProductsUpdateUnit():
        return updateUnit(_that.unit);
      case ProductsDeleteUnit():
        return deleteUnit(_that.id, _that.productId);
      case ProductsSetDefaultUnit():
        return setDefaultUnit(_that.productId, _that.unitId);
      case ProductsLoadBarcodes():
        return loadBarcodes(_that.productId);
      case ProductsGetBarcodeDetails():
        return getBarcodeDetails(_that.barcode);
      case ProductsAddBarcode():
        return addBarcode(_that.barcode);
      case ProductsDeleteBarcode():
        return deleteBarcode(_that.id, _that.productId);
      case ProductsSetDefaultBarcode():
        return setDefaultBarcode(_that.id, _that.productId);
      case ProductsLoadImages():
        return loadImages(_that.productId);
      case ProductsAddImage():
        return addImage(_that.image);
      case ProductsDeleteImage():
        return deleteImage(_that.id, _that.productId);
      case ProductsSetPrimaryImage():
        return setPrimaryImage(_that.id, _that.productId);
      case ProductsClearMessages():
        return clearMessages();
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
    TResult? Function()? started,
    TResult? Function()? loadAll,
    TResult? Function()? watchRequested,
    TResult? Function()? stopWatching,
    TResult? Function(List<Product> products)? productsChanged,
    TResult? Function(String message)? streamFailed,
    TResult? Function(int id)? getById,
    TResult? Function(String barcode)? getByBarcode,
    TResult? Function(String query)? search,
    TResult? Function(Product product)? create,
    TResult? Function(Product product)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clearSelection,
    TResult? Function(int productId)? loadUnits,
    TResult? Function(ProductUnit unit)? addUnit,
    TResult? Function(ProductUnit unit)? updateUnit,
    TResult? Function(int id, int productId)? deleteUnit,
    TResult? Function(int productId, int unitId)? setDefaultUnit,
    TResult? Function(int productId)? loadBarcodes,
    TResult? Function(String barcode)? getBarcodeDetails,
    TResult? Function(ProductBarcode barcode)? addBarcode,
    TResult? Function(int id, int productId)? deleteBarcode,
    TResult? Function(int id, int productId)? setDefaultBarcode,
    TResult? Function(int productId)? loadImages,
    TResult? Function(ProductImage image)? addImage,
    TResult? Function(int id, int productId)? deleteImage,
    TResult? Function(int id, int productId)? setPrimaryImage,
    TResult? Function()? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case ProductsStarted() when started != null:
        return started();
      case ProductsLoadAll() when loadAll != null:
        return loadAll();
      case ProductsWatchRequested() when watchRequested != null:
        return watchRequested();
      case ProductsStopWatching() when stopWatching != null:
        return stopWatching();
      case ProductsChanged() when productsChanged != null:
        return productsChanged(_that.products);
      case ProductsStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
      case ProductsGetById() when getById != null:
        return getById(_that.id);
      case ProductsGetByBarcode() when getByBarcode != null:
        return getByBarcode(_that.barcode);
      case ProductsSearch() when search != null:
        return search(_that.query);
      case ProductsCreate() when create != null:
        return create(_that.product);
      case ProductsUpdate() when update != null:
        return update(_that.product);
      case ProductsDelete() when delete != null:
        return delete(_that.id);
      case ProductsClearSelection() when clearSelection != null:
        return clearSelection();
      case ProductsLoadUnits() when loadUnits != null:
        return loadUnits(_that.productId);
      case ProductsAddUnit() when addUnit != null:
        return addUnit(_that.unit);
      case ProductsUpdateUnit() when updateUnit != null:
        return updateUnit(_that.unit);
      case ProductsDeleteUnit() when deleteUnit != null:
        return deleteUnit(_that.id, _that.productId);
      case ProductsSetDefaultUnit() when setDefaultUnit != null:
        return setDefaultUnit(_that.productId, _that.unitId);
      case ProductsLoadBarcodes() when loadBarcodes != null:
        return loadBarcodes(_that.productId);
      case ProductsGetBarcodeDetails() when getBarcodeDetails != null:
        return getBarcodeDetails(_that.barcode);
      case ProductsAddBarcode() when addBarcode != null:
        return addBarcode(_that.barcode);
      case ProductsDeleteBarcode() when deleteBarcode != null:
        return deleteBarcode(_that.id, _that.productId);
      case ProductsSetDefaultBarcode() when setDefaultBarcode != null:
        return setDefaultBarcode(_that.id, _that.productId);
      case ProductsLoadImages() when loadImages != null:
        return loadImages(_that.productId);
      case ProductsAddImage() when addImage != null:
        return addImage(_that.image);
      case ProductsDeleteImage() when deleteImage != null:
        return deleteImage(_that.id, _that.productId);
      case ProductsSetPrimaryImage() when setPrimaryImage != null:
        return setPrimaryImage(_that.id, _that.productId);
      case ProductsClearMessages() when clearMessages != null:
        return clearMessages();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProductsStarted implements ProductsEvent {
  const ProductsStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.started()';
  }
}

/// @nodoc

class ProductsLoadAll implements ProductsEvent {
  const ProductsLoadAll();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsLoadAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.loadAll()';
  }
}

/// @nodoc

class ProductsWatchRequested implements ProductsEvent {
  const ProductsWatchRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsWatchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.watchRequested()';
  }
}

/// @nodoc

class ProductsStopWatching implements ProductsEvent {
  const ProductsStopWatching();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsStopWatching);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.stopWatching()';
  }
}

/// @nodoc

class ProductsChanged implements ProductsEvent {
  const ProductsChanged(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsChangedCopyWith<ProductsChanged> get copyWith =>
      _$ProductsChangedCopyWithImpl<ProductsChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsChanged &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'ProductsEvent.productsChanged(products: $products)';
  }
}

/// @nodoc
abstract mixin class $ProductsChangedCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsChangedCopyWith(
          ProductsChanged value, $Res Function(ProductsChanged) _then) =
      _$ProductsChangedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ProductsChangedCopyWithImpl<$Res>
    implements $ProductsChangedCopyWith<$Res> {
  _$ProductsChangedCopyWithImpl(this._self, this._then);

  final ProductsChanged _self;
  final $Res Function(ProductsChanged) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(ProductsChanged(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class ProductsStreamFailed implements ProductsEvent {
  const ProductsStreamFailed(this.message);

  final String message;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsStreamFailedCopyWith<ProductsStreamFailed> get copyWith =>
      _$ProductsStreamFailedCopyWithImpl<ProductsStreamFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsStreamFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProductsEvent.streamFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProductsStreamFailedCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsStreamFailedCopyWith(ProductsStreamFailed value,
          $Res Function(ProductsStreamFailed) _then) =
      _$ProductsStreamFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProductsStreamFailedCopyWithImpl<$Res>
    implements $ProductsStreamFailedCopyWith<$Res> {
  _$ProductsStreamFailedCopyWithImpl(this._self, this._then);

  final ProductsStreamFailed _self;
  final $Res Function(ProductsStreamFailed) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProductsStreamFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProductsGetById implements ProductsEvent {
  const ProductsGetById(this.id);

  final int id;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsGetByIdCopyWith<ProductsGetById> get copyWith =>
      _$ProductsGetByIdCopyWithImpl<ProductsGetById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsGetById &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductsEvent.getById(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ProductsGetByIdCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsGetByIdCopyWith(
          ProductsGetById value, $Res Function(ProductsGetById) _then) =
      _$ProductsGetByIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ProductsGetByIdCopyWithImpl<$Res>
    implements $ProductsGetByIdCopyWith<$Res> {
  _$ProductsGetByIdCopyWithImpl(this._self, this._then);

  final ProductsGetById _self;
  final $Res Function(ProductsGetById) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ProductsGetById(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsGetByBarcode implements ProductsEvent {
  const ProductsGetByBarcode(this.barcode);

  final String barcode;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsGetByBarcodeCopyWith<ProductsGetByBarcode> get copyWith =>
      _$ProductsGetByBarcodeCopyWithImpl<ProductsGetByBarcode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsGetByBarcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'ProductsEvent.getByBarcode(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $ProductsGetByBarcodeCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsGetByBarcodeCopyWith(ProductsGetByBarcode value,
          $Res Function(ProductsGetByBarcode) _then) =
      _$ProductsGetByBarcodeCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class _$ProductsGetByBarcodeCopyWithImpl<$Res>
    implements $ProductsGetByBarcodeCopyWith<$Res> {
  _$ProductsGetByBarcodeCopyWithImpl(this._self, this._then);

  final ProductsGetByBarcode _self;
  final $Res Function(ProductsGetByBarcode) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(ProductsGetByBarcode(
      null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProductsSearch implements ProductsEvent {
  const ProductsSearch(this.query);

  final String query;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsSearchCopyWith<ProductsSearch> get copyWith =>
      _$ProductsSearchCopyWithImpl<ProductsSearch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsSearch &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'ProductsEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class $ProductsSearchCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSearchCopyWith(
          ProductsSearch value, $Res Function(ProductsSearch) _then) =
      _$ProductsSearchCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$ProductsSearchCopyWithImpl<$Res>
    implements $ProductsSearchCopyWith<$Res> {
  _$ProductsSearchCopyWithImpl(this._self, this._then);

  final ProductsSearch _self;
  final $Res Function(ProductsSearch) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(ProductsSearch(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProductsCreate implements ProductsEvent {
  const ProductsCreate(this.product);

  final Product product;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsCreateCopyWith<ProductsCreate> get copyWith =>
      _$ProductsCreateCopyWithImpl<ProductsCreate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsCreate &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductsEvent.create(product: $product)';
  }
}

/// @nodoc
abstract mixin class $ProductsCreateCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsCreateCopyWith(
          ProductsCreate value, $Res Function(ProductsCreate) _then) =
      _$ProductsCreateCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$ProductsCreateCopyWithImpl<$Res>
    implements $ProductsCreateCopyWith<$Res> {
  _$ProductsCreateCopyWithImpl(this._self, this._then);

  final ProductsCreate _self;
  final $Res Function(ProductsCreate) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(ProductsCreate(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class ProductsUpdate implements ProductsEvent {
  const ProductsUpdate(this.product);

  final Product product;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsUpdateCopyWith<ProductsUpdate> get copyWith =>
      _$ProductsUpdateCopyWithImpl<ProductsUpdate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsUpdate &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductsEvent.update(product: $product)';
  }
}

/// @nodoc
abstract mixin class $ProductsUpdateCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsUpdateCopyWith(
          ProductsUpdate value, $Res Function(ProductsUpdate) _then) =
      _$ProductsUpdateCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$ProductsUpdateCopyWithImpl<$Res>
    implements $ProductsUpdateCopyWith<$Res> {
  _$ProductsUpdateCopyWithImpl(this._self, this._then);

  final ProductsUpdate _self;
  final $Res Function(ProductsUpdate) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(ProductsUpdate(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class ProductsDelete implements ProductsEvent {
  const ProductsDelete(this.id);

  final int id;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsDeleteCopyWith<ProductsDelete> get copyWith =>
      _$ProductsDeleteCopyWithImpl<ProductsDelete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsDelete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductsEvent.delete(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ProductsDeleteCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsDeleteCopyWith(
          ProductsDelete value, $Res Function(ProductsDelete) _then) =
      _$ProductsDeleteCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ProductsDeleteCopyWithImpl<$Res>
    implements $ProductsDeleteCopyWith<$Res> {
  _$ProductsDeleteCopyWithImpl(this._self, this._then);

  final ProductsDelete _self;
  final $Res Function(ProductsDelete) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ProductsDelete(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsClearSelection implements ProductsEvent {
  const ProductsClearSelection();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsClearSelection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.clearSelection()';
  }
}

/// @nodoc

class ProductsLoadUnits implements ProductsEvent {
  const ProductsLoadUnits(this.productId);

  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsLoadUnitsCopyWith<ProductsLoadUnits> get copyWith =>
      _$ProductsLoadUnitsCopyWithImpl<ProductsLoadUnits>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsLoadUnits &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductsEvent.loadUnits(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsLoadUnitsCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsLoadUnitsCopyWith(
          ProductsLoadUnits value, $Res Function(ProductsLoadUnits) _then) =
      _$ProductsLoadUnitsCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$ProductsLoadUnitsCopyWithImpl<$Res>
    implements $ProductsLoadUnitsCopyWith<$Res> {
  _$ProductsLoadUnitsCopyWithImpl(this._self, this._then);

  final ProductsLoadUnits _self;
  final $Res Function(ProductsLoadUnits) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(ProductsLoadUnits(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsAddUnit implements ProductsEvent {
  const ProductsAddUnit(this.unit);

  final ProductUnit unit;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsAddUnitCopyWith<ProductsAddUnit> get copyWith =>
      _$ProductsAddUnitCopyWithImpl<ProductsAddUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsAddUnit &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  @override
  String toString() {
    return 'ProductsEvent.addUnit(unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $ProductsAddUnitCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAddUnitCopyWith(
          ProductsAddUnit value, $Res Function(ProductsAddUnit) _then) =
      _$ProductsAddUnitCopyWithImpl;
  @useResult
  $Res call({ProductUnit unit});
}

/// @nodoc
class _$ProductsAddUnitCopyWithImpl<$Res>
    implements $ProductsAddUnitCopyWith<$Res> {
  _$ProductsAddUnitCopyWithImpl(this._self, this._then);

  final ProductsAddUnit _self;
  final $Res Function(ProductsAddUnit) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
  }) {
    return _then(ProductsAddUnit(
      null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ProductUnit,
    ));
  }
}

/// @nodoc

class ProductsUpdateUnit implements ProductsEvent {
  const ProductsUpdateUnit(this.unit);

  final ProductUnit unit;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsUpdateUnitCopyWith<ProductsUpdateUnit> get copyWith =>
      _$ProductsUpdateUnitCopyWithImpl<ProductsUpdateUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsUpdateUnit &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  @override
  String toString() {
    return 'ProductsEvent.updateUnit(unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $ProductsUpdateUnitCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsUpdateUnitCopyWith(
          ProductsUpdateUnit value, $Res Function(ProductsUpdateUnit) _then) =
      _$ProductsUpdateUnitCopyWithImpl;
  @useResult
  $Res call({ProductUnit unit});
}

/// @nodoc
class _$ProductsUpdateUnitCopyWithImpl<$Res>
    implements $ProductsUpdateUnitCopyWith<$Res> {
  _$ProductsUpdateUnitCopyWithImpl(this._self, this._then);

  final ProductsUpdateUnit _self;
  final $Res Function(ProductsUpdateUnit) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
  }) {
    return _then(ProductsUpdateUnit(
      null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ProductUnit,
    ));
  }
}

/// @nodoc

class ProductsDeleteUnit implements ProductsEvent {
  const ProductsDeleteUnit({required this.id, required this.productId});

  final int id;
  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsDeleteUnitCopyWith<ProductsDeleteUnit> get copyWith =>
      _$ProductsDeleteUnitCopyWithImpl<ProductsDeleteUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsDeleteUnit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @override
  String toString() {
    return 'ProductsEvent.deleteUnit(id: $id, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsDeleteUnitCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsDeleteUnitCopyWith(
          ProductsDeleteUnit value, $Res Function(ProductsDeleteUnit) _then) =
      _$ProductsDeleteUnitCopyWithImpl;
  @useResult
  $Res call({int id, int productId});
}

/// @nodoc
class _$ProductsDeleteUnitCopyWithImpl<$Res>
    implements $ProductsDeleteUnitCopyWith<$Res> {
  _$ProductsDeleteUnitCopyWithImpl(this._self, this._then);

  final ProductsDeleteUnit _self;
  final $Res Function(ProductsDeleteUnit) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(ProductsDeleteUnit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsSetDefaultUnit implements ProductsEvent {
  const ProductsSetDefaultUnit({required this.productId, required this.unitId});

  final int productId;
  final int unitId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsSetDefaultUnitCopyWith<ProductsSetDefaultUnit> get copyWith =>
      _$ProductsSetDefaultUnitCopyWithImpl<ProductsSetDefaultUnit>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsSetDefaultUnit &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, unitId);

  @override
  String toString() {
    return 'ProductsEvent.setDefaultUnit(productId: $productId, unitId: $unitId)';
  }
}

/// @nodoc
abstract mixin class $ProductsSetDefaultUnitCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSetDefaultUnitCopyWith(ProductsSetDefaultUnit value,
          $Res Function(ProductsSetDefaultUnit) _then) =
      _$ProductsSetDefaultUnitCopyWithImpl;
  @useResult
  $Res call({int productId, int unitId});
}

/// @nodoc
class _$ProductsSetDefaultUnitCopyWithImpl<$Res>
    implements $ProductsSetDefaultUnitCopyWith<$Res> {
  _$ProductsSetDefaultUnitCopyWithImpl(this._self, this._then);

  final ProductsSetDefaultUnit _self;
  final $Res Function(ProductsSetDefaultUnit) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? unitId = null,
  }) {
    return _then(ProductsSetDefaultUnit(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsLoadBarcodes implements ProductsEvent {
  const ProductsLoadBarcodes(this.productId);

  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsLoadBarcodesCopyWith<ProductsLoadBarcodes> get copyWith =>
      _$ProductsLoadBarcodesCopyWithImpl<ProductsLoadBarcodes>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsLoadBarcodes &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductsEvent.loadBarcodes(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsLoadBarcodesCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsLoadBarcodesCopyWith(ProductsLoadBarcodes value,
          $Res Function(ProductsLoadBarcodes) _then) =
      _$ProductsLoadBarcodesCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$ProductsLoadBarcodesCopyWithImpl<$Res>
    implements $ProductsLoadBarcodesCopyWith<$Res> {
  _$ProductsLoadBarcodesCopyWithImpl(this._self, this._then);

  final ProductsLoadBarcodes _self;
  final $Res Function(ProductsLoadBarcodes) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(ProductsLoadBarcodes(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsGetBarcodeDetails implements ProductsEvent {
  const ProductsGetBarcodeDetails(this.barcode);

  final String barcode;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsGetBarcodeDetailsCopyWith<ProductsGetBarcodeDetails> get copyWith =>
      _$ProductsGetBarcodeDetailsCopyWithImpl<ProductsGetBarcodeDetails>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsGetBarcodeDetails &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'ProductsEvent.getBarcodeDetails(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $ProductsGetBarcodeDetailsCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsGetBarcodeDetailsCopyWith(ProductsGetBarcodeDetails value,
          $Res Function(ProductsGetBarcodeDetails) _then) =
      _$ProductsGetBarcodeDetailsCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class _$ProductsGetBarcodeDetailsCopyWithImpl<$Res>
    implements $ProductsGetBarcodeDetailsCopyWith<$Res> {
  _$ProductsGetBarcodeDetailsCopyWithImpl(this._self, this._then);

  final ProductsGetBarcodeDetails _self;
  final $Res Function(ProductsGetBarcodeDetails) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(ProductsGetBarcodeDetails(
      null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProductsAddBarcode implements ProductsEvent {
  const ProductsAddBarcode(this.barcode);

  final ProductBarcode barcode;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsAddBarcodeCopyWith<ProductsAddBarcode> get copyWith =>
      _$ProductsAddBarcodeCopyWithImpl<ProductsAddBarcode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsAddBarcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'ProductsEvent.addBarcode(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $ProductsAddBarcodeCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAddBarcodeCopyWith(
          ProductsAddBarcode value, $Res Function(ProductsAddBarcode) _then) =
      _$ProductsAddBarcodeCopyWithImpl;
  @useResult
  $Res call({ProductBarcode barcode});
}

/// @nodoc
class _$ProductsAddBarcodeCopyWithImpl<$Res>
    implements $ProductsAddBarcodeCopyWith<$Res> {
  _$ProductsAddBarcodeCopyWithImpl(this._self, this._then);

  final ProductsAddBarcode _self;
  final $Res Function(ProductsAddBarcode) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(ProductsAddBarcode(
      null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode,
    ));
  }
}

/// @nodoc

class ProductsDeleteBarcode implements ProductsEvent {
  const ProductsDeleteBarcode({required this.id, required this.productId});

  final int id;
  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsDeleteBarcodeCopyWith<ProductsDeleteBarcode> get copyWith =>
      _$ProductsDeleteBarcodeCopyWithImpl<ProductsDeleteBarcode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsDeleteBarcode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @override
  String toString() {
    return 'ProductsEvent.deleteBarcode(id: $id, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsDeleteBarcodeCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsDeleteBarcodeCopyWith(ProductsDeleteBarcode value,
          $Res Function(ProductsDeleteBarcode) _then) =
      _$ProductsDeleteBarcodeCopyWithImpl;
  @useResult
  $Res call({int id, int productId});
}

/// @nodoc
class _$ProductsDeleteBarcodeCopyWithImpl<$Res>
    implements $ProductsDeleteBarcodeCopyWith<$Res> {
  _$ProductsDeleteBarcodeCopyWithImpl(this._self, this._then);

  final ProductsDeleteBarcode _self;
  final $Res Function(ProductsDeleteBarcode) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(ProductsDeleteBarcode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsSetDefaultBarcode implements ProductsEvent {
  const ProductsSetDefaultBarcode({required this.id, required this.productId});

  final int id;
  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsSetDefaultBarcodeCopyWith<ProductsSetDefaultBarcode> get copyWith =>
      _$ProductsSetDefaultBarcodeCopyWithImpl<ProductsSetDefaultBarcode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsSetDefaultBarcode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @override
  String toString() {
    return 'ProductsEvent.setDefaultBarcode(id: $id, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsSetDefaultBarcodeCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSetDefaultBarcodeCopyWith(ProductsSetDefaultBarcode value,
          $Res Function(ProductsSetDefaultBarcode) _then) =
      _$ProductsSetDefaultBarcodeCopyWithImpl;
  @useResult
  $Res call({int id, int productId});
}

/// @nodoc
class _$ProductsSetDefaultBarcodeCopyWithImpl<$Res>
    implements $ProductsSetDefaultBarcodeCopyWith<$Res> {
  _$ProductsSetDefaultBarcodeCopyWithImpl(this._self, this._then);

  final ProductsSetDefaultBarcode _self;
  final $Res Function(ProductsSetDefaultBarcode) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(ProductsSetDefaultBarcode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsLoadImages implements ProductsEvent {
  const ProductsLoadImages(this.productId);

  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsLoadImagesCopyWith<ProductsLoadImages> get copyWith =>
      _$ProductsLoadImagesCopyWithImpl<ProductsLoadImages>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsLoadImages &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductsEvent.loadImages(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsLoadImagesCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsLoadImagesCopyWith(
          ProductsLoadImages value, $Res Function(ProductsLoadImages) _then) =
      _$ProductsLoadImagesCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$ProductsLoadImagesCopyWithImpl<$Res>
    implements $ProductsLoadImagesCopyWith<$Res> {
  _$ProductsLoadImagesCopyWithImpl(this._self, this._then);

  final ProductsLoadImages _self;
  final $Res Function(ProductsLoadImages) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(ProductsLoadImages(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsAddImage implements ProductsEvent {
  const ProductsAddImage(this.image);

  final ProductImage image;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsAddImageCopyWith<ProductsAddImage> get copyWith =>
      _$ProductsAddImageCopyWithImpl<ProductsAddImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsAddImage &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @override
  String toString() {
    return 'ProductsEvent.addImage(image: $image)';
  }
}

/// @nodoc
abstract mixin class $ProductsAddImageCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAddImageCopyWith(
          ProductsAddImage value, $Res Function(ProductsAddImage) _then) =
      _$ProductsAddImageCopyWithImpl;
  @useResult
  $Res call({ProductImage image});
}

/// @nodoc
class _$ProductsAddImageCopyWithImpl<$Res>
    implements $ProductsAddImageCopyWith<$Res> {
  _$ProductsAddImageCopyWithImpl(this._self, this._then);

  final ProductsAddImage _self;
  final $Res Function(ProductsAddImage) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? image = null,
  }) {
    return _then(ProductsAddImage(
      null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage,
    ));
  }
}

/// @nodoc

class ProductsDeleteImage implements ProductsEvent {
  const ProductsDeleteImage({required this.id, required this.productId});

  final int id;
  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsDeleteImageCopyWith<ProductsDeleteImage> get copyWith =>
      _$ProductsDeleteImageCopyWithImpl<ProductsDeleteImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsDeleteImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @override
  String toString() {
    return 'ProductsEvent.deleteImage(id: $id, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsDeleteImageCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsDeleteImageCopyWith(
          ProductsDeleteImage value, $Res Function(ProductsDeleteImage) _then) =
      _$ProductsDeleteImageCopyWithImpl;
  @useResult
  $Res call({int id, int productId});
}

/// @nodoc
class _$ProductsDeleteImageCopyWithImpl<$Res>
    implements $ProductsDeleteImageCopyWith<$Res> {
  _$ProductsDeleteImageCopyWithImpl(this._self, this._then);

  final ProductsDeleteImage _self;
  final $Res Function(ProductsDeleteImage) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(ProductsDeleteImage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsSetPrimaryImage implements ProductsEvent {
  const ProductsSetPrimaryImage({required this.id, required this.productId});

  final int id;
  final int productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsSetPrimaryImageCopyWith<ProductsSetPrimaryImage> get copyWith =>
      _$ProductsSetPrimaryImageCopyWithImpl<ProductsSetPrimaryImage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsSetPrimaryImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @override
  String toString() {
    return 'ProductsEvent.setPrimaryImage(id: $id, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $ProductsSetPrimaryImageCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSetPrimaryImageCopyWith(ProductsSetPrimaryImage value,
          $Res Function(ProductsSetPrimaryImage) _then) =
      _$ProductsSetPrimaryImageCopyWithImpl;
  @useResult
  $Res call({int id, int productId});
}

/// @nodoc
class _$ProductsSetPrimaryImageCopyWithImpl<$Res>
    implements $ProductsSetPrimaryImageCopyWith<$Res> {
  _$ProductsSetPrimaryImageCopyWithImpl(this._self, this._then);

  final ProductsSetPrimaryImage _self;
  final $Res Function(ProductsSetPrimaryImage) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(ProductsSetPrimaryImage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductsClearMessages implements ProductsEvent {
  const ProductsClearMessages();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductsClearMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.clearMessages()';
  }
}

// dart format on
