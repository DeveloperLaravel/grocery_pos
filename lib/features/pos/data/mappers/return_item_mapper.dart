
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

import '../models/return_item_model.dart';

extension ReturnItemDbMapper on ReturnItemDb {
  ReturnItemModel toModel() {
    return ReturnItemModel(
      id: id,
      returnId: returnId,
      productId: productId,
      quantity: quantity,
      refundAmount: refundAmount,
    );
  }
}

extension ReturnItemModelMapper on ReturnItemModel {
  ReturnItemsCompanion toCompanion({
    bool includeId = false,
  }) {
    return ReturnItemsCompanion(
      id: includeId
          ? Value(id)
          : const Value.absent(),
      returnId: Value(returnId),
      productId: Value(productId),
      quantity: Value(quantity),
      refundAmount: Value(refundAmount),
    );
  }
}
