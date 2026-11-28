import '../../../../core/database/app_database.dart';

import '../models/return_model.dart';

import 'return_item_mapper.dart';

extension ReturnDbMapper on ReturnDb {
  ReturnModel toModel({
    List<ReturnItemDb> items = const [],
  }) {
    return ReturnModel(
      id: id,
      saleId: saleId,
      total: totalAmount,
      createdAt: createdAt,
      items: items.map((item) => item.toModel()).toList(),
    );
  }
}
