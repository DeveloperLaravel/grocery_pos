
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/sale_item.dart';
import '../models/sale_item_model.dart';


extension SaleItemDbMapper on SaleItemDb {
  SaleItemModel toModel() {
    return SaleItemModel(
      id: id,
      saleId: saleId,
      productId: productId,
      productUnitId: productUnitId,
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: conversionFactor,
      baseQuantity: baseQuantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      discountAmount: discountAmount,
      taxRate: taxRate,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: createdAt,
    );
  }
}

extension SaleItemModelMapper on SaleItemModel {
  SaleItem toEntity() {
    return SaleItem(
      id: id,
      saleId: saleId,
      productId: productId,
      productUnitId: productUnitId,
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: conversionFactor,
      baseQuantity: baseQuantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      discountAmount: discountAmount,
      taxRate: taxRate,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: createdAt,
    );
  }
}

extension SaleItemEntityMapper on SaleItem {
  SaleItemModel toModel() {
    return SaleItemModel(
      id: id,
      saleId: saleId,
      productId: productId,
      productUnitId: productUnitId,
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: conversionFactor,
      baseQuantity: baseQuantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      discountAmount: discountAmount,
      taxRate: taxRate,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: createdAt,
    );
  }
}

extension SaleItemModelCompanionMapper on SaleItemModel {
  SaleItemsCompanion toCompanion() {
    return SaleItemsCompanion.insert(
      saleId: saleId,
      productId: productId,
      productUnitId: Value(productUnitId),
      productName: productName,
      unitName: unitName,
      quantity: quantity,
      conversionFactor: Value(conversionFactor),
      baseQuantity: baseQuantity,
      unitPrice: unitPrice,
      costPrice: Value(costPrice),
      discountAmount: Value(discountAmount),
      taxRate: Value(taxRate),
      taxAmount: Value(taxAmount),
      totalAmount: totalAmount,
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }
}
