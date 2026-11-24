import '../../../../../core/database/app_database.dart';

import '../../domain/entities/purchase_payment.dart';
import '../models/purchase_payment_model.dart';

class PurchasePaymentMapper {
  const PurchasePaymentMapper._();

  // ENTITY -> MODEL

  static PurchasePaymentModel toModel(
    PurchasePayment entity,
  ) {
    return PurchasePaymentModel.fromEntity(entity);
  }

  // MODEL -> ENTITY

  static PurchasePayment toEntity(
    PurchasePaymentModel model,
  ) {
    return model.toEntity();
  }

  // DRIFT -> MODEL

  static PurchasePaymentModel fromDb(
    PurchasePaymentDb db,
  ) {
    return PurchasePaymentModel.fromDb(db);
  }

  // DRIFT LIST -> MODEL LIST

  static List<PurchasePaymentModel> fromDbList(
    List<PurchasePaymentDb> rows,
  ) {
    return rows.map(fromDb).toList();
  }

  // MODEL LIST -> ENTITY LIST

  static List<PurchasePayment> toEntities(
    List<PurchasePaymentModel> models,
  ) {
    return models.map(toEntity).toList();
  }

  // ENTITY LIST -> MODEL LIST

  static List<PurchasePaymentModel> toModels(
    List<PurchasePayment> entities,
  ) {
    return entities.map(toModel).toList();
  }
}