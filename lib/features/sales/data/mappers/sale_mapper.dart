import 'package:grocery_pos/core/database/app_database.dart';


import '../../domain/entities/sale.dart';

import '../models/sale_model.dart';
import '../models/sale_item_model.dart';

import 'sale_item_mapper.dart';
class SaleMapper {
  const SaleMapper._();

  static SaleModel fromDb(
    SaleDb db, {
    required List<SaleItemModel> items,
  }) {
    return SaleModel(
      id: db.id,
      invoiceNumber: db.invoiceNumber,
      subtotal: db.subtotal,
      discount: db.discount,
      total: db.total,
      paidAmount: db.paidAmount,
      paymentMethod: db.paymentMethod,
      createdAt: db.createdAt,
      items: items,
    );
  }

  static Sale toEntity(SaleModel model) {
    return Sale(
      id: model.id,
      invoiceNumber: model.invoiceNumber,
      subtotal: model.subtotal,
      discount: model.discount,
      total: model.total,
      paidAmount: model.paidAmount,
      paymentMethod: model.paymentMethod,
      createdAt: model.createdAt,
      items: model.items
          .map(SaleItemMapper.toEntity)
          .toList(),
    );
  }
}