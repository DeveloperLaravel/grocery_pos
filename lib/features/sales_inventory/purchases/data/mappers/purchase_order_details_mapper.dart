import '../../domain/entities/purchase_order_details.dart';
import '../models/purchase_order_details_model.dart';

class PurchaseOrderDetailsMapper {
  const PurchaseOrderDetailsMapper._();

  // ENTITY -> MODEL

  static PurchaseOrderDetailsModel toModel(
    PurchaseOrderDetails entity,
  ) {
    return PurchaseOrderDetailsModel.fromEntity(entity);
  }

  // MODEL -> ENTITY

  static PurchaseOrderDetails toEntity(
    PurchaseOrderDetailsModel model,
  ) {
    return model.toEntity();
  }

  // LIST CONVERSIONS

  static List<PurchaseOrderDetailsModel> toModels(
    List<PurchaseOrderDetails> entities,
  ) {
    return entities.map(toModel).toList();
  }

  static List<PurchaseOrderDetails> toEntities(
    List<PurchaseOrderDetailsModel> models,
  ) {
    return models.map(toEntity).toList();
  }
}