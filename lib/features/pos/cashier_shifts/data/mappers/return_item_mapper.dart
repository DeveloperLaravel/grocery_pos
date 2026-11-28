import '../../../../core/database/app_database.dart';

import '../models/return_item_model.dart';

extension ReturnItemDbMapper on ReturnItemDb {
  ReturnItemModel toModel() {
    return ReturnItemModel(
      id: id,
      returnId: returnId,
      productId: productId,
      quantity: quantity,
      refundAmount: totalAmount,
    );
  }
}
