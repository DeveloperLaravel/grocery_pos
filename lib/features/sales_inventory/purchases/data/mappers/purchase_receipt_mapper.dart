import '../../../../../core/database/app_database.dart';

import '../../domain/entities/purchase_receipt.dart';
import '../models/purchase_receipt_model.dart';

class PurchaseReceiptMapper {
  const PurchaseReceiptMapper._();

  // ENTITY -> MODEL

  static PurchaseReceiptModel toModel(
    PurchaseReceipt entity,
  ) {
    return PurchaseReceiptModel.fromEntity(entity);
  }

  // MODEL -> ENTITY

  static PurchaseReceipt toEntity(
    PurchaseReceiptModel model,
  ) {
    return model.toEntity();
  }

  // DRIFT -> MODEL

  static PurchaseReceiptModel fromDb(
    PurchaseReceiptDb db,
  ) {
    return PurchaseReceiptModel.fromDb(db);
  }

  // DRIFT LIST -> MODEL LIST

  static List<PurchaseReceiptModel> fromDbList(
    List<PurchaseReceiptDb> rows,
  ) {
    return rows.map(fromDb).toList();
  }

  // MODEL LIST -> ENTITY LIST

  static List<PurchaseReceipt> toEntities(
    List<PurchaseReceiptModel> models,
  ) {
    return models.map(toEntity).toList();
  }

  // ENTITY LIST -> MODEL LIST

  static List<PurchaseReceiptModel> toModels(
    List<PurchaseReceipt> entities,
  ) {
    return entities.map(toModel).toList();
  }
}