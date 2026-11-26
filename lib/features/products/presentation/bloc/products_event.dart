
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product/product.dart';

part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  // Load products
  const factory ProductsEvent.load() = LoadProducts;

  // Watch products from local database
  const factory ProductsEvent.watch() = WatchProducts;

  // Internal event for stream updates
  const factory ProductsEvent.productsUpdated(
    List<Product> products,
  ) = ProductsUpdated;

  // Search
  const factory ProductsEvent.search(String query) = SearchProducts;

  // Filter by category
  const factory ProductsEvent.filterByCategory(int categoryId) =
      FilterProductsByCategory;

  // Filter by brand
  const factory ProductsEvent.filterByBrand(int brandId) =
      FilterProductsByBrand;

  // Clear filters
  const factory ProductsEvent.clearFilters() = ClearProductsFilters;

  // Create
  // Create product with optional barcode
  const factory ProductsEvent.create({
    required Product product,
    required String unitName,
    String? barcode,
    @Default('manual') String barcodeSource,
  }) = CreateProduct;

  // Update
  const factory ProductsEvent.update({
    required int id,
    required Product product,
  }) = UpdateProduct;

  // Delete
  const factory ProductsEvent.delete(int id) = DeleteProduct;
  
}
