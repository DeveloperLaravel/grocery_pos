
import '../../../../core/database/app_database.dart';

import '../../domain/entities/sale_receipt_item.dart';
import '../models/sale_item_model.dart';

extension SaleItemModelMapper on SaleItemModel {
  SaleReceiptItem toReceiptItem() {
    return SaleReceiptItem(
      productId: productId,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      total: total,
    );
  }
}

extension SaleItemDbMapper on SaleItemDb {
  SaleReceiptItem toReceiptItem() {
    return SaleReceiptItem(
      productId: productId,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      total: total,
    );
  }

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

extension SaleReceiptItemMapper on SaleReceiptItem {
  // Receipt Item -> Model يحتاج id و saleId
  SaleItemModel toModel({
    required int id,
    required int saleId,
  }) {
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
