
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';

import '../../domain/entities/supplier.dart';

import '../mappers/supplier_mapper.dart';
import 'suppliers_local_data_source.dart';

@LazySingleton(as: SuppliersLocalDataSource)
class SuppliersLocalDataSourceImpl
    implements SuppliersLocalDataSource {
  final AppDatabase database;

  SuppliersLocalDataSourceImpl(this.database);

  // =====================================================
  // Get All Suppliers
  // =====================================================

  @override
  Future<List<Supplier>> getAllSuppliers() async {
    final rows = await (database.select(database.suppliers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();

    return rows
        .map(SupplierMapper.fromDatabaseToEntity)
        .toList(growable: false);
  }

  // =====================================================
  // Watch All Suppliers
  // =====================================================

  @override
  Stream<List<Supplier>> watchAllSuppliers() {
    return (database.select(database.suppliers)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch()
        .map(
          (rows) => rows
              .map(SupplierMapper.fromDatabaseToEntity)
              .toList(growable: false),
        );
  }

  // =====================================================
  // Get Supplier By ID
  // =====================================================

  @override
  Future<Supplier?> getSupplierById(int id) async {
    if (id <= 0) return null;

    final row = await (database.select(database.suppliers)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    if (row == null) return null;

    return SupplierMapper.fromDatabaseToEntity(row);
  }

  // =====================================================
  // Search Suppliers
  // =====================================================

  @override
  Future<List<Supplier>> searchSuppliers(String query) async {
    final value = query.trim();

    if (value.isEmpty) {
      return getAllSuppliers();
    }

    final rows = await (database.select(database.suppliers)
          ..where(
            (t) =>
                t.name.contains(value) |
                t.supplierCode.contains(value) |
                t.companyName.contains(value) |
                t.contactPerson.contains(value) |
                t.phone.contains(value) |
                t.secondaryPhone.contains(value) |
                t.whatsapp.contains(value) |
                t.email.contains(value) |
                t.taxNumber.contains(value),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();

    return rows
        .map(SupplierMapper.fromDatabaseToEntity)
        .toList(growable: false);
  }

  // =====================================================
  // Create Supplier
  // =====================================================

  @override
  Future<int> createSupplier(Supplier supplier) async {
    _validateSupplier(supplier);

    final model = SupplierMapper.fromEntity(supplier);

    return database.into(database.suppliers).insert(
          SupplierMapper.toCompanion(model),
        );
  }

  // =====================================================
  // Update Supplier
  // =====================================================

  @override
  Future<bool> updateSupplier(
    int id,
    Supplier supplier,
  ) async {
    if (id <= 0) return false;

    _validateSupplier(supplier);

    return database.transaction(() async {
      final existing = await (database.select(database.suppliers)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();

      if (existing == null) return false;

      final model = SupplierMapper.fromEntity(
        supplier.copyWith(id: id),
      );

      final rows = await (database.update(database.suppliers)
            ..where((t) => t.id.equals(id)))
          .write(
        SupplierMapper.toCompanion(
          model,
          forUpdate: true,
        ),
      );

      return rows > 0;
    });
  }

  // =====================================================
  // Delete Supplier
  // =====================================================
  //
  // إذا كان المورد مرتبطاً بمنتجات أو فواتير شراء،
  // نوقفه بدلاً من حذف بياناته التاريخية.
  //
  // =====================================================

  @override
  Future<bool> deleteSupplier(int id) async {
    if (id <= 0) return false;

    return database.transaction(() async {
      final supplier = await (database.select(database.suppliers)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();

      if (supplier == null) return false;

      final linkedProducts = await (database.select(
        database.supplierProducts,
      )
            ..where((t) => t.supplierId.equals(id))
            ..limit(1))
          .getSingleOrNull();

      final linkedOrders = await (database.select(
        database.purchaseOrders,
      )
            ..where((t) => t.supplierId.equals(id))
            ..limit(1))
          .getSingleOrNull();

      if (linkedProducts != null || linkedOrders != null) {
        final rows = await (database.update(database.suppliers)
              ..where((t) => t.id.equals(id)))
            .write(
          SuppliersCompanion(
            isActive: const Value(false),
            updatedAt: Value(DateTime.now()),
          ),
        );

        return rows > 0;
      }

      final rows = await (database.delete(database.suppliers)
            ..where((t) => t.id.equals(id)))
          .go();

      return rows > 0;
    });
  }

  // =====================================================
  // Update Supplier Status
  // =====================================================

  @override
  Future<bool> updateSupplierStatus(
    int id,
    bool isActive,
  ) async {
    if (id <= 0) return false;

    final rows = await (database.update(database.suppliers)
          ..where((t) => t.id.equals(id)))
        .write(
      SuppliersCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // =====================================================
  // Validation
  // =====================================================

  void _validateSupplier(Supplier supplier) {
    final name = supplier.name.trim();

    if (name.isEmpty) {
      throw ArgumentError('اسم المورد مطلوب.');
    }

    if (name.length > 150) {
      throw ArgumentError(
        'اسم المورد يجب ألا يتجاوز 150 حرفاً.',
      );
    }

    if (supplier.supplierCode != null &&
        supplier.supplierCode!.trim().length > 30) {
      throw ArgumentError(
        'كود المورد يجب ألا يتجاوز 30 حرفاً.',
      );
    }

    if (supplier.email != null &&
        supplier.email!.trim().isNotEmpty &&
        !_isValidEmail(supplier.email!.trim())) {
      throw ArgumentError('البريد الإلكتروني غير صالح.');
    }

    if (supplier.rating < 0 || supplier.rating > 5) {
      throw ArgumentError(
        'تقييم المورد يجب أن يكون بين 0 و5.',
      );
    }

    if (supplier.creditLimit < 0) {
      throw ArgumentError(
        'حد الائتمان لا يمكن أن يكون سالباً.',
      );
    }

    if (supplier.paymentTermsDays < 0) {
      throw ArgumentError(
        'مدة السداد لا يمكن أن تكون سالبة.',
      );
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);
  }
}
