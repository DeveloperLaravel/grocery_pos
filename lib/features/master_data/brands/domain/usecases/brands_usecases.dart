
import 'package:injectable/injectable.dart';

import '../entities/brand.dart';
import '../exceptions/brand_validation_exception.dart';
import '../params/create_brand_params.dart';
import '../repositories/brands_repository.dart';




// =====================================================
// Get Active Brands
// =====================================================

@lazySingleton
class GetActiveBrandsUseCase {
  final BrandsRepository repository;

  GetActiveBrandsUseCase(this.repository);

  Future<List<Brand>> call() {
    return repository.getActiveBrands();
  }
}

// =====================================================
// Get Brand By ID
// =====================================================

@lazySingleton
class GetBrandByIdUseCase {
  final BrandsRepository repository;

  GetBrandByIdUseCase(this.repository);

  Future<Brand?> call(int id) {
    return repository.getBrandById(id);
  }
}

// =====================================================
// Search Brands
// =====================================================

@lazySingleton
class SearchBrandsUseCase {
  final BrandsRepository repository;

  SearchBrandsUseCase(this.repository);

  Future<List<Brand>> call(String query) {
    return repository.searchBrands(query.trim());
  }
}

// =====================================================
// Watch All Brands
// =====================================================

@lazySingleton
class WatchAllBrandsUseCase {
  final BrandsRepository repository;

  WatchAllBrandsUseCase(this.repository);

  Stream<List<Brand>> call() {
    return repository.watchAllBrands();
  }
}

// =====================================================
// Watch Active Brands
// =====================================================

@lazySingleton
class WatchActiveBrandsUseCase {
  final BrandsRepository repository;

  WatchActiveBrandsUseCase(this.repository);

  Stream<List<Brand>> call() {
    return repository.watchActiveBrands();
  }
}

// =====================================================
// Create Brand
// =====================================================

@lazySingleton
class CreateBrandUseCase {
  final BrandsRepository repository;

  CreateBrandUseCase(this.repository);

  Future<int> call(CreateBrandParams params) {
    return repository.createBrand(params);
  }
}

// =====================================================
// Update Brand
// =====================================================

@lazySingleton
class UpdateBrandUseCase {
  final BrandsRepository repository;

  UpdateBrandUseCase(this.repository);

  Future<bool> call(Brand brand) async {
    if (brand.id == null) {
      throw const BrandValidationException(
        'معرف العلامة التجارية مطلوب للتعديل',
      );
    }

    final name = brand.name.trim();

    if (name.isEmpty) {
      throw const BrandValidationException(
        'اسم العلامة التجارية مطلوب',
      );
    }

    if (name.length > 100) {
      throw const BrandValidationException(
        'اسم العلامة التجارية يجب ألا يتجاوز 100 حرف',
      );
    }

    final exists = await repository.isNameExists(
      name,
      excludeId: brand.id,
    );

    if (exists) {
      throw const BrandValidationException(
        'اسم العلامة التجارية مستخدم بالفعل',
      );
    }

    final updatedBrand = Brand(
      id: brand.id,
      name: name,
      description: brand.description?.trim(),
      imagePath: brand.imagePath,
      isActive: brand.isActive,
      createdAt: brand.createdAt,
      updatedAt: DateTime.now(),
    );

    return repository.updateBrand(updatedBrand);
  }
}

// =====================================================
// Delete Brand
// =====================================================

@lazySingleton
class DeleteBrandUseCase {
  final BrandsRepository repository;

  DeleteBrandUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.deleteBrand(id);
  }
}

// =====================================================
// Toggle Brand Status
// =====================================================

@lazySingleton
class ToggleBrandStatusUseCase {
  final BrandsRepository repository;

  ToggleBrandStatusUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.toggleStatus(id);
  }
}

// =====================================================
// Check Brand Name
// =====================================================

@lazySingleton
class CheckBrandNameExistsUseCase {
  final BrandsRepository repository;

  CheckBrandNameExistsUseCase(this.repository);

  Future<bool> call(
    String name, {
    int? excludeId,
  }) {
    return repository.isNameExists(
      name.trim(),
      excludeId: excludeId,
    );
  }
}

// =====================================================
// Get Brands Count
// =====================================================

@lazySingleton
class GetBrandsCountUseCase {
  final BrandsRepository repository;

  GetBrandsCountUseCase(this.repository);

  Future<int> call() {
    return repository.getBrandsCount();
  }
}

// =====================================================
// Get Active Brands Count
// =====================================================
@lazySingleton
class GetAllBrandsUseCase {
  final BrandsRepository repository;

  GetAllBrandsUseCase(this.repository);

  Future<List<Brand>> call() async {
    return repository.getAllBrands();
  }
}
@lazySingleton
class GetActiveBrandsCountUseCase {
  final BrandsRepository repository;

  GetActiveBrandsCountUseCase(this.repository);

  Future<int> call() {
    return repository.getActiveBrandsCount();
  }
}
