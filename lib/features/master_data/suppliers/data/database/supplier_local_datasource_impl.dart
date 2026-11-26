import 'package:injectable/injectable.dart';

import '../../../../../../core/database/daos/master_data/parties/suppliers_dao.dart';
import '../../domain/entities/supplier.dart';
import '../mappers/supplier_mapper.dart';
import 'suppliers_local_data_source.dart';

@LazySingleton(as: SupplierLocalDataSource)
class SupplierLocalDataSourceImpl
    implements SupplierLocalDataSource {
  final SuppliersDao _dao;
  final SupplierMapper _mapper;

  SupplierLocalDataSourceImpl(
    this._dao,
    this._mapper,
  );

  // =====================================================
  // 1. CRUD
  // =====================================================

  @override
  Future<int> insertSupplier(Supplier supplier) {
    return _dao.insertSupplier(
      _mapper.toCompanion(supplier),
    );
  }

  @override
  Future<int> updateSupplier({
    required int id,
    required Supplier supplier,
  }) {
    return _dao.updateSupplier(
      id: id,
      supplier: _mapper.toCompanion(supplier),
    );
  }

  @override
  Future<int> deleteSupplier(int id) {
    return _dao.deleteSupplier(id);
  }

  @override
  Future<int> archiveSupplier(int id) {
    return _dao.archiveSupplier(id);
  }

  // =====================================================
  // 2. Get
  // =====================================================

  @override
  Future<List<Supplier>> getAllSuppliers() async {
    final rows = await _dao.getAllSuppliers();
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getActiveSuppliers() async {
    final rows = await _dao.getActiveSuppliers();
    return _mapper.fromDbList(rows);
  }

  @override
  Future<Supplier?> getSupplierById(int id) async {
    final row = await _dao.getSupplierById(id);

    return row == null
        ? null
        : _mapper.fromDb(row).toEntity();
  }

  @override
  Future<Supplier?> getSupplierByCode(String code) async {
    final row = await _dao.getSupplierByCode(code);

    return row == null
        ? null
        : _mapper.fromDb(row).toEntity();
  }

  // =====================================================
  // 3. Watch
  // =====================================================

  @override
  Stream<List<Supplier>> watchAllSuppliers() {
    return _mapper.fromDbStream(
      _dao.watchAllSuppliers(),
    );
  }

  @override
  Stream<List<Supplier>> watchActiveSuppliers() {
    return _mapper.fromDbStream(
      _dao.watchActiveSuppliers(),
    );
  }

  @override
  Stream<Supplier?> watchSupplierById(int id) {
    return _mapper.fromDbSingleStream(
      _dao.watchSupplierById(id),
    );
  }

  // =====================================================
  // 4. Search
  // =====================================================

  @override
  Future<List<Supplier>> searchSuppliers(String query) async {
    final rows = await _dao.searchSuppliers(query);
    return _mapper.fromDbList(rows);
  }

  @override
  Stream<List<Supplier>> watchSearchSuppliers(String query) {
    return _mapper.fromDbStream(
      _dao.watchSearchSuppliers(query),
    );
  }

  // =====================================================
  // 5. Classification
  // =====================================================

  @override
  Future<List<Supplier>> getSuppliersByCategory(
    String category,
  ) async {
    final rows = await _dao.getSuppliersByCategory(category);
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getSuppliersByLevel(
    String level,
  ) async {
    final rows = await _dao.getSuppliersByLevel(level);
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getSuppliersByType(
    String type,
  ) async {
    final rows = await _dao.getSuppliersByType(type);
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getPreferredSuppliers() async {
    final rows = await _dao.getPreferredSuppliers();
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getCreditSuppliers() async {
    final rows = await _dao.getCreditSuppliers();
    return _mapper.fromDbList(rows);
  }

  @override
  Future<List<Supplier>> getSuppliersWithDebt() async {
    final rows = await _dao.getSuppliersWithDebt();
    return _mapper.fromDbList(rows);
  }

  // =====================================================
  // 6. Pagination
  // =====================================================

  @override
  Future<List<Supplier>> getSuppliersPaginated({
    required int limit,
    required int offset,
  }) async {
    final rows = await _dao.getSuppliersPaginated(
      limit: limit,
      offset: offset,
    );

    return _mapper.fromDbList(rows);
  }

  // =====================================================
  // 7. Financial
  // =====================================================

  @override
  Future<int> updateSupplierBalance({
    required int id,
    required double balance,
  }) {
    return _dao.updateSupplierBalance(
      id: id,
      balance: balance,
    );
  }

  @override
  Future<double> getTotalSupplierBalance() {
    return _dao.getTotalSupplierBalance();
  }

  // =====================================================
  // 8. Rating
  // =====================================================

  @override
  Future<int> updateSupplierRating({
    required int id,
    required double rating,
  }) {
    return _dao.updateSupplierRating(
      id: id,
      rating: rating,
    );
  }

  // =====================================================
  // 9. Preferred
  // =====================================================

  @override
  Future<int> togglePreferredStatus({
    required int id,
    required bool isPreferred,
  }) {
    return _dao.togglePreferredStatus(
      id: id,
      isPreferred: isPreferred,
    );
  }

  // =====================================================
  // 10. Activity
  // =====================================================

  @override
  Future<int> toggleSupplierStatus({
    required int id,
    required bool isActive,
  }) {
    return _dao.toggleSupplierStatus(
      id: id,
      isActive: isActive,
    );
  }

  @override
  Future<int> updateLastPurchaseAt({
    required int id,
    required DateTime date,
  }) {
    return _dao.updateLastPurchaseAt(
      id: id,
      date: date,
    );
  }

  @override
  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  }) {
    return _dao.updateLastPaymentAt(
      id: id,
      date: date,
    );
  }

  // =====================================================
  // 11. Statistics
  // =====================================================

  @override
  Future<int> countSuppliers() {
    return _dao.countSuppliers();
  }

  @override
  Future<int> countActiveSuppliers() {
    return _dao.countActiveSuppliers();
  }

  // =====================================================
  // 12. Validation
  // =====================================================

  @override
  Future<bool> supplierCodeExists(
    String code, {
    int? excludeId,
  }) {
    return _dao.supplierCodeExists(
      code,
      excludeId: excludeId,
    );
  }
}