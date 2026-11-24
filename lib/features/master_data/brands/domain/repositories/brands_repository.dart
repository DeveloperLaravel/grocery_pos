import '../entities/brand.dart';
import '../params/create_brand_params.dart';

abstract class BrandsRepository {
  Future<List<Brand>> getAllBrands();

  Future<List<Brand>> getActiveBrands();

  Future<Brand?> getBrandById(int id);

  Future<List<Brand>> searchBrands(String query);

  Stream<List<Brand>> watchAllBrands();

  Stream<List<Brand>> watchActiveBrands();

 Future<int> createBrand(CreateBrandParams params);

  Future<bool> updateBrand(Brand brand);

  Future<bool> deleteBrand(int id);

  Future<bool> toggleStatus(int id);

  Future<bool> isNameExists(
    String name, {
    int? excludeId,
  });

  Future<int> getBrandsCount();

  Future<int> getActiveBrandsCount();
}