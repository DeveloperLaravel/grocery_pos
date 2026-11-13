
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_all_products_use_case.dart';
import '../../domain/usecases/watch_all_products_use_case.dart';
import '../../domain/usecases/add_product_use_case.dart';
import '../../domain/usecases/update_product_use_case.dart';
import '../../domain/usecases/delete_product_use_case.dart';

import 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUseCase _getAllProducts;
  final WatchAllProductsUseCase _watchAllProducts;
  final AddProductUseCase _addProduct;
  final UpdateProductUseCase _updateProduct;
  final DeleteProductUseCase _deleteProduct;

  StreamSubscription<List<Product>>? _subscription;

  ProductsCubit(
    this._getAllProducts,
    this._watchAllProducts,
    this._addProduct,
    this._updateProduct,
    this._deleteProduct,
  ) : super(const ProductsState());

  // Initialize products
  Future<void> initialize() async {
    await loadProducts();
    _watchProducts();
  }

  // Load products
  Future<void> loadProducts() async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      final products = await _getAllProducts();

      emit(state.copyWith(
        products: products,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // Watch database changes
  void _watchProducts() {
    _subscription?.cancel();

    _subscription = _watchAllProducts().listen(
      (products) {
        emit(state.copyWith(
          products: products,
          errorMessage: null,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          errorMessage: _errorText(error),
        ));
      },
    );
  }

  // Search
  void searchProducts(String query) {
    emit(state.copyWith(
      searchQuery: query,
    ));
  }

  // Filtered products
  List<Product> get filteredProducts {
    final query = state.searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return state.products;
    }

    return state.products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.barcode.toLowerCase().contains(query);
    }).toList();
  }

  // Statistics
  int get totalProducts => state.products.length;

  int get lowStockCount =>
      state.products.where((p) => p.isLowStock).length;

  int get availableProducts =>
      state.products.where((p) => p.isAvailable).length;

  // Add product
  Future<bool> addProduct(Product product) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      await _addProduct(product);

      emit(state.copyWith(
        isSaving: false,
        successMessage: 'تمت إضافة المنتج بنجاح',
      ));

      return true;
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorText(e),
      ));

      return false;
    }
  }

  // Update product
  Future<bool> updateProduct(Product product) async {
    if (product.id == null || product.id! <= 0) {
      emit(state.copyWith(
        errorMessage: 'معرف المنتج غير صالح',
      ));
      return false;
    }

    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await _updateProduct(product);

      if (!updated) {
        throw StateError('لم يتم العثور على المنتج المطلوب تحديثه');
      }

      emit(state.copyWith(
        isSaving: false,
        successMessage: 'تم تعديل المنتج بنجاح',
      ));

      return true;
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorText(e),
      ));

      return false;
    }
  }

  // Delete product
  Future<bool> deleteProduct(int id) async {
    if (id <= 0) return false;

    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await _deleteProduct(id);

      if (!deleted) {
        throw StateError('لم يتم حذف المنتج');
      }

      emit(state.copyWith(
        isSaving: false,
        successMessage: 'تم حذف المنتج بنجاح',
      ));

      return true;
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorText(e),
      ));

      return false;
    }
  }

  // Clear messages
  void clearMessages() {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));
  }

  String _errorText(Object error) {
    final message = error.toString();

    if (message.contains('barcode') ||
        message.contains('UNIQUE constraint')) {
      return 'هذا الباركود مستخدم مسبقاً';
    }

    return message
        .replaceFirst('Bad state: ', '')
        .replaceFirst('Exception: ', '');
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
