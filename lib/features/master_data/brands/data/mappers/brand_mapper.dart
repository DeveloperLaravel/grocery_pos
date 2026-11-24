
import '../../../../../core/database/app_database.dart';
import '../../domain/entities/brand.dart';
import '../models/brand_model.dart';

// =====================================================
// Database → Model
// =====================================================

extension BrandDbMapper on BrandDb {
  BrandModel toModel() {
    return BrandModel(
      id: id,
      name: name,
      description: description,
      imagePath: imagePath,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// =====================================================
// Model → Entity
// =====================================================

extension BrandModelMapper on BrandModel {
  Brand toEntity() {
    return Brand(
      id: id,
      name: name,
      description: description,
      imagePath: imagePath,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// =====================================================
// Entity → Model
// =====================================================

extension BrandEntityMapper on Brand {
  BrandModel toModel() {
    final brandId = id;
    final created = createdAt;
    final updated = updatedAt;

    if (brandId == null || brandId <= 0) {
      throw StateError(
        'Cannot convert an unsaved Brand to BrandModel.',
      );
    }

    if (created == null || updated == null) {
      throw StateError(
        'Brand timestamps cannot be null when converting to BrandModel.',
      );
    }

    return BrandModel(
      id: brandId,
      name: name,
      description: description,
      imagePath: imagePath,
      isActive: isActive,
      createdAt: created,
      updatedAt: updated,
    );
  }
}
