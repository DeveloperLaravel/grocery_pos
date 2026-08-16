class StockMovementEntity {
  final int id;
  final int productId;
  final String productName;
  final String type;
  final double quantity;
  final String? reference;
  final String? note;
  final DateTime createdAt;

  const StockMovementEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.type,
    required this.quantity,
    required this.reference,
    required this.note,
    required this.createdAt,
  });
}
