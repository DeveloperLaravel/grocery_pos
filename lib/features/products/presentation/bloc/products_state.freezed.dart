// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsState {
// =======================================================
// Products
// =======================================================
  List<Product> get products;
  List<Product> get allProducts;
  Product? get selectedProduct;
  Product? get barcodeProduct;
  String
      get searchQuery; // =======================================================
// Current Product
// =======================================================
  int?
      get currentProductId; // =======================================================
// Product Units
// =======================================================
  List<ProductUnit>
      get units; // =======================================================
// Product Barcodes
// =======================================================
  List<ProductBarcode> get barcodes;
  ProductBarcode?
      get selectedBarcode; // =======================================================
// Product Images
// =======================================================
  List<ProductImage>
      get images; // =======================================================
// Loading States
// =======================================================
  bool get isLoading;
  bool get isSaving;
  bool get isDeleting;
  bool get isSearching;
  bool get isLoadingProduct;
  bool get isLoadingUnits;
  bool get isLoadingBarcodes;
  bool get isLoadingImages;
  bool
      get isWatching; // =======================================================
// Operation Results
// =======================================================
  int? get lastCreatedProductId;
  int? get lastCreatedUnitId;
  int? get lastCreatedBarcodeId;
  int?
      get lastCreatedImageId; // =======================================================
