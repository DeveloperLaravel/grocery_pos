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
    TResult Function(LoadProducts value)? load,
    TResult Function(WatchProducts value)? watch,
    TResult Function(ProductsUpdated value)? productsUpdated,
    TResult Function(SearchProducts value)? search,
    TResult Function(FilterProductsByCategory value)? filterByCategory,
    TResult Function(FilterProductsByBrand value)? filterByBrand,
    TResult Function(ClearProductsFilters value)? clearFilters,
    TResult Function(CreateProduct value)? create,
    TResult Function(UpdateProduct value)? update,
    TResult Function(DeleteProduct value)? delete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts() when load != null:
        return load(_that);
      case WatchProducts() when watch != null:
        return watch(_that);
      case ProductsUpdated() when productsUpdated != null:
        return productsUpdated(_that);
      case SearchProducts() when search != null:
        return search(_that);
      case FilterProductsByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case FilterProductsByBrand() when filterByBrand != null:
        return filterByBrand(_that);
      case ClearProductsFilters() when clearFilters != null:
        return clearFilters(_that);
      case CreateProduct() when create != null:
        return create(_that);
      case UpdateProduct() when update != null:
        return update(_that);
      case DeleteProduct() when delete != null:
        return delete(_that);
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
    required TResult Function(LoadProducts value) load,
    required TResult Function(WatchProducts value) watch,
    required TResult Function(ProductsUpdated value) productsUpdated,
    required TResult Function(SearchProducts value) search,
    required TResult Function(FilterProductsByCategory value) filterByCategory,
    required TResult Function(FilterProductsByBrand value) filterByBrand,
    required TResult Function(ClearProductsFilters value) clearFilters,
    required TResult Function(CreateProduct value) create,
    required TResult Function(UpdateProduct value) update,
    required TResult Function(DeleteProduct value) delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts():
        return load(_that);
      case WatchProducts():
        return watch(_that);
      case ProductsUpdated():
        return productsUpdated(_that);
      case SearchProducts():
        return search(_that);
      case FilterProductsByCategory():
        return filterByCategory(_that);
      case FilterProductsByBrand():
        return filterByBrand(_that);
      case ClearProductsFilters():
        return clearFilters(_that);
      case CreateProduct():
        return create(_that);
      case UpdateProduct():
        return update(_that);
      case DeleteProduct():
        return delete(_that);
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
    TResult? Function(LoadProducts value)? load,
    TResult? Function(WatchProducts value)? watch,
    TResult? Function(ProductsUpdated value)? productsUpdated,
    TResult? Function(SearchProducts value)? search,
    TResult? Function(FilterProductsByCategory value)? filterByCategory,
    TResult? Function(FilterProductsByBrand value)? filterByBrand,
    TResult? Function(ClearProductsFilters value)? clearFilters,
    TResult? Function(CreateProduct value)? create,
    TResult? Function(UpdateProduct value)? update,
    TResult? Function(DeleteProduct value)? delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts() when load != null:
        return load(_that);
      case WatchProducts() when watch != null:
        return watch(_that);
      case ProductsUpdated() when productsUpdated != null:
        return productsUpdated(_that);
      case SearchProducts() when search != null:
        return search(_that);
      case FilterProductsByCategory() when filterByCategory != null:
        return filterByCategory(_that);
      case FilterProductsByBrand() when filterByBrand != null:
        return filterByBrand(_that);
      case ClearProductsFilters() when clearFilters != null:
        return clearFilters(_that);
      case CreateProduct() when create != null:
        return create(_that);
      case UpdateProduct() when update != null:
        return update(_that);
      case DeleteProduct() when delete != null:
        return delete(_that);
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
    TResult Function()? load,
    TResult Function()? watch,
    TResult Function(List<Product> products)? productsUpdated,
    TResult Function(String query)? search,
    TResult Function(int categoryId)? filterByCategory,
    TResult Function(int brandId)? filterByBrand,
    TResult Function()? clearFilters,
    TResult Function(Product product, String unitName, String? barcode,
            String barcodeSource)?
        create,
    TResult Function(int id, Product product)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts() when load != null:
        return load();
      case WatchProducts() when watch != null:
        return watch();
      case ProductsUpdated() when productsUpdated != null:
        return productsUpdated(_that.products);
      case SearchProducts() when search != null:
        return search(_that.query);
      case FilterProductsByCategory() when filterByCategory != null:
        return filterByCategory(_that.categoryId);
      case FilterProductsByBrand() when filterByBrand != null:
        return filterByBrand(_that.brandId);
      case ClearProductsFilters() when clearFilters != null:
        return clearFilters();
      case CreateProduct() when create != null:
        return create(
            _that.product, _that.unitName, _that.barcode, _that.barcodeSource);
      case UpdateProduct() when update != null:
        return update(_that.id, _that.product);
      case DeleteProduct() when delete != null:
        return delete(_that.id);
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
    required TResult Function() load,
    required TResult Function() watch,
    required TResult Function(List<Product> products) productsUpdated,
    required TResult Function(String query) search,
    required TResult Function(int categoryId) filterByCategory,
    required TResult Function(int brandId) filterByBrand,
    required TResult Function() clearFilters,
    required TResult Function(Product product, String unitName, String? barcode,
            String barcodeSource)
        create,
    required TResult Function(int id, Product product) update,
    required TResult Function(int id) delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts():
        return load();
      case WatchProducts():
        return watch();
      case ProductsUpdated():
        return productsUpdated(_that.products);
      case SearchProducts():
        return search(_that.query);
      case FilterProductsByCategory():
        return filterByCategory(_that.categoryId);
      case FilterProductsByBrand():
        return filterByBrand(_that.brandId);
      case ClearProductsFilters():
        return clearFilters();
      case CreateProduct():
        return create(
            _that.product, _that.unitName, _that.barcode, _that.barcodeSource);
      case UpdateProduct():
        return update(_that.id, _that.product);
      case DeleteProduct():
        return delete(_that.id);
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
    TResult? Function()? load,
    TResult? Function()? watch,
    TResult? Function(List<Product> products)? productsUpdated,
    TResult? Function(String query)? search,
    TResult? Function(int categoryId)? filterByCategory,
    TResult? Function(int brandId)? filterByBrand,
    TResult? Function()? clearFilters,
    TResult? Function(Product product, String unitName, String? barcode,
            String barcodeSource)?
        create,
    TResult? Function(int id, Product product)? update,
    TResult? Function(int id)? delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProducts() when load != null:
        return load();
      case WatchProducts() when watch != null:
        return watch();
      case ProductsUpdated() when productsUpdated != null:
        return productsUpdated(_that.products);
      case SearchProducts() when search != null:
        return search(_that.query);
      case FilterProductsByCategory() when filterByCategory != null:
        return filterByCategory(_that.categoryId);
      case FilterProductsByBrand() when filterByBrand != null:
        return filterByBrand(_that.brandId);
      case ClearProductsFilters() when clearFilters != null:
        return clearFilters();
      case CreateProduct() when create != null:
        return create(
            _that.product, _that.unitName, _that.barcode, _that.barcodeSource);
      case UpdateProduct() when update != null:
        return update(_that.id, _that.product);
      case DeleteProduct() when delete != null:
        return delete(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadProducts implements ProductsEvent {
  const LoadProducts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.load()';
  }
}

