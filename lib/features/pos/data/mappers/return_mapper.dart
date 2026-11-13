
import 'package:drift/drift.dart';

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
      total: total,
      createdAt: createdAt,
      items: items.map((item) => item.toModel()).toList(),
    );
  }
}

extension ReturnModelMapper on ReturnModel {
  ReturnsCompanion toCompanion({
    bool includeId = false,
  }) {
    return ReturnsCompanion(
      id: includeId
          ? Value(id)
          : const Value.absent(),
      saleId: Value(saleId),
      total: Value(total),
      createdAt: Value(createdAt),
    );
  }
}
