
import '../models/brand_model.dart';

abstract interface class BrandsLocalDataSource {
  Future<List<BrandModel>> getAllBrands();

  Stream<List<BrandModel>> watchAllBrands();

  Future<List<BrandModel>> getActiveBrands();

  Stream<List<BrandModel>> watchActiveBrands();

  Future<BrandModel?> getBrandById(int id);

  Stream<BrandModel?> watchBrandById(int id);

  Future<List<BrandModel>> searchBrands(String query);

  Future<int> insertBrand(BrandModel model);

  Future<int> updateBrand(int id, BrandModel model);

  Future<int> deleteBrand(int id);

  Future<int> activateBrand(int id);

  Future<int> deactivateBrand(int id);

  Future<bool> isNameExists(
    String name, {
    int? excludeId,
  });

  Future<int> getBrandsCount({
    bool activeOnly = false,
  });
}
