
import 'return_item_entity.dart';

class ReturnEntity {
  final int id;
  final int saleId;
  final double total;
  final DateTime createdAt;
  final List<ReturnItemEntity> items;

  const ReturnEntity({
    required this.id,
    required this.saleId,
    required this.total,
    required this.createdAt,
    this.items = const [],
  });

  int get itemsCount => items.length;

  double get totalQuantity {
    return items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  ReturnEntity copyWith({
    int? id,
    int? saleId,
    double? total,
    DateTime? createdAt,
    List<ReturnItemEntity>? items,
  }) {
    return ReturnEntity(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
    );
  }
}
