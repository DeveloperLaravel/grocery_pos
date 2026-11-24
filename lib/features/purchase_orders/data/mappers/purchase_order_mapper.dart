
import '../../../../core/database/app_database.dart';

import '../../domain/entities/purchase_order.dart';
import '../../domain/entities/purchase_item.dart';
import '../../domain/entities/purchase_line_input.dart';
import '../../domain/entities/purchase_order_details.dart';

import '../models/purchase_order_model.dart';
import '../models/purchase_item_model.dart';
import '../models/purchase_line_input_model.dart';
import '../models/purchase_order_details_model.dart';

class PurchaseOrderMapper {
  const PurchaseOrderMapper._();

  // =====================================================
  // PURCHASE ORDER
  // =====================================================

  static PurchaseOrderModel orderFromDb(PurchaseOrderDb db) {
    return PurchaseOrderModel.fromDb(db);
  }

  static PurchaseOrder orderToEntity(
    PurchaseOrderModel model,
  ) {
    return model.toEntity();
  }

  static PurchaseOrderModel orderFromEntity(
    PurchaseOrder entity,
  ) {
    return PurchaseOrderModel.fromEntity(entity);
  }

  // =====================================================
  // PURCHASE ITEM
  // =====================================================

  static PurchaseItemModel itemFromDb(PurchaseItemDb db) {
    return PurchaseItemModel.fromDb(db);
  }

  static PurchaseItem itemToEntity(
    PurchaseItemModel model,
  ) {
    return model.toEntity();
  }

  static PurchaseItemModel itemFromEntity(
    PurchaseItem entity,
  ) {
    return PurchaseItemModel.fromEntity(entity);
  }

  // =====================================================
  // PURCHASE LINE INPUT
  // =====================================================

  static PurchaseLineInputModel lineInputFromEntity(
    PurchaseLineInput entity,
  ) {
    return PurchaseLineInputModel.fromEntity(entity);
  }

  // =====================================================
  // PURCHASE ORDER DETAILS
  // =====================================================

  static PurchaseOrderDetailsModel detailsFromEntities({
    required PurchaseOrder order,
    required List<PurchaseItem> items,
  }) {
    return PurchaseOrderDetailsModel(
      order: orderFromEntity(order),
      items: items.map(itemFromEntity).toList(),
    );
  }

  static PurchaseOrderDetails detailsToEntity(
    PurchaseOrderDetailsModel model,
  ) {
    return model.toEntity();
  }

  // =====================================================
  // LIST MAPPERS
  // =====================================================

  static List<PurchaseOrder> ordersToEntities(
    List<PurchaseOrderModel> models,
  ) {
    return models.map(orderToEntity).toList();
  }

  static List<PurchaseItem> itemsToEntities(
    List<PurchaseItemModel> models,
  ) {
    return models.map(itemToEntity).toList();
  }

  static List<PurchaseOrderModel> ordersFromDb(
    List<PurchaseOrderDb> orders,
  ) {
    return orders.map(orderFromDb).toList();
  }

  static List<PurchaseItemModel> itemsFromDb(
    List<PurchaseItemDb> items,
  ) {
    return items.map(itemFromDb).toList();
  }
}
