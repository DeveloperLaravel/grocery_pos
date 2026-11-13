
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

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
  StockMovementsCompanion toCompanion({
    bool includeId = false,
  }) {
    return StockMovementsCompanion(
      id: includeId
          ? Value(id)
          : const Value.absent(),
      productId: Value(productId),
      type: Value(type),
      quantity: Value(quantity),
      reference: Value(reference),
      note: Value(note),
      createdAt: Value(createdAt),
    );
  }
}
