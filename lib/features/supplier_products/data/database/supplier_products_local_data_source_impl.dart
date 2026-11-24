import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';

import '../mappers/supplier_product_mapper.dart';
import '../models/supplier_product_model.dart';
import 'suppliers_local_data_source.dart';

@LazySingleton(as: SupplierProductsLocalDataSource)
class SupplierProductsLocalDataSourceImpl
    implements SupplierProductsLocalDataSource {
  final AppDatabase database;

  SupplierProductsLocalDataSourceImpl(this.database);

  // =====================================================
  // Get All
  // =====================================================

  @override
  Future<List<SupplierProductModel>> getAll() async {
    final query = database.select(database.supplierProducts)
      ..orderBy([
        (table) => OrderingTerm.desc(table.updatedAt),
      ]);

    final rows = await query.get();

    return rows
        .map(SupplierProductMapper.fromDatabase)
        .toList();
  }

  // =====================================================
  // Watch All
  // =====================================================

  @override
  Stream<List<SupplierProductModel>> watchAll() {
    final query = database.select(database.supplierProducts)
      ..orderBy([
        (table) => OrderingTerm.desc(table.updatedAt),
      ]);

    return query.watch().map(
          (rows) => rows
              .map(SupplierProductMapper.fromDatabase)
              .toList(),
        );
  }

  // =====================================================
  // Get By Supplier
  // =====================================================

  @override
  Future<List<SupplierProductModel>> getBySupplierId(
    int supplierId,
  ) async {
    final query = database.select(database.supplierProducts)
      ..where(
        (table) => table.supplierId.equals(supplierId),
      )
      ..orderBy([
        (table) => OrderingTerm.desc(table.isPreferred),
        (table) => OrderingTerm.desc(table.updatedAt),
      ]);

    final rows = await query.get();

    return rows
        .map(SupplierProductMapper.fromDatabase)
        .toList();
  }

  // =====================================================
  // Watch By Supplier
  // =====================================================

  @override
  Stream<List<SupplierProductModel>> watchBySupplierId(
    int supplierId,
  ) {
    final query = database.select(database.supplierProducts)
      ..where(
        (table) => table.supplierId.equals(supplierId),
      )
      ..orderBy([
        (table) => OrderingTerm.desc(table.isPreferred),
        (table) => OrderingTerm.desc(table.updatedAt),
      ]);

    return query.watch().map(
          (rows) => rows
              .map(SupplierProductMapper.fromDatabase)
              .toList(),
        );
  }

  // =====================================================
  // Get By Product
  // =====================================================

  @override
  Future<List<SupplierProductModel>> getByProductId(
    int productId,
  ) async {
    final query = database.select(database.supplierProducts)
      ..where(
        (table) => table.productId.equals(productId),
      )
      ..orderBy([
        (table) => OrderingTerm.desc(table.isPreferred),
        (table) => OrderingTerm.desc(table.updatedAt),
      ]);

    final rows = await query.get();

    return rows
        .map(SupplierProductMapper.fromDatabase)
        .toList();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  @override
  Future<SupplierProductModel?> getById(int id) async {
    final query = database.select(database.supplierProducts)
      ..where((table) => table.id.equals(id))
      ..limit(1);

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    return SupplierProductMapper.fromDatabase(row);
  }

  // =====================================================
  // Create
  // =====================================================

  @override
  Future<int> create(
    SupplierProductModel supplierProduct,
  ) async {
    _validate(supplierProduct);

    await _ensureNoDuplicate(
      supplierId: supplierProduct.supplierId,
      productId: supplierProduct.productId,
      productUnitId: supplierProduct.productUnitId,
    );

    final companion = SupplierProductMapper.toCompanion(
      supplierProduct,
    );

    return database.into(database.supplierProducts).insert(
          companion,
        );
  }

  // =====================================================
  // Update
  // =====================================================

  @override
  Future<void> update(
    SupplierProductModel supplierProduct,
  ) async {
    final id = supplierProduct.id;

    if (id == null || id <= 0) {
      throw ArgumentError('معرف ربط المورد بالمنتج غير صالح');
    }

    _validate(supplierProduct);

    final existing = await getById(id);

    if (existing == null) {
      throw Exception('ربط المورد بالمنتج غير موجود');
    }

    await _ensureNoDuplicate(
      supplierId: supplierProduct.supplierId,
      productId: supplierProduct.productId,
      productUnitId: supplierProduct.productUnitId,
      excludedId: id,
    );

    final companion = SupplierProductMapper.toCompanion(
      supplierProduct,
      forUpdate: true,
    );

    final affectedRows = await (database.update(
      database.supplierProducts,
    )..where((table) => table.id.equals(id)))
        .write(companion);

    if (affectedRows == 0) {
      throw Exception('لم يتم تعديل بيانات ربط المورد بالمنتج');
    }
  }

  // =====================================================
  // Delete
  // =====================================================

  @override
  Future<void> delete(int id) async {
    if (id <= 0) {
      throw ArgumentError('معرف ربط المورد بالمنتج غير صالح');
    }

    final affectedRows = await (database.delete(
      database.supplierProducts,
    )..where((table) => table.id.equals(id)))
        .go();

    if (affectedRows == 0) {
      throw Exception('ربط المورد بالمنتج غير موجود');
    }
  }

  // =====================================================
  // Update Status
  // =====================================================

  @override
  Future<void> updateStatus({
    required int id,
    required bool isActive,
  }) async {
    final affectedRows = await (database.update(
      database.supplierProducts,
    )..where((table) => table.id.equals(id)))
        .write(
      SupplierProductsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (affectedRows == 0) {
      throw Exception('ربط المورد بالمنتج غير موجود');
    }
  }

  // =====================================================
  // Update Preferred
  // =====================================================

  @override
  Future<void> updatePreferred({
    required int id,
    required bool isPreferred,
  }) async {
    final affectedRows = await (database.update(
      database.supplierProducts,
    )..where((table) => table.id.equals(id)))
        .write(
      SupplierProductsCompanion(
        isPreferred: Value(isPreferred),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (affectedRows == 0) {
      throw Exception('ربط المورد بالمنتج غير موجود');
    }
  }

  // =====================================================
  // Duplicate Validation
  // =====================================================

  Future<void> _ensureNoDuplicate({
    required int supplierId,
    required int productId,
    required int? productUnitId,
    int? excludedId,
  }) async {
    final query = database.select(database.supplierProducts)
      ..where(
        (table) =>
            table.supplierId.equals(supplierId) &
            table.productId.equals(productId),
      );

    final rows = await query.get();

    final duplicate = rows.any((row) {
      if (excludedId != null && row.id == excludedId) {
        return false;
      }

      return row.productUnitId == productUnitId;
    });

    if (duplicate) {
      throw Exception(
        'هذا المنتج والوحدة مرتبطان بهذا المورد مسبقاً',
      );
    }
  }

  // =====================================================
  // Validation
  // =====================================================

  void _validate(SupplierProductModel item) {
    if (item.supplierId <= 0) {
      throw ArgumentError('يجب تحديد المورد');
    }

    if (item.productId <= 0) {
      throw ArgumentError('يجب تحديد المنتج');
    }

    if (item.productUnitId != null && item.productUnitId! <= 0) {
      throw ArgumentError('وحدة المنتج غير صالحة');
    }

    if (item.purchasePrice < 0) {
      throw ArgumentError('سعر الشراء لا يمكن أن يكون سالباً');
    }

    if (item.minimumOrderQuantity <= 0) {
      throw ArgumentError('الحد الأدنى للطلب يجب أن يكون أكبر من صفر');
    }

    if (item.maximumOrderQuantity < 0) {
      throw ArgumentError('الحد الأقصى للطلب لا يمكن أن يكون سالباً');
    }

    if (item.maximumOrderQuantity > 0 &&
        item.maximumOrderQuantity < item.minimumOrderQuantity) {
      throw ArgumentError(
        'الحد الأقصى للطلب يجب ألا يقل عن الحد الأدنى',
      );
    }

    if (item.deliveryDays < 0) {
      throw ArgumentError('مدة التوريد لا يمكن أن تكون سالبة');
    }

    if (item.lastPurchasedPrice < 0) {
      throw ArgumentError('آخر سعر شراء لا يمكن أن يكون سالباً');
    }
  }
}