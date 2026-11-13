
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../inventory/data/models/stock_movement_model.dart';
import '../../pos/data/models/product_model.dart';
import '../../pos/data/models/return_item_model.dart';
import '../../pos/data/models/return_model.dart';
import '../../pos/data/models/sale_item_model.dart';
import '../../pos/data/models/sale_model.dart';


// =====================================================
// Product Mapper
// =====================================================

extension ProductDbMapper on ProductDb {
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

extension ProductModelMapper on ProductModel {
  // إنشاء منتج جديد
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

  // تحديث منتج موجود
  ProductsCompanion toUpdateCompanion() {
    return ProductsCompanion(
      name: Value(name),
      barcode: Value(barcode),
      costPrice: Value(costPrice),
      salePrice: Value(salePrice),
      quantity: Value(quantity),
      minStock: Value(minStock),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}

// =====================================================
// Sale Mapper
// =====================================================

extension SaleDbMapper on SaleDb {
  SaleModel toModel({
    List<SaleItemModel> items = const [],
  }) {
    return SaleModel(
      id: id,
      invoiceNumber: invoiceNumber,
      subtotal: subtotal,
      discount: discount,
      total: total,
      paidAmount: paidAmount,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
      items: items,
    );
  }
}

// =====================================================
// Sale Item Mapper
// =====================================================

extension SaleItemDbMapper on SaleItemDb {
  SaleItemModel toModel() {
    return SaleItemModel(
      id: id,
      saleId: saleId,
      productId: productId,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      total: total,
    );
  }
}

// =====================================================
// Return Mapper
// =====================================================

extension ReturnDbMapper on ReturnDb {
  ReturnModel toModel({
    List<ReturnItemModel> items = const [],
  }) {
    return ReturnModel(
      id: id,
      saleId: saleId,
      total: total,
      createdAt: createdAt,
      items: items,
    );
  }
}

// =====================================================
// Return Item Mapper
// =====================================================

extension ReturnItemDbMapper on ReturnItemDb {
  ReturnItemModel toModel() {
    return ReturnItemModel(
      id: id,
      returnId: returnId,
      productId: productId,
      quantity: quantity,
      refundAmount: refundAmount,
    );
  }
}

// =====================================================
// Stock Movement Mapper
// =====================================================

extension StockMovementDbMapper on StockMovementDb {
  StockMovementModel toModel() {
    return StockMovementModel(
      id: id,
      productId: productId,
      type: type,
      quantity: quantity,
      reference: reference,
      note: note,
      createdAt: createdAt,
    );
  }
}
