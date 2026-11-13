import '../../../../core/database/app_database.dart';

import '../../domain/entities/sale_item.dart';
import '../models/sale_item_model.dart';

class SaleItemMapper {
  const SaleItemMapper._();

  static SaleItemModel fromDb(SaleItemDb db) {
    return SaleItemModel(
      id: db.id,
      saleId: db.saleId,
      productId: db.productId,
      productName: db.productName,
      quantity: db.quantity,
      unitPrice: db.unitPrice,
      costPrice: db.costPrice,
      total: db.total,
    );
  }

  static SaleItem toEntity(SaleItemModel model) {
    return SaleItem(
      id: model.id,
      saleId: model.saleId,
      productId: model.productId,
      productName: model.productName,
      quantity: model.quantity,
      unitPrice: model.unitPrice,
      costPrice: model.costPrice,
      total: model.total,
    );
  }
}