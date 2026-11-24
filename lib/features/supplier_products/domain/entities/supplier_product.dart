import 'package:equatable/equatable.dart';

class SupplierProduct extends Equatable {
  final int? id;

  final int supplierId;
  final int productId;
  final int? productUnitId;

  final String? supplierProductCode;
  final String? supplierBarcode;

  final double purchasePrice;
  final double minimumOrderQuantity;
  final double maximumOrderQuantity;

  final int deliveryDays;

  final bool isPreferred;
  final bool isActive;

  final DateTime? lastPurchaseAt;
  final double lastPurchasedPrice;

  final String? notes;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SupplierProduct({
    this.id,
    required this.supplierId,
    required this.productId,
    this.productUnitId,
    this.supplierProductCode,
    this.supplierBarcode,
    this.purchasePrice = 0,
    this.minimumOrderQuantity = 1,
    this.maximumOrderQuantity = 0,
    this.deliveryDays = 0,
    this.isPreferred = false,
    this.isActive = true,
    this.lastPurchaseAt,
    this.lastPurchasedPrice = 0,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        supplierId,
        productId,
        productUnitId,
        supplierProductCode,
        supplierBarcode,
        purchasePrice,
        minimumOrderQuantity,
        maximumOrderQuantity,
        deliveryDays,
        isPreferred,
        isActive,
        lastPurchaseAt,
        lastPurchasedPrice,
        notes,
        createdAt,
        updatedAt,
      ];
}