
import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/master_data/products/product_barcodes_dao.dart';
import '../mapper/product_barcode_mapper.dart';
import '../models/product_barcode_model.dart';
import 'product_barcodes_local_data_source.dart';

@LazySingleton(as: ProductBarcodesLocalDataSource)
class ProductBarcodesLocalDataSourceImpl
    implements ProductBarcodesLocalDataSource {
  final ProductBarcodesDao dao;

  ProductBarcodesLocalDataSourceImpl({
    required this.dao,
  });

  /// البحث عن باركود.
  @override
  Future<ProductBarcodeModel?> getByBarcode(
    String barcode,
  ) async {
    final value = barcode.trim();

    if (value.isEmpty) {
      return null;
    }

    final result = await dao.getByBarcode(value);

    if (result == null) {
      return null;
    }

    return ProductBarcodeMapper.fromDb(result);
  }

  /// جلب باركودات المنتج.
  @override
  Future<List<ProductBarcodeModel>> getByProductId(
    int productId,
  ) async {
    final result = await dao.getByProductId(productId);

    return result
        .map(ProductBarcodeMapper.fromDb)
        .toList();
  }

  /// جلب باركودات وحدة المنتج.
  @override
  Future<List<ProductBarcodeModel>> getByProductUnitId(
    int productUnitId,
  ) async {
    final result = await dao.getByProductUnitId(productUnitId);

    return result
        .map(ProductBarcodeMapper.fromDb)
        .toList();
  }

  /// إضافة باركود.
  @override
  Future<int> addBarcode({
    required int productId,
    int? productUnitId,
    required String barcode,
    String barcodeType = 'internal',
    bool isDefault = false,
    String? source,
  }) {
    final value = barcode.trim();

    if (value.isEmpty) {
      throw ArgumentError('الباركود لا يمكن أن يكون فارغاً');
    }

    return dao.addBarcode(
      productId: productId,
      productUnitId: productUnitId,
      barcode: value,
      barcodeType: barcodeType,
      isDefault: isDefault,
      source: source?.trim(),
    );
  }

  /// حذف باركود.
  @override
  Future<int> deleteBarcode(int id) {
    return dao.deleteBarcode(id);
  }

  /// تعيين باركود افتراضي.
  @override
  Future<void> setDefaultBarcode(int id) {
    return dao.setDefaultBarcode(id);
  }
}
