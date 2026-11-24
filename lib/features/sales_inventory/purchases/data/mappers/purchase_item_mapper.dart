
import '../../../../../core/database/app_database.dart';
import '../models/purchase_item_model.dart';

class PurchaseItemMapper {
  const PurchaseItemMapper._();

  static PurchaseItemModel fromDb(PurchaseItemDb db) {
    return PurchaseItemModel(
      id: db.id,
      purchaseOrderId: db.purchaseOrderId,
      productId: db.productId,
      productUnitId: db.productUnitId,
      productName: db.productName,
      unitName: db.unitName,
      quantity: db.quantity,
      conversionFactor: db.conversionFactor,
      baseQuantity: db.baseQuantity,
      unitPrice: db.unitPrice,
      baseUnitCost: db.baseUnitCost,
      total: db.total,
      notes: db.notes,
    );
  }

  static List<PurchaseItemModel> fromDbList(
    List<PurchaseItemDb> rows,
  ) {
    return rows.map(fromDb).toList(growable: false);
  }
}
