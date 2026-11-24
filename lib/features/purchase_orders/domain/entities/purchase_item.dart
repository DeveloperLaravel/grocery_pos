import 'package:equatable/equatable.dart';

class PurchaseItem extends Equatable {
  final int id;
  final int purchaseOrderId;
  final int productId;
  final int? productUnitId;

  final String productName;
  final String? unitName;

  final double quantity;
  final double conversionFactor;
  final double baseQuantity;

  final double unitPrice;
  final double baseUnitCost;
  final double total;

  final String? notes;

  const PurchaseItem({
    required this.id,
    required this.purchaseOrderId,
    required this.productId,
    this.productUnitId,
    required this.productName,
    this.unitName,
    required this.quantity,
    required this.conversionFactor,
    required this.baseQuantity,
    required this.unitPrice,
    required this.baseUnitCost,
    required this.total,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        purchaseOrderId,
        productId,
        productUnitId,
        productName,
        unitName,
        quantity,
        conversionFactor,
        baseQuantity,
        unitPrice,
        baseUnitCost,
        total,
        notes,
      ];
}