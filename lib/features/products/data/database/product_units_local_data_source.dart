
import '../models/product_unit_model.dart';

abstract interface class ProductUnitsLocalDataSource {
  /// جميع وحدات المنتج.
  Future<List<ProductUnitModel>> getByProductId(
    int productId,
  );

  /// الوحدات النشطة فقط.
  Future<List<ProductUnitModel>> getActiveByProductId(
    int productId,
  );

  /// وحدة بواسطة ID.
  Future<ProductUnitModel?> getById(int id);

  /// إضافة وحدة جديدة.
  Future<int> addUnit({
    required int productId,
    required String unitName,
    String? unitSymbol,
    double conversionFactor = 1,
    double salePrice = 0,
    double purchasePrice = 0,
    bool isBaseUnit = false,
    bool isDefault = false,
    int sortOrder = 0,
  });

  /// تعديل وحدة.
  Future<bool> updateUnit({
    required int id,
    required String unitName,
    String? unitSymbol,
    required double conversionFactor,
    required double salePrice,
    required double purchasePrice,
    required bool isActive,
    required int sortOrder,
  });

  /// تعيين الوحدة الافتراضية.
  Future<int> setDefaultUnit({
    required int productId,
    required int unitId,
  });

  /// تعطيل وحدة دون حذفها.
  Future<int> deactivateUnit(int id);
}
