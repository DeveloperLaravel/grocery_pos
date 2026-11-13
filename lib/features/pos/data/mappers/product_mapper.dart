
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

extension ProductModelMapper on ProductModel {
  // Model -> Entity
  ProductEntity toEntity() {
    return ProductEntity(
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

extension ProductEntityMapper on ProductEntity {
  // Entity -> Model
  ProductModel toModel() {
    if (id == null ||
        createdAt == null ||
        updatedAt == null) {
      throw StateError(
        'لا يمكن إنشاء ProductModel قبل حفظ المنتج في قاعدة البيانات',
      );
    }

    return ProductModel(
      id: id!,
      name: name,
      barcode: barcode,
      costPrice: costPrice,
      salePrice: salePrice,
      quantity: quantity,
      minStock: minStock,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
    );
  }

  // Entity -> Drift Companion
  ProductsCompanion toCompanion({
    bool includeId = false,
  }) {
    return ProductsCompanion(
      id: includeId && id != null
          ? Value(id!)
          : const Value.absent(),
      name: Value(name.trim()),
      barcode: Value(barcode.trim()),
      costPrice: Value(costPrice),
      salePrice: Value(salePrice),
      quantity: Value(quantity),
      minStock: Value(minStock),
      createdAt: createdAt == null
          ? const Value.absent()
          : Value(createdAt!),
      updatedAt: Value(DateTime.now()),
    );
  }
}

extension ProductDbMapper on ProductDb {
  // Drift -> Entity
  ProductEntity toEntity() {
    return ProductEntity(
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

  // Drift -> Model
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
