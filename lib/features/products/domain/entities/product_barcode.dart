
class ProductBarcode {
  final int id;
  final int productId;
  final int? productUnitId;

  final String barcode;
  final String barcodeType;
  final String? source;

  final bool isDefault;
  final bool isActive;

  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductBarcode({
    required this.id,
    required this.productId,
    this.productUnitId,
    required this.barcode,
    required this.barcodeType,
    this.source,
    required this.isDefault,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isInternal => barcodeType == 'internal';

  bool get isExternal => barcodeType == 'external';

  bool get belongsToUnit => productUnitId != null;
}
