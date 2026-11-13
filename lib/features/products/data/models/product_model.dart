
import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/database/app_database.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    // Product ID
    int? id,

    // Product Information
    required String name,
    required String barcode,

    // Pricing
    @JsonKey(name: 'cost_price')
    @Default(0.0)
    double costPrice,

    @JsonKey(name: 'sale_price')
    required double salePrice,

    // Inventory
    @Default(0.0)
    double quantity,

    @JsonKey(name: 'min_stock')
    @Default(5.0)
    double minStock,

    // Timestamps
    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _ProductModel;

  // JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // Drift ProductDb -> ProductModel
  factory ProductModel.fromDb(ProductDb product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      barcode: product.barcode,
      costPrice: product.costPrice,
      salePrice: product.salePrice,
      quantity: product.quantity,
      minStock: product.minStock,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );
  }

  // ProductModel -> Drift Insert
  ProductsCompanion toInsertCompanion() {
    return ProductsCompanion.insert(
      name: name,
      barcode: barcode,
      costPrice: Value(costPrice),
      salePrice: salePrice,
      quantity: Value(quantity),
      minStock: Value(minStock),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  // ProductModel -> Drift Update
  ProductsCompanion toUpdateCompanion() {
    return ProductsCompanion(
      name: Value(name),
      barcode: Value(barcode),
      costPrice: Value(costPrice),
      salePrice: Value(salePrice),
      quantity: Value(quantity),
      minStock: Value(minStock),
      updatedAt: Value(updatedAt),
    );
  }
}
