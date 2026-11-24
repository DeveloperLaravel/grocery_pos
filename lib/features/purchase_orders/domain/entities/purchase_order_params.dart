
import 'package:freezed_annotation/freezed_annotation.dart';

import 'purchase_order_enums.dart';

part 'purchase_order_params.freezed.dart';

@freezed
abstract class PurchaseOrderParams with _$PurchaseOrderParams {
  const factory PurchaseOrderParams({
    required int supplierId,
    required String invoiceNumber,

    String? supplierInvoiceNumber,

    required DateTime purchaseDate,
    DateTime? expectedDeliveryDate,

    @Default(0.0) double subtotal,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    @Default(0.0) double shippingCost,
    @Default(0.0) double additionalCost,

    @Default(0.0) double paidAmount,

    @Default(PurchaseOrderStatus.draft)
    PurchaseOrderStatus status,

    @Default(PurchasePaymentMethod.bankTransfer)
    PurchasePaymentMethod paymentMethod,

    String? notes,
    String? internalNotes,
  }) = _PurchaseOrderParams;
}