/// @nodoc

class WatchProducts implements ProductsEvent {
  const WatchProducts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WatchProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.watch()';
  }
}

/// @nodoc

class ProductsUpdated implements ProductsEvent {
  const ProductsUpdated(final List<Product> products) : _products = products;

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
  $ProductsUpdatedCopyWith<ProductsUpdated> get copyWith =>
      _$ProductsUpdatedCopyWithImpl<ProductsUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsUpdated &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'ProductsEvent.productsUpdated(products: $products)';
  }
}

/// @nodoc
abstract mixin class $ProductsUpdatedCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $ProductsUpdatedCopyWith(
          ProductsUpdated value, $Res Function(ProductsUpdated) _then) =
      _$ProductsUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ProductsUpdatedCopyWithImpl<$Res>
    implements $ProductsUpdatedCopyWith<$Res> {
  _$ProductsUpdatedCopyWithImpl(this._self, this._then);

  final ProductsUpdated _self;
  final $Res Function(ProductsUpdated) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(ProductsUpdated(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class SearchProducts implements ProductsEvent {
  const SearchProducts(this.query);

  final String query;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchProductsCopyWith<SearchProducts> get copyWith =>
      _$SearchProductsCopyWithImpl<SearchProducts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchProducts &&
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
abstract mixin class $SearchProductsCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $SearchProductsCopyWith(
          SearchProducts value, $Res Function(SearchProducts) _then) =
      _$SearchProductsCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchProductsCopyWithImpl<$Res>
    implements $SearchProductsCopyWith<$Res> {
  _$SearchProductsCopyWithImpl(this._self, this._then);

  final SearchProducts _self;
  final $Res Function(SearchProducts) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchProducts(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class FilterProductsByCategory implements ProductsEvent {
  const FilterProductsByCategory(this.categoryId);

  final int categoryId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterProductsByCategoryCopyWith<FilterProductsByCategory> get copyWith =>
      _$FilterProductsByCategoryCopyWithImpl<FilterProductsByCategory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterProductsByCategory &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  String toString() {
    return 'ProductsEvent.filterByCategory(categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $FilterProductsByCategoryCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $FilterProductsByCategoryCopyWith(FilterProductsByCategory value,
          $Res Function(FilterProductsByCategory) _then) =
      _$FilterProductsByCategoryCopyWithImpl;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class _$FilterProductsByCategoryCopyWithImpl<$Res>
    implements $FilterProductsByCategoryCopyWith<$Res> {
  _$FilterProductsByCategoryCopyWithImpl(this._self, this._then);

  final FilterProductsByCategory _self;
  final $Res Function(FilterProductsByCategory) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(FilterProductsByCategory(
      null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class FilterProductsByBrand implements ProductsEvent {
  const FilterProductsByBrand(this.brandId);

  final int brandId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterProductsByBrandCopyWith<FilterProductsByBrand> get copyWith =>
      _$FilterProductsByBrandCopyWithImpl<FilterProductsByBrand>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterProductsByBrand &&
            (identical(other.brandId, brandId) || other.brandId == brandId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandId);

  @override
  String toString() {
    return 'ProductsEvent.filterByBrand(brandId: $brandId)';
  }
}

/// @nodoc
abstract mixin class $FilterProductsByBrandCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $FilterProductsByBrandCopyWith(FilterProductsByBrand value,
          $Res Function(FilterProductsByBrand) _then) =
      _$FilterProductsByBrandCopyWithImpl;
  @useResult
  $Res call({int brandId});
}

/// @nodoc
class _$FilterProductsByBrandCopyWithImpl<$Res>
    implements $FilterProductsByBrandCopyWith<$Res> {
  _$FilterProductsByBrandCopyWithImpl(this._self, this._then);

  final FilterProductsByBrand _self;
  final $Res Function(FilterProductsByBrand) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brandId = null,
  }) {
    return _then(FilterProductsByBrand(
      null == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClearProductsFilters implements ProductsEvent {
  const ClearProductsFilters();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearProductsFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductsEvent.clearFilters()';
  }
}

/// @nodoc

class CreateProduct implements ProductsEvent {
  const CreateProduct(
      {required this.product,
      required this.unitName,
      this.barcode,
      this.barcodeSource = 'manual'});

  final Product product;
  final String unitName;
  final String? barcode;
  @JsonKey()
  final String barcodeSource;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateProductCopyWith<CreateProduct> get copyWith =>
      _$CreateProductCopyWithImpl<CreateProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateProduct &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.barcodeSource, barcodeSource) ||
                other.barcodeSource == barcodeSource));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, product, unitName, barcode, barcodeSource);

  @override
  String toString() {
    return 'ProductsEvent.create(product: $product, unitName: $unitName, barcode: $barcode, barcodeSource: $barcodeSource)';
  }
}

/// @nodoc
abstract mixin class $CreateProductCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $CreateProductCopyWith(
          CreateProduct value, $Res Function(CreateProduct) _then) =
      _$CreateProductCopyWithImpl;
  @useResult
  $Res call(
      {Product product,
      String unitName,
      String? barcode,
      String barcodeSource});
}

/// @nodoc
class _$CreateProductCopyWithImpl<$Res>
    implements $CreateProductCopyWith<$Res> {
  _$CreateProductCopyWithImpl(this._self, this._then);

  final CreateProduct _self;
  final $Res Function(CreateProduct) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? unitName = null,
    Object? barcode = freezed,
    Object? barcodeSource = null,
  }) {
    return _then(CreateProduct(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: freezed == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeSource: null == barcodeSource
          ? _self.barcodeSource
          : barcodeSource // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateProduct implements ProductsEvent {
  const UpdateProduct({required this.id, required this.product});

  final int id;
  final Product product;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProductCopyWith<UpdateProduct> get copyWith =>
      _$UpdateProductCopyWithImpl<UpdateProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, product);

  @override
  String toString() {
    return 'ProductsEvent.update(id: $id, product: $product)';
  }
}

/// @nodoc
abstract mixin class $UpdateProductCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $UpdateProductCopyWith(
          UpdateProduct value, $Res Function(UpdateProduct) _then) =
      _$UpdateProductCopyWithImpl;
  @useResult
  $Res call({int id, Product product});
}

/// @nodoc
class _$UpdateProductCopyWithImpl<$Res>
    implements $UpdateProductCopyWith<$Res> {
  _$UpdateProductCopyWithImpl(this._self, this._then);

  final UpdateProduct _self;
  final $Res Function(UpdateProduct) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? product = null,
  }) {
    return _then(UpdateProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class DeleteProduct implements ProductsEvent {
  const DeleteProduct(this.id);

  final int id;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteProductCopyWith<DeleteProduct> get copyWith =>
      _$DeleteProductCopyWithImpl<DeleteProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteProduct &&
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
abstract mixin class $DeleteProductCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory $DeleteProductCopyWith(
          DeleteProduct value, $Res Function(DeleteProduct) _then) =
      _$DeleteProductCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteProductCopyWithImpl<$Res>
    implements $DeleteProductCopyWith<$Res> {
  _$DeleteProductCopyWithImpl(this._self, this._then);

  final DeleteProduct _self;
  final $Res Function(DeleteProduct) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteProduct(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
