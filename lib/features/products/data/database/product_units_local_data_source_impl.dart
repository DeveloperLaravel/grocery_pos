
import 'package:injectable/injectable.dart';


import '../../../../core/database/daos/master_data/products/product_units_dao.dart';
import '../mapper/product_unit_mapper.dart';
import '../models/product_unit_model.dart';
import 'product_units_local_data_source.dart';

@LazySingleton(as: ProductUnitsLocalDataSource)
class ProductUnitsLocalDataSourceImpl
    implements ProductUnitsLocalDataSource {
  final ProductUnitsDao dao;

  ProductUnitsLocalDataSourceImpl({
    required this.dao,
  });

  @override
  Future<List<ProductUnitModel>> getByProductId(
    int productId,
  ) async {
    final rows = await dao.getByProductId(productId);

    return rows.map(ProductUnitMapper.fromDb).toList();
  }

  @override
  Future<List<ProductUnitModel>> getActiveByProductId(
    int productId,
  ) async {
    final rows = await dao.getActiveByProductId(productId);

    return rows.map(ProductUnitMapper.fromDb).toList();
  }

  @override
  Future<ProductUnitModel?> getById(int id) async {
    final row = await dao.getById(id);

    if (row == null) return null;

    return ProductUnitMapper.fromDb(row);
  }

  @override
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
  }) {
    return dao.addUnit(
      productId: productId,
      unitName: unitName,
      unitSymbol: unitSymbol,
      conversionFactor: conversionFactor,
      salePrice: salePrice,
      purchasePrice: purchasePrice,
      isBaseUnit: isBaseUnit,
      isDefault: isDefault,
      sortOrder: sortOrder,
    );
  }

  @override
  Future<bool> updateUnit({
    required int id,
    required String unitName,
    String? unitSymbol,
    required double conversionFactor,
    required double salePrice,
    required double purchasePrice,
    required bool isActive,
    required int sortOrder,
  }) {
    return dao.updateUnit(
      id: id,
      unitName: unitName,
      unitSymbol: unitSymbol,
      conversionFactor: conversionFactor,
      salePrice: salePrice,
      purchasePrice: purchasePrice,
      isActive: isActive,
      sortOrder: sortOrder,
    );
  }

  @override
  Future<int> setDefaultUnit({
    required int productId,
    required int unitId,
  }) {
    return dao.setDefaultUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  @override
  Future<int> deactivateUnit(int id) {
    return dao.deactivateUnit(id);
  }
}
