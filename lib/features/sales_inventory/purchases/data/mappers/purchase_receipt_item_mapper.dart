
import '../../../../../core/database/app_database.dart';
import '../models/purchase_receipt_item_model.dart';

class PurchaseReceiptItemMapper {
  const PurchaseReceiptItemMapper._();

  static PurchaseReceiptItemModel fromDb(
    PurchaseReceiptItemDb db,
  ) {
    return PurchaseReceiptItemModel(
      id: db.id,
      purchaseReceiptId: db.purchaseReceiptId,
      purchaseItemId: db.purchaseItemId,
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
    );
  }

  static List<PurchaseReceiptItemModel> fromDbList(
    List<PurchaseReceiptItemDb> rows,
  ) {
    return rows.map(fromDb).toList(growable: false);
  }
}
