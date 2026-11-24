
import '../../../../../core/database/app_database.dart';
import '../models/purchase_order_model.dart';

class PurchaseOrderMapper {
  const PurchaseOrderMapper._();

  static PurchaseOrderModel fromDb(PurchaseOrderDb db) {
    return PurchaseOrderModel(
      id: db.id,
      supplierId: db.supplierId,
      invoiceNumber: db.invoiceNumber,
      supplierInvoiceNumber: db.supplierInvoiceNumber,
      purchaseDate: db.purchaseDate,
      expectedDeliveryDate: db.expectedDeliveryDate,
      completedAt: db.completedAt,
      subtotal: db.subtotal,
      discount: db.discount,
      tax: db.tax,
      shippingCost: db.shippingCost,
      additionalCost: db.additionalCost,
      total: db.total,
      paidAmount: db.paidAmount,
      remainingAmount: db.remainingAmount,
      status: db.status,
      paymentStatus: db.paymentStatus,
      paymentMethod: db.paymentMethod,
      notes: db.notes,
      internalNotes: db.internalNotes,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  static List<PurchaseOrderModel> fromDbList(
    List<PurchaseOrderDb> rows,
  ) {
    return rows.map(fromDb).toList(growable: false);
  }
}
