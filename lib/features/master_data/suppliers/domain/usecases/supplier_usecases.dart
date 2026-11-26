
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../../../core/error/failure.dart';

import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

// =========================================================
// Base helper
// =========================================================

TaskEither<Failure, T> _task<T>(Future<T> Function() action) {
  return TaskEither.tryCatch(
    action,
    (error, stackTrace) => ErrorHandler.handle(error, stackTrace),
  );
}

// =========================================================
// 1. CRUD UseCases
// =========================================================

@lazySingleton
class SupplierCrudUseCases {
  final SupplierRepository _repository;

  SupplierCrudUseCases(this._repository);

  TaskEither<Failure, int> insert(Supplier supplier) =>
      _task(() => _repository.insertSupplier(supplier));

  TaskEither<Failure, int> update({
    required int id,
    required Supplier supplier,
  }) =>
      _task(() => _repository.updateSupplier(
            id: id,
            supplier: supplier,
          ));

  TaskEither<Failure, int> delete(int id) =>
      _task(() => _repository.deleteSupplier(id));

  TaskEither<Failure, int> archive(int id) =>
      _task(() => _repository.archiveSupplier(id));
}

// =========================================================
// 2. Query UseCases
// =========================================================

@lazySingleton
class SupplierQueryUseCases {
  final SupplierRepository _repository;

  SupplierQueryUseCases(this._repository);

  TaskEither<Failure, List<Supplier>> getAll() =>
      _task(_repository.getAllSuppliers);

  TaskEither<Failure, List<Supplier>> getActive() =>
      _task(_repository.getActiveSuppliers);

  TaskEither<Failure, Supplier?> getById(int id) =>
      _task(() => _repository.getSupplierById(id));

  TaskEither<Failure, Supplier?> getByCode(String code) =>
      _task(() => _repository.getSupplierByCode(code));

  Stream<List<Supplier>> watchAll() =>
      _repository.watchAllSuppliers();

  Stream<List<Supplier>> watchActive() =>
      _repository.watchActiveSuppliers();

  Stream<Supplier?> watchById(int id) =>
      _repository.watchSupplierById(id);
}

// =========================================================
// 3. Search UseCases
// =========================================================

@lazySingleton
class SupplierSearchUseCases {
  final SupplierRepository _repository;

  SupplierSearchUseCases(this._repository);

  TaskEither<Failure, List<Supplier>> search(String query) =>
      _task(() => _repository.searchSuppliers(query));

  Stream<List<Supplier>> watchSearch(String query) =>
      _repository.watchSearchSuppliers(query);

  TaskEither<Failure, List<Supplier>> paginate({
    required int limit,
    required int offset,
  }) =>
      _task(() => _repository.getSuppliersPaginated(
            limit: limit,
            offset: offset,
          ));
}

// =========================================================
// 4. Classification UseCases
// =========================================================

@lazySingleton
class SupplierClassificationUseCases {
  final SupplierRepository _repository;

  SupplierClassificationUseCases(this._repository);

  TaskEither<Failure, List<Supplier>> byCategory(String category) =>
      _task(() => _repository.getSuppliersByCategory(category));

  TaskEither<Failure, List<Supplier>> byLevel(String level) =>
      _task(() => _repository.getSuppliersByLevel(level));

  TaskEither<Failure, List<Supplier>> byType(String type) =>
      _task(() => _repository.getSuppliersByType(type));

  TaskEither<Failure, List<Supplier>> preferred() =>
      _task(_repository.getPreferredSuppliers);

  TaskEither<Failure, List<Supplier>> withDebt() =>
      _task(_repository.getSuppliersWithDebt);

  TaskEither<Failure, List<Supplier>> credit() =>
      _task(_repository.getCreditSuppliers);
}

// =========================================================
// 5. Financial UseCases
// =========================================================

@lazySingleton
class SupplierFinancialUseCases {
  final SupplierRepository _repository;

  SupplierFinancialUseCases(this._repository);

  TaskEither<Failure, int> updateBalance({
    required int id,
    required double balance,
  }) =>
      _task(() => _repository.updateSupplierBalance(
            id: id,
            balance: balance,
          ));

  TaskEither<Failure, double> getTotalBalance() =>
      _task(_repository.getTotalSupplierBalance);
}

// =========================================================
// 6. Supplier Management UseCases
// =========================================================

@lazySingleton
class SupplierManagementUseCases {
  final SupplierRepository _repository;

  SupplierManagementUseCases(this._repository);

  TaskEither<Failure, int> updateRating({
    required int id,
    required double rating,
  }) =>
      _task(() => _repository.updateSupplierRating(
            id: id,
            rating: rating,
          ));

  TaskEither<Failure, int> togglePreferred({
    required int id,
    required bool isPreferred,
  }) =>
      _task(() => _repository.togglePreferredStatus(
            id: id,
            isPreferred: isPreferred,
          ));

  TaskEither<Failure, int> toggleStatus({
    required int id,
    required bool isActive,
  }) =>
      _task(() => _repository.toggleSupplierStatus(
            id: id,
            isActive: isActive,
          ));

  TaskEither<Failure, int> updateLastPurchase({
    required int id,
    required DateTime date,
  }) =>
      _task(() => _repository.updateLastPurchaseAt(
            id: id,
            date: date,
          ));

  TaskEither<Failure, int> updateLastPayment({
    required int id,
    required DateTime date,
  }) =>
      _task(() => _repository.updateLastPaymentAt(
            id: id,
            date: date,
          ));
}

// =========================================================
// 7. Statistics UseCases
// =========================================================

@lazySingleton
class SupplierStatisticsUseCases {
  final SupplierRepository _repository;

  SupplierStatisticsUseCases(this._repository);

  TaskEither<Failure, int> countAll() =>
      _task(_repository.countSuppliers);

  TaskEither<Failure, int> countActive() =>
      _task(_repository.countActiveSuppliers);

  TaskEither<Failure, double> totalBalance() =>
      _task(_repository.getTotalSupplierBalance);

  // Fetch all statistics together.
  TaskEither<Failure, SupplierStatistics> getStatistics() {
    return _task(() async {
      final results = await Future.wait([
        _repository.countSuppliers(),
        _repository.countActiveSuppliers(),
        _repository.getTotalSupplierBalance(),
      ]);

      return SupplierStatistics(
        total: results[0] as int,
        active: results[1] as int,
        totalBalance: results[2] as double,
      );
    });
  }
}

// =========================================================
// Statistics Entity
// =========================================================

class SupplierStatistics {
  final int total;
  final int active;
  final double totalBalance;

  const SupplierStatistics({
    required this.total,
    required this.active,
    required this.totalBalance,
  });
}

// =========================================================
// 8. Validation UseCases
// =========================================================

@lazySingleton
class SupplierValidationUseCases {
  final SupplierRepository _repository;

  SupplierValidationUseCases(this._repository);

  TaskEither<Failure, bool> codeExists(
    String code, {
    int? excludeId,
  }) =>
      _task(() => _repository.supplierCodeExists(
            code,
            excludeId: excludeId,
          ));
}