// Messages
// =======================================================
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      _$ProductsStateCopyWithImpl<ProductsState>(
          this as ProductsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsState &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.allProducts, allProducts) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.barcodeProduct, barcodeProduct) ||
                other.barcodeProduct == barcodeProduct) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId) &&
            const DeepCollectionEquality().equals(other.units, units) &&
            const DeepCollectionEquality().equals(other.barcodes, barcodes) &&
            (identical(other.selectedBarcode, selectedBarcode) ||
                other.selectedBarcode == selectedBarcode) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isLoadingProduct, isLoadingProduct) ||
                other.isLoadingProduct == isLoadingProduct) &&
            (identical(other.isLoadingUnits, isLoadingUnits) ||
                other.isLoadingUnits == isLoadingUnits) &&
            (identical(other.isLoadingBarcodes, isLoadingBarcodes) ||
                other.isLoadingBarcodes == isLoadingBarcodes) &&
            (identical(other.isLoadingImages, isLoadingImages) ||
                other.isLoadingImages == isLoadingImages) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.lastCreatedProductId, lastCreatedProductId) ||
                other.lastCreatedProductId == lastCreatedProductId) &&
            (identical(other.lastCreatedUnitId, lastCreatedUnitId) ||
                other.lastCreatedUnitId == lastCreatedUnitId) &&
            (identical(other.lastCreatedBarcodeId, lastCreatedBarcodeId) ||
                other.lastCreatedBarcodeId == lastCreatedBarcodeId) &&
            (identical(other.lastCreatedImageId, lastCreatedImageId) ||
                other.lastCreatedImageId == lastCreatedImageId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(products),
        const DeepCollectionEquality().hash(allProducts),
        selectedProduct,
        barcodeProduct,
        searchQuery,
        currentProductId,
        const DeepCollectionEquality().hash(units),
        const DeepCollectionEquality().hash(barcodes),
        selectedBarcode,
        const DeepCollectionEquality().hash(images),
        isLoading,
        isSaving,
        isDeleting,
        isSearching,
        isLoadingProduct,
        isLoadingUnits,
        isLoadingBarcodes,
        isLoadingImages,
        isWatching,
        lastCreatedProductId,
        lastCreatedUnitId,
        lastCreatedBarcodeId,
        lastCreatedImageId,
        errorMessage,
        successMessage
      ]);

  @override
  String toString() {
    return 'ProductsState(products: $products, allProducts: $allProducts, selectedProduct: $selectedProduct, barcodeProduct: $barcodeProduct, searchQuery: $searchQuery, currentProductId: $currentProductId, units: $units, barcodes: $barcodes, selectedBarcode: $selectedBarcode, images: $images, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSearching: $isSearching, isLoadingProduct: $isLoadingProduct, isLoadingUnits: $isLoadingUnits, isLoadingBarcodes: $isLoadingBarcodes, isLoadingImages: $isLoadingImages, isWatching: $isWatching, lastCreatedProductId: $lastCreatedProductId, lastCreatedUnitId: $lastCreatedUnitId, lastCreatedBarcodeId: $lastCreatedBarcodeId, lastCreatedImageId: $lastCreatedImageId, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) _then) =
      _$ProductsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Product> products,
      List<Product> allProducts,
      Product? selectedProduct,
      Product? barcodeProduct,
      String searchQuery,
      int? currentProductId,
      List<ProductUnit> units,
      List<ProductBarcode> barcodes,
      ProductBarcode? selectedBarcode,
      List<ProductImage> images,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSearching,
      bool isLoadingProduct,
      bool isLoadingUnits,
      bool isLoadingBarcodes,
      bool isLoadingImages,
      bool isWatching,
      int? lastCreatedProductId,
      int? lastCreatedUnitId,
      int? lastCreatedBarcodeId,
      int? lastCreatedImageId,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._self, this._then);

  final ProductsState _self;
  final $Res Function(ProductsState) _then;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? allProducts = null,
    Object? selectedProduct = freezed,
    Object? barcodeProduct = freezed,
    Object? searchQuery = null,
    Object? currentProductId = freezed,
    Object? units = null,
    Object? barcodes = null,
    Object? selectedBarcode = freezed,
    Object? images = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSearching = null,
    Object? isLoadingProduct = null,
    Object? isLoadingUnits = null,
    Object? isLoadingBarcodes = null,
    Object? isLoadingImages = null,
    Object? isWatching = null,
    Object? lastCreatedProductId = freezed,
    Object? lastCreatedUnitId = freezed,
    Object? lastCreatedBarcodeId = freezed,
    Object? lastCreatedImageId = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      allProducts: null == allProducts
          ? _self.allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      selectedProduct: freezed == selectedProduct
          ? _self.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      barcodeProduct: freezed == barcodeProduct
          ? _self.barcodeProduct
          : barcodeProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      units: null == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<ProductUnit>,
      barcodes: null == barcodes
          ? _self.barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcode>,
      selectedBarcode: freezed == selectedBarcode
          ? _self.selectedBarcode
          : selectedBarcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
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
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingProduct: null == isLoadingProduct
          ? _self.isLoadingProduct
          : isLoadingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUnits: null == isLoadingUnits
          ? _self.isLoadingUnits
          : isLoadingUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBarcodes: null == isLoadingBarcodes
          ? _self.isLoadingBarcodes
          : isLoadingBarcodes // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingImages: null == isLoadingImages
          ? _self.isLoadingImages
          : isLoadingImages // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCreatedProductId: freezed == lastCreatedProductId
          ? _self.lastCreatedProductId
          : lastCreatedProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedUnitId: freezed == lastCreatedUnitId
          ? _self.lastCreatedUnitId
          : lastCreatedUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedBarcodeId: freezed == lastCreatedBarcodeId
          ? _self.lastCreatedBarcodeId
          : lastCreatedBarcodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedImageId: freezed == lastCreatedImageId
          ? _self.lastCreatedImageId
          : lastCreatedImageId // ignore: cast_nullable_to_non_nullable
              as int?,
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

