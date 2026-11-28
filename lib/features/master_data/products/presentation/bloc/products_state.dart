
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product/product.dart';

part 'products_state.freezed.dart';

enum ProductsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(ProductsStatus.initial)
    ProductsStatus status,

    @Default(<Product>[])
    List<Product> products,

    @Default('')
    String searchQuery,

    int? selectedCategoryId,

    int? selectedBrandId,

    @Default(false)
    bool isOperationInProgress,

    @Default(false)
    bool isWatching,

    String? errorMessage,

    String? successMessage,

    int? lastAffectedProductId,
  }) = _ProductsState;

  const ProductsState._();

  bool get isLoading => status == ProductsStatus.loading;

  bool get hasError => errorMessage != null;

  bool get hasProducts => products.isNotEmpty;

  bool get isEmpty =>
      status == ProductsStatus.success && products.isEmpty;

  int get productsCount => products.length;
}
