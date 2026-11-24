import 'package:drift/drift.dart';

import '../../domain/entities/supplier_product.dart';
import '../models/supplier_product_model.dart';

import '../../../../core/database/app_database.dart';

class SupplierProductMapper {
  const SupplierProductMapper._();

  // =====================================================
  // Drift -> Model
  // =====================================================

  static SupplierProductModel fromDatabase(
    SupplierProductDb db,
  ) {
    return SupplierProductModel(
      id: db.id,

      supplierId: db.supplierId,
      productId: db.productId,
      productUnitId: db.productUnitId,

      supplierProductCode: _clean(db.supplierProductCode),
      supplierBarcode: _clean(db.supplierBarcode),

      purchasePrice: db.purchasePrice,
      minimumOrderQuantity: db.minimumOrderQuantity,
      maximumOrderQuantity: db.maximumOrderQuantity,

      deliveryDays: db.deliveryDays,

      isPreferred: db.isPreferred,
      isActive: db.isActive,

      lastPurchaseAt: db.lastPurchaseAt,
      lastPurchasedPrice: db.lastPurchasedPrice,

      notes: _clean(db.notes),

      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // =====================================================
  // Model -> Entity
  // =====================================================

  static SupplierProduct toEntity(
    SupplierProductModel model,
  ) {
    return SupplierProduct(
      id: model.id,

      supplierId: model.supplierId,
      productId: model.productId,
      productUnitId: model.productUnitId,

      supplierProductCode: model.supplierProductCode,
      supplierBarcode: model.supplierBarcode,

      purchasePrice: model.purchasePrice,
      minimumOrderQuantity: model.minimumOrderQuantity,
      maximumOrderQuantity: model.maximumOrderQuantity,

      deliveryDays: model.deliveryDays,

      isPreferred: model.isPreferred,
      isActive: model.isActive,

      lastPurchaseAt: model.lastPurchaseAt,
      lastPurchasedPrice: model.lastPurchasedPrice,

      notes: model.notes,

      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // =====================================================
  // Entity -> Model
  // =====================================================

  static SupplierProductModel fromEntity(
    SupplierProduct entity,
  ) {
    return SupplierProductModel(
      id: entity.id,

      supplierId: entity.supplierId,
      productId: entity.productId,
      productUnitId: entity.productUnitId,

      supplierProductCode: _clean(entity.supplierProductCode),
      supplierBarcode: _clean(entity.supplierBarcode),

      purchasePrice: entity.purchasePrice,
      minimumOrderQuantity: entity.minimumOrderQuantity,
      maximumOrderQuantity: entity.maximumOrderQuantity,

      deliveryDays: entity.deliveryDays,

      isPreferred: entity.isPreferred,
      isActive: entity.isActive,

      lastPurchaseAt: entity.lastPurchaseAt,
      lastPurchasedPrice: entity.lastPurchasedPrice,

      notes: _clean(entity.notes),

      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // =====================================================
  // Drift -> Entity
  // =====================================================

  static SupplierProduct fromDatabaseToEntity(
    SupplierProductDb db,
  ) {
    return toEntity(fromDatabase(db));
  }

  // =====================================================
  // Model -> Drift Companion
  // =====================================================

  static SupplierProductsCompanion toCompanion(
    SupplierProductModel model, {
    bool forUpdate = false,
  }) {
    final now = DateTime.now();

    return SupplierProductsCompanion(
      id: model.id == null
          ? const Value.absent()
          : Value(model.id!),

      supplierId: Value(model.supplierId),
      productId: Value(model.productId),
      productUnitId: Value(model.productUnitId),

      supplierProductCode: Value(
        _clean(model.supplierProductCode),
      ),

      supplierBarcode: Value(
        _clean(model.supplierBarcode),
      ),

      purchasePrice: Value(model.purchasePrice),

      minimumOrderQuantity: Value(
        model.minimumOrderQuantity,
      ),

      maximumOrderQuantity: Value(
        model.maximumOrderQuantity,
      ),

      deliveryDays: Value(model.deliveryDays),

      isPreferred: Value(model.isPreferred),
      isActive: Value(model.isActive),

      lastPurchaseAt: Value(model.lastPurchaseAt),

      lastPurchasedPrice: Value(
        model.lastPurchasedPrice,
      ),

      notes: Value(_clean(model.notes)),

      createdAt: model.createdAt == null
          ? Value(now)
          : Value(model.createdAt!),

      updatedAt: Value(
        forUpdate ? now : model.updatedAt ?? now,
      ),
    );
  }

  // =====================================================
  // Helpers
  // =====================================================

  static String? _clean(String? value) {
    final cleaned = value?.trim();

    if (cleaned == null || cleaned.isEmpty) {
      return null;
    }

    return cleaned;
  }
}