import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_barcode.dart';

part 'barcodes_event.freezed.dart';

@freezed
sealed class BarcodesEvent with _$BarcodesEvent {
  /// مراقبة باركودات المنتج
  const factory BarcodesEvent.watchRequested({
    required int productId,
  }) = WatchBarcodesRequested;

  /// تحميل باركودات المنتج
  const factory BarcodesEvent.loadRequested({
    required int productId,
  }) = LoadBarcodesRequested;

  /// البحث عن باركود
  const factory BarcodesEvent.barcodeLookupRequested({
    required String barcode,
  }) = BarcodeLookupRequested;

  /// البحث عن المنتج بواسطة الباركود
  const factory BarcodesEvent.productLookupRequested({
    required String barcode,
  }) = ProductLookupRequested;

  /// إضافة باركود
  const factory BarcodesEvent.addRequested({
    required ProductBarcode barcode,
  }) = AddBarcodeRequested;

  /// تعيين الباركود الافتراضي
  const factory BarcodesEvent.setDefaultRequested({
    required int productId,
    required int barcodeId,
  }) = SetDefaultBarcodeRequested;

  /// حذف باركود
  const factory BarcodesEvent.deleteRequested({
    required int id,
  }) = DeleteBarcodeRequested;

  /// تحديثات Stream
  const factory BarcodesEvent.streamUpdated({
    required List<ProductBarcode> barcodes,
  }) = BarcodeStreamUpdated;

  /// خطأ Stream
  const factory BarcodesEvent.streamFailed({
    required String message,
  }) = BarcodeStreamFailed;

  /// مسح نتائج البحث
  const factory BarcodesEvent.clearLookup() = ClearBarcodeLookup;
}