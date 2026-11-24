
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/database/app_database.dart';
import '../../../../../core/database/daos/master_data/parties/brands_dao.dart';
import '../database/brands_local_data_source.dart';
import '../mappers/brand_mapper.dart';
import '../models/brand_model.dart';

@LazySingleton(as: BrandsLocalDataSource)
class BrandsLocalDataSourceImpl implements BrandsLocalDataSource {
  final BrandsDao _dao;

  BrandsLocalDataSourceImpl(this._dao);

  @override
  Future<List<BrandModel>> getAllBrands() async {
    final result = await _dao.getAllBrands();
    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<BrandModel>> watchAllBrands() {
    return _dao.watchAllBrands().map(
          (items) => items.map((e) => e.toModel()).toList(),
        );
  }

  @override
  Future<List<BrandModel>> getActiveBrands() async {
    final result = await _dao.getActiveBrands();
    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<BrandModel>> watchActiveBrands() {
    return _dao.watchActiveBrands().map(
          (items) => items.map((e) => e.toModel()).toList(),
        );
  }

  @override
  Future<BrandModel?> getBrandById(int id) async {
    final result = await _dao.getBrandById(id);
    return result?.toModel();
  }

  @override
  Stream<BrandModel?> watchBrandById(int id) {
    return _dao.watchBrandById(id).map(
          (item) => item?.toModel(),
        );
  }

  @override
  Future<List<BrandModel>> searchBrands(String query) async {
    final result = await _dao.searchBrands(query);
    return result.map((e) => e.toModel()).toList();
  }

  @override
  Future<int> insertBrand(BrandModel model) {
    return _dao.insertBrand(
      BrandsCompanion.insert(
        name: model.name,
        description: Value(model.description),
        imagePath: Value(model.imagePath),
        isActive: Value(model.isActive),
      ),
    );
  }

  @override
  Future<int> updateBrand(int id, BrandModel model) {
    return _dao.updateBrand(
      id,
      BrandsCompanion(
        name: Value(model.name),
        description: Value(model.description),
        imagePath: Value(model.imagePath),
        isActive: Value(model.isActive),
      ),
    );
  }

  @override
  Future<int> deleteBrand(int id) {
    return _dao.deleteBrand(id);
  }

  @override
  Future<int> activateBrand(int id) {
    return _dao.activateBrand(id);
  }

  @override
  Future<int> deactivateBrand(int id) {
    return _dao.deactivateBrand(id);
  }

  @override
  Future<bool> isNameExists(
    String name, {
    int? excludeId,
  }) {
    return _dao.isNameExists(
      name,
      excludeId: excludeId,
    );
  }

  @override
  Future<int> getBrandsCount({
    bool activeOnly = false,
  }) {
    return _dao.getBrandsCount(
      activeOnly: activeOnly,
    );
  }
}
