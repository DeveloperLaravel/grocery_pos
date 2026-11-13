
import '../../../../core/database/app_database.dart';

import '../../domain/entities/sale_receipt.dart';
import '../models/sale_item_model.dart';
import '../models/sale_model.dart';

import 'sale_item_mapper.dart';

extension SaleModelMapper on SaleModel {
  SaleReceipt toReceipt() {
    return SaleReceipt(
      id: id,
      invoiceNumber: invoiceNumber,
      subtotal: subtotal,
      discount: discount,
      total: total,
      paidAmount: paidAmount,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
      items: items.map((item) => item.toReceiptItem()).toList(),
    );
  }
}

extension SaleDbMapper on SaleDb {
  SaleReceipt toReceipt({
    required List<SaleItemDb> items,
  }) {
    return SaleReceipt(
      id: id,
      invoiceNumber: invoiceNumber,
      subtotal: subtotal,
      discount: discount,
      total: total,
      paidAmount: paidAmount,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
      items: items.map((item) => item.toReceiptItem()).toList(),
    );
  }

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
