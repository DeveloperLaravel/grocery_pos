class StockMovement {
  final int id;
  final int productId;
  final String type;
  final double quantity;
  final String? reference;
  final String? note;
  final DateTime createdAt;

  const StockMovement({
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
}