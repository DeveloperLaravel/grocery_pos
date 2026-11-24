import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_product_model.freezed.dart';

@freezed
abstract class SupplierProductModel with _$SupplierProductModel {
  const factory SupplierProductModel({
    int? id,

    required int supplierId,
    required int productId,
    int? productUnitId,

    String? supplierProductCode,
    String? supplierBarcode,

    @Default(0.0) double purchasePrice,
    @Default(1.0) double minimumOrderQuantity,
    @Default(0.0) double maximumOrderQuantity,

    @Default(0) int deliveryDays,

    @Default(false) bool isPreferred,
    @Default(true) bool isActive,

    DateTime? lastPurchaseAt,
    @Default(0.0) double lastPurchasedPrice,

    String? notes,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SupplierProductModel;
}