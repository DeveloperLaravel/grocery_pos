
class StockMovementEntity {
  final int id;
  final int productId;

  final String type;
  final double quantity;

  final String? reference;
  final String? note;

  final DateTime createdAt;

  const StockMovementEntity({
    required this.id,
    required this.productId,
    required this.type,
    required this.quantity,
    this.reference,
    this.note,
    required this.createdAt,
  });

  bool get isIncoming =>
      type == 'in' || type == 'return';

  bool get isOutgoing =>
      type == 'out' || type == 'sale';

  String get movementLabel {
    switch (type) {
      case 'in':
        return 'إضافة مخزون';

      case 'out':
        return 'صرف مخزون';

      case 'sale':
        return 'بيع';

      case 'return':
        return 'مرتجع';

      default:
        return 'حركة أخرى';
    }
  }

  StockMovementEntity copyWith({
    int? id,
    int? productId,
    String? type,
    double? quantity,
    String? reference,
    String? note,
    DateTime? createdAt,
  }) {
    return StockMovementEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      reference: reference ?? this.reference,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
