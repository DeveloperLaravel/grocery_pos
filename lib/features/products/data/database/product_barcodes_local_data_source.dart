
import '../models/product_barcode_model.dart';

abstract interface class ProductBarcodesLocalDataSource {
  /// البحث عن باركود بواسطة قيمته.
  Future<ProductBarcodeModel?> getByBarcode(String barcode);

  /// جلب جميع باركودات المنتج.
  Future<List<ProductBarcodeModel>> getByProductId(int productId);

  /// جلب باركودات وحدة معينة.
  Future<List<ProductBarcodeModel>> getByProductUnitId(
    int productUnitId,
  );

  /// إضافة باركود للمنتج أو لإحدى وحداته.
  Future<int> addBarcode({
    required int productId,
    int? productUnitId,
    required String barcode,
    String barcodeType = 'internal',
    bool isDefault = false,
    String? source,
  });

  /// حذف باركود.
  /// يرجع عدد السجلات المحذوفة.
  Future<int> deleteBarcode(int id);

  /// تعيين باركود كافتراضي.
  Future<void> setDefaultBarcode(int id);
}
