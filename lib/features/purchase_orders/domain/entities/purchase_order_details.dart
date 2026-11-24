import 'package:equatable/equatable.dart';

import 'purchase_order.dart';
import 'purchase_item.dart';

class PurchaseOrderDetails extends Equatable {
  final PurchaseOrder order;
  final List<PurchaseItem> items;

  const PurchaseOrderDetails({
    required this.order,
    required this.items,
  });

  double get itemsCount => items.length.toDouble();

  double get totalQuantity => items.fold<double>(
        0,
        (sum, item) => sum + item.quantity,
      );

  double get totalBaseQuantity => items.fold<double>(
        0,
        (sum, item) => sum + item.baseQuantity,
      );

  @override
  List<Object?> get props => [order, items];
}