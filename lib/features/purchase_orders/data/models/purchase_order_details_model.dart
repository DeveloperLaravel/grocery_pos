
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/purchase_order_details.dart';
import 'purchase_order_model.dart';
import 'purchase_item_model.dart';

part 'purchase_order_details_model.freezed.dart';
part 'purchase_order_details_model.g.dart';

@freezed
abstract class PurchaseOrderDetailsModel
    with _$PurchaseOrderDetailsModel {
  const factory PurchaseOrderDetailsModel({
    required PurchaseOrderModel order,
    @Default([]) List<PurchaseItemModel> items,
  }) = _PurchaseOrderDetailsModel;

  factory PurchaseOrderDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PurchaseOrderDetailsModelFromJson(json);

  factory PurchaseOrderDetailsModel.fromEntity(
    PurchaseOrderDetails entity,
  ) {
    return PurchaseOrderDetailsModel(
      order: PurchaseOrderModel.fromEntity(entity.order),
      items: entity.items
          .map(PurchaseItemModel.fromEntity)
          .toList(),
    );
  }
}

extension PurchaseOrderDetailsModelMapper
    on PurchaseOrderDetailsModel {
  PurchaseOrderDetails toEntity() {
    return PurchaseOrderDetails(
      order: order.toEntity(),
      items: items.map((e) => e.toEntity()).toList(),
    );
  }
}