/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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
    TResult Function(_ProductsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsState() when $default != null:
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
    TResult Function(_ProductsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsState():
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
    TResult? Function(_ProductsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsState() when $default != null:
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
            List<Product> products,
            List<Product> allProducts,
            Product? selectedProduct,
            Product? barcodeProduct,
            String searchQuery,
            int? currentProductId,
            List<ProductUnit> units,
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            List<ProductImage> images,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSearching,
            bool isLoadingProduct,
            bool isLoadingUnits,
            bool isLoadingBarcodes,
            bool isLoadingImages,
            bool isWatching,
            int? lastCreatedProductId,
            int? lastCreatedUnitId,
            int? lastCreatedBarcodeId,
            int? lastCreatedImageId,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsState() when $default != null:
        return $default(
            _that.products,
            _that.allProducts,
            _that.selectedProduct,
            _that.barcodeProduct,
            _that.searchQuery,
            _that.currentProductId,
            _that.units,
            _that.barcodes,
            _that.selectedBarcode,
            _that.images,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSearching,
            _that.isLoadingProduct,
            _that.isLoadingUnits,
            _that.isLoadingBarcodes,
            _that.isLoadingImages,
            _that.isWatching,
            _that.lastCreatedProductId,
            _that.lastCreatedUnitId,
            _that.lastCreatedBarcodeId,
            _that.lastCreatedImageId,
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
            List<Product> products,
            List<Product> allProducts,
            Product? selectedProduct,
            Product? barcodeProduct,
            String searchQuery,
            int? currentProductId,
            List<ProductUnit> units,
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            List<ProductImage> images,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSearching,
            bool isLoadingProduct,
            bool isLoadingUnits,
            bool isLoadingBarcodes,
            bool isLoadingImages,
            bool isWatching,
            int? lastCreatedProductId,
            int? lastCreatedUnitId,
            int? lastCreatedBarcodeId,
            int? lastCreatedImageId,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsState():
        return $default(
            _that.products,
            _that.allProducts,
            _that.selectedProduct,
            _that.barcodeProduct,
            _that.searchQuery,
            _that.currentProductId,
            _that.units,
            _that.barcodes,
            _that.selectedBarcode,
            _that.images,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSearching,
            _that.isLoadingProduct,
            _that.isLoadingUnits,
            _that.isLoadingBarcodes,
            _that.isLoadingImages,
            _that.isWatching,
            _that.lastCreatedProductId,
            _that.lastCreatedUnitId,
            _that.lastCreatedBarcodeId,
            _that.lastCreatedImageId,
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
            List<Product> products,
            List<Product> allProducts,
            Product? selectedProduct,
            Product? barcodeProduct,
            String searchQuery,
            int? currentProductId,
            List<ProductUnit> units,
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            List<ProductImage> images,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSearching,
            bool isLoadingProduct,
            bool isLoadingUnits,
            bool isLoadingBarcodes,
            bool isLoadingImages,
            bool isWatching,
            int? lastCreatedProductId,
            int? lastCreatedUnitId,
            int? lastCreatedBarcodeId,
            int? lastCreatedImageId,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsState() when $default != null:
        return $default(
            _that.products,
            _that.allProducts,
            _that.selectedProduct,
            _that.barcodeProduct,
            _that.searchQuery,
            _that.currentProductId,
            _that.units,
            _that.barcodes,
            _that.selectedBarcode,
            _that.images,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSearching,
            _that.isLoadingProduct,
            _that.isLoadingUnits,
            _that.isLoadingBarcodes,
            _that.isLoadingImages,
            _that.isWatching,
            _that.lastCreatedProductId,
            _that.lastCreatedUnitId,
            _that.lastCreatedBarcodeId,
            _that.lastCreatedImageId,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductsState extends ProductsState {
  const _ProductsState(
      {final List<Product> products = const [],
      final List<Product> allProducts = const [],
      this.selectedProduct,
      this.barcodeProduct,
      this.searchQuery = '',
      this.currentProductId,
      final List<ProductUnit> units = const [],
      final List<ProductBarcode> barcodes = const [],
      this.selectedBarcode,
      final List<ProductImage> images = const [],
      this.isLoading = false,
      this.isSaving = false,
      this.isDeleting = false,
      this.isSearching = false,
      this.isLoadingProduct = false,
      this.isLoadingUnits = false,
      this.isLoadingBarcodes = false,
      this.isLoadingImages = false,
      this.isWatching = false,
      this.lastCreatedProductId,
      this.lastCreatedUnitId,
      this.lastCreatedBarcodeId,
      this.lastCreatedImageId,
      this.errorMessage,
      this.successMessage})
      : _products = products,
        _allProducts = allProducts,
        _units = units,
        _barcodes = barcodes,
        _images = images,
        super._();

// =======================================================
// Products
// =======================================================
  final List<Product> _products;
// =======================================================
// Products
// =======================================================
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<Product> _allProducts;
  @override
  @JsonKey()
  List<Product> get allProducts {
    if (_allProducts is EqualUnmodifiableListView) return _allProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allProducts);
  }

  @override
  final Product? selectedProduct;
  @override
  final Product? barcodeProduct;
  @override
  @JsonKey()
  final String searchQuery;
// =======================================================
// Current Product
// =======================================================
  @override
  final int? currentProductId;
// =======================================================
// Product Units
// =======================================================
  final List<ProductUnit> _units;
// =======================================================
// Product Units
// =======================================================
  @override
  @JsonKey()
  List<ProductUnit> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

// =======================================================
// Product Barcodes
// =======================================================
  final List<ProductBarcode> _barcodes;
// =======================================================
// Product Barcodes
// =======================================================
  @override
  @JsonKey()
  List<ProductBarcode> get barcodes {
    if (_barcodes is EqualUnmodifiableListView) return _barcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  @override
  final ProductBarcode? selectedBarcode;
// =======================================================
// Product Images
// =======================================================
  final List<ProductImage> _images;
// =======================================================
// Product Images
// =======================================================
  @override
  @JsonKey()
  List<ProductImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

// =======================================================
// Loading States
// =======================================================
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
  final bool isSearching;
  @override
  @JsonKey()
  final bool isLoadingProduct;
  @override
  @JsonKey()
  final bool isLoadingUnits;
  @override
  @JsonKey()
  final bool isLoadingBarcodes;
  @override
  @JsonKey()
  final bool isLoadingImages;
  @override
  @JsonKey()
  final bool isWatching;
// =======================================================
// Operation Results
// =======================================================
  @override
  final int? lastCreatedProductId;
  @override
  final int? lastCreatedUnitId;
  @override
  final int? lastCreatedBarcodeId;
  @override
  final int? lastCreatedImageId;
// =======================================================
// Messages
// =======================================================
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductsStateCopyWith<_ProductsState> get copyWith =>
      __$ProductsStateCopyWithImpl<_ProductsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductsState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._allProducts, _allProducts) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.barcodeProduct, barcodeProduct) ||
                other.barcodeProduct == barcodeProduct) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes) &&
            (identical(other.selectedBarcode, selectedBarcode) ||
                other.selectedBarcode == selectedBarcode) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isLoadingProduct, isLoadingProduct) ||
                other.isLoadingProduct == isLoadingProduct) &&
            (identical(other.isLoadingUnits, isLoadingUnits) ||
                other.isLoadingUnits == isLoadingUnits) &&
            (identical(other.isLoadingBarcodes, isLoadingBarcodes) ||
                other.isLoadingBarcodes == isLoadingBarcodes) &&
            (identical(other.isLoadingImages, isLoadingImages) ||
                other.isLoadingImages == isLoadingImages) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.lastCreatedProductId, lastCreatedProductId) ||
                other.lastCreatedProductId == lastCreatedProductId) &&
            (identical(other.lastCreatedUnitId, lastCreatedUnitId) ||
                other.lastCreatedUnitId == lastCreatedUnitId) &&
            (identical(other.lastCreatedBarcodeId, lastCreatedBarcodeId) ||
                other.lastCreatedBarcodeId == lastCreatedBarcodeId) &&
            (identical(other.lastCreatedImageId, lastCreatedImageId) ||
                other.lastCreatedImageId == lastCreatedImageId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_products),
        const DeepCollectionEquality().hash(_allProducts),
        selectedProduct,
        barcodeProduct,
        searchQuery,
        currentProductId,
        const DeepCollectionEquality().hash(_units),
        const DeepCollectionEquality().hash(_barcodes),
        selectedBarcode,
        const DeepCollectionEquality().hash(_images),
        isLoading,
        isSaving,
        isDeleting,
        isSearching,
        isLoadingProduct,
        isLoadingUnits,
        isLoadingBarcodes,
        isLoadingImages,
        isWatching,
        lastCreatedProductId,
        lastCreatedUnitId,
        lastCreatedBarcodeId,
        lastCreatedImageId,
        errorMessage,
        successMessage
      ]);

  @override
  String toString() {
    return 'ProductsState(products: $products, allProducts: $allProducts, selectedProduct: $selectedProduct, barcodeProduct: $barcodeProduct, searchQuery: $searchQuery, currentProductId: $currentProductId, units: $units, barcodes: $barcodes, selectedBarcode: $selectedBarcode, images: $images, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSearching: $isSearching, isLoadingProduct: $isLoadingProduct, isLoadingUnits: $isLoadingUnits, isLoadingBarcodes: $isLoadingBarcodes, isLoadingImages: $isLoadingImages, isWatching: $isWatching, lastCreatedProductId: $lastCreatedProductId, lastCreatedUnitId: $lastCreatedUnitId, lastCreatedBarcodeId: $lastCreatedBarcodeId, lastCreatedImageId: $lastCreatedImageId, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$ProductsStateCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$ProductsStateCopyWith(
          _ProductsState value, $Res Function(_ProductsState) _then) =
      __$ProductsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Product> products,
      List<Product> allProducts,
      Product? selectedProduct,
      Product? barcodeProduct,
      String searchQuery,
      int? currentProductId,
      List<ProductUnit> units,
      List<ProductBarcode> barcodes,
      ProductBarcode? selectedBarcode,
      List<ProductImage> images,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSearching,
      bool isLoadingProduct,
      bool isLoadingUnits,
      bool isLoadingBarcodes,
      bool isLoadingImages,
      bool isWatching,
      int? lastCreatedProductId,
      int? lastCreatedUnitId,
      int? lastCreatedBarcodeId,
      int? lastCreatedImageId,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$ProductsStateCopyWithImpl<$Res>
    implements _$ProductsStateCopyWith<$Res> {
  __$ProductsStateCopyWithImpl(this._self, this._then);

  final _ProductsState _self;
  final $Res Function(_ProductsState) _then;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? allProducts = null,
    Object? selectedProduct = freezed,
    Object? barcodeProduct = freezed,
    Object? searchQuery = null,
    Object? currentProductId = freezed,
    Object? units = null,
    Object? barcodes = null,
    Object? selectedBarcode = freezed,
    Object? images = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSearching = null,
    Object? isLoadingProduct = null,
    Object? isLoadingUnits = null,
    Object? isLoadingBarcodes = null,
    Object? isLoadingImages = null,
    Object? isWatching = null,
    Object? lastCreatedProductId = freezed,
    Object? lastCreatedUnitId = freezed,
    Object? lastCreatedBarcodeId = freezed,
    Object? lastCreatedImageId = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_ProductsState(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      allProducts: null == allProducts
          ? _self._allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      selectedProduct: freezed == selectedProduct
          ? _self.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      barcodeProduct: freezed == barcodeProduct
          ? _self.barcodeProduct
          : barcodeProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      units: null == units
          ? _self._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<ProductUnit>,
      barcodes: null == barcodes
          ? _self._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcode>,
      selectedBarcode: freezed == selectedBarcode
          ? _self.selectedBarcode
          : selectedBarcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode?,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
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
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingProduct: null == isLoadingProduct
          ? _self.isLoadingProduct
          : isLoadingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUnits: null == isLoadingUnits
          ? _self.isLoadingUnits
          : isLoadingUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBarcodes: null == isLoadingBarcodes
          ? _self.isLoadingBarcodes
          : isLoadingBarcodes // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingImages: null == isLoadingImages
          ? _self.isLoadingImages
          : isLoadingImages // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCreatedProductId: freezed == lastCreatedProductId
          ? _self.lastCreatedProductId
          : lastCreatedProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedUnitId: freezed == lastCreatedUnitId
          ? _self.lastCreatedUnitId
          : lastCreatedUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedBarcodeId: freezed == lastCreatedBarcodeId
          ? _self.lastCreatedBarcodeId
          : lastCreatedBarcodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCreatedImageId: freezed == lastCreatedImageId
          ? _self.lastCreatedImageId
          : lastCreatedImageId // ignore: cast_nullable_to_non_nullable
              as int?,
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
