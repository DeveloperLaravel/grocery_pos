
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

extension ProductModelMapper on ProductModel {
  // Model -> Entity
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      barcode: barcode,
      costPrice: costPrice,
      salePrice: salePrice,
      quantity: quantity,
      minStock: minStock,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ProductEntityMapper on Product {
  // Entity -> Model
  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      barcode: barcode,
      costPrice: costPrice,
      salePrice: salePrice,
      quantity: quantity,
      minStock: minStock,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}