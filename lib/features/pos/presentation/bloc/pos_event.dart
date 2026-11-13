import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product_entity.dart';

part 'pos_event.freezed.dart';

@freezed
sealed class PosEvent with _$PosEvent {
  const factory PosEvent.loadRequested() = PosLoadRequested;

  const factory PosEvent.searchChanged({
    required String query,
  }) = PosSearchChanged;

  const factory PosEvent.barcodeScanned({
    required String barcode,
  }) = PosBarcodeScanned;

  const factory PosEvent.cartProductAdded({
    required ProductEntity product,
  }) = PosCartProductAdded;

  const factory PosEvent.cartProductRemoved({
    required int productId,
  }) = PosCartProductRemoved;

  const factory PosEvent.cartQuantityChanged({
    required int productId,
    required double delta,
  }) = PosCartQuantityChanged;

  const factory PosEvent.cartCleared() = PosCartCleared;

  const factory PosEvent.discountChanged({
    required double discount,
  }) = PosDiscountChanged;

  const factory PosEvent.checkoutRequested({
    required double paid,
    required String paymentMethod,
  }) = PosCheckoutRequested;

  const factory PosEvent.receiptDismissed() = PosReceiptDismissed;

  const factory PosEvent.stockAdjustmentRequested({
    required int productId,
    required double delta,
    required String note,
  }) = PosStockAdjustmentRequested;

  const factory PosEvent.productCreated({
    required ProductEntity product,
  }) = PosProductCreated;

  const factory PosEvent.productUpdated({
    required int id,
    required ProductEntity product,
  }) = PosProductUpdated;

  const factory PosEvent.productDeleted({
    required int productId,
  }) = PosProductDeleted;

  const factory PosEvent.returnSaleItemRequested({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) = PosReturnSaleItemRequested;
}