
import '../../../../core/database/app_database.dart';

import '../../domain/entities/stock_movement_entity.dart';
import '../models/stock_movement_model.dart';

extension StockMovementDbMapper on StockMovementDb {
  StockMovementModel toModel() {
    return StockMovementModel(
      id: id,
      productId: productId,
      type: type,
      quantity: quantity,
      reference: reference,
      note: note,
      createdAt: createdAt,
    );
  }
}

extension StockMovementModelMapper on StockMovementModel {
  StockMovement toEntity() {
    return StockMovement(
      id: id,
      productId: productId,
      type: type,
      quantity: quantity,
      reference: reference,
      note: note,
      createdAt: createdAt,
    );
  }
}
