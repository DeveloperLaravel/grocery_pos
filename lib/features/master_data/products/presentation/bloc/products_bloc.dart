
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../domain/entities/product/product.dart';
import '../../domain/usecases/create_product_usecase.dart';
import '../../domain/usecases/delete_product_use_case.dart';
import '../../domain/usecases/get_all_products_use_case.dart';
import '../../domain/usecases/products/search_products_usecase.dart';
import '../../domain/usecases/products/watch_products_by_brand_usecase.dart';
import '../../domain/usecases/products/watch_products_by_category_usecase.dart';
import '../../domain/usecases/update_product_use_case.dart';
import '../../domain/usecases/watch_all_products_use_case.dart';
import 'products_event.dart';
import 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUseCase _getAllProducts;
  final WatchAllProductsUseCase _watchAllProducts;
  final SearchProductsUseCase _searchProducts;
  final WatchProductsByCategoryUseCase _watchByCategory;
  final WatchProductsByBrandUseCase _watchByBrand;
  final CreateProductUseCase _createProduct;
  final UpdateProductUsecase _updateProduct;
  final DeleteProductUseCase _deleteProduct;

  StreamSubscription<List<Product>>? _productsSubscription;

  ProductsBloc(
    this._getAllProducts,
    this._watchAllProducts,
    this._searchProducts,
    this._watchByCategory,
    this._watchByBrand,
    this._createProduct,
    this._updateProduct,
    this._deleteProduct,
  ) : super(const ProductsState()) {
    on<LoadProducts>(_onLoadProducts);
    on<WatchProducts>(_onWatchProducts);
    on<ProductsUpdated>(_onProductsUpdated);
    on<SearchProducts>(_onSearchProducts);
    on<FilterProductsByCategory>(_onFilterByCategory);
    on<FilterProductsByBrand>(_onFilterByBrand);
    on<ClearProductsFilters>(_onClearFilters);
    on<CreateProduct>(_onCreateProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
    
  }

  // =========================================================
  // LOAD PRODUCTS
  // =========================================================

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductsStatus.loading,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final products = await _getAllProducts();

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        searchQuery: '',
        selectedCategoryId: null,
        selectedBrandId: null,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // WATCH PRODUCTS
  // =========================================================

  Future<void> _onWatchProducts(
    WatchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    await _productsSubscription?.cancel();

    emit(state.copyWith(
      isWatching: true,
      errorMessage: null,
    ));

    _productsSubscription = _watchAllProducts().listen(
      (products) {
        if (!isClosed) {
          add(ProductsEvent.productsUpdated(products));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          addError(error);
        }
      },
    );
  }

  void _onProductsUpdated(
    ProductsUpdated event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(
      status: ProductsStatus.success,
      products: _applyLocalFilters(event.products),
      errorMessage: null,
    ));
  }

  // =========================================================
  // SEARCH
  // =========================================================

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    final query = event.query.trim();

    emit(state.copyWith(
      status: ProductsStatus.loading,
      searchQuery: query,
      errorMessage: null,
    ));

    try {
      final products = query.isEmpty
          ? await _getAllProducts()
          : await _searchProducts(query);

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: _applyLocalFilters(products),
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // FILTER BY CATEGORY
  // =========================================================

  Future<void> _onFilterByCategory(
    FilterProductsByCategory event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductsStatus.loading,
      selectedCategoryId: event.categoryId,
      selectedBrandId: null,
      searchQuery: '',
      errorMessage: null,
    ));

    try {
      final products = await _watchByCategory(
        event.categoryId,
      ).first;

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // FILTER BY BRAND
  // =========================================================

  Future<void> _onFilterByBrand(
    FilterProductsByBrand event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductsStatus.loading,
      selectedBrandId: event.brandId,
      selectedCategoryId: null,
      searchQuery: '',
      errorMessage: null,
    ));

    try {
      final products = await _watchByBrand(
        event.brandId,
      ).first;

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // CLEAR FILTERS
  // =========================================================

  Future<void> _onClearFilters(
    ClearProductsFilters event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductsStatus.loading,
      searchQuery: '',
      selectedCategoryId: null,
      selectedBrandId: null,
      errorMessage: null,
    ));

    try {
      final products = await _getAllProducts();

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // CREATE PRODUCT
  // =========================================================

  Future<void> _onCreateProduct(
    CreateProduct event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final id = await _createProduct(
        product: event.product,
        unitName: event.unitName,
      );

      final products = await _getAllProducts();

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        isOperationInProgress: false,
        successMessage: 'تمت إضافة المنتج بنجاح',
        lastAffectedProductId: id,
      ));
    } catch (e) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(e),
      ));
    }
  }
  // =========================================================
  // UPDATE PRODUCT
  // =========================================================

 

Future<void> _onUpdateProduct(
  UpdateProduct event,
  Emitter<ProductsState> emit,
) async {
  emit(state.copyWith(
    isOperationInProgress: true,
    errorMessage: null,
    successMessage: null,
  ));

  try {
    final updatedProduct = await _updateProduct(
      id: event.id,
      product: event.product,
    );

    final updatedProducts = state.products.map((product) {
      return product.id == updatedProduct.id
          ? updatedProduct
          : product;
    }).toList();

    emit(state.copyWith(
      products: updatedProducts,
      isOperationInProgress: false,
      successMessage: 'تم تحديث المنتج بنجاح',
      lastAffectedProductId: updatedProduct.id,
    ));
  } catch (e) {
    emit(state.copyWith(
      isOperationInProgress: false,
      errorMessage: e.toString(),
    ));
  }
}


  // =========================================================
  // DELETE PRODUCT
  // =========================================================

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await _deleteProduct(event.id);

      if (deleted <= 0) {
        throw Exception('تعذر حذف المنتج');
      }

      final products = await _getAllProducts();

      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        isOperationInProgress: false,
        successMessage: 'تم حذف المنتج بنجاح',
        lastAffectedProductId: event.id,
      ));
    } catch (e) {
      emit(state.copyWith(
        isOperationInProgress: false,
        errorMessage: _errorMessage(e),
      ));
    }
  }

  // =========================================================
  // HELPERS
  // =========================================================

  List<Product> _applyLocalFilters(List<Product> products) {
    var result = products;

    final categoryId = state.selectedCategoryId;
    final brandId = state.selectedBrandId;

    if (categoryId != null) {
      result = result
          .where((product) => product.categoryId == categoryId)
          .toList();
    }

    if (brandId != null) {
      result = result
          .where((product) => product.brandId == brandId)
          .toList();
    }

    return result;
  }

  String _errorMessage(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

  @override
  Future<void> close() async {
    await _productsSubscription?.cancel();
    return super.close();
  }
}
