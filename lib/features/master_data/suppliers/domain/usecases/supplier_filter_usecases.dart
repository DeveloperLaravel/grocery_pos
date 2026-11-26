
import 'package:injectable/injectable.dart';

import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierFilterUseCases {
  final SupplierRepository repository;

  SupplierFilterUseCases(this.repository);

  Future<List<Supplier>> byCategory(String category) =>
      repository.getSuppliersByCategory(category);

  Future<List<Supplier>> byLevel(String level) =>
      repository.getSuppliersByLevel(level);

  Future<List<Supplier>> byType(String type) =>
      repository.getSuppliersByType(type);

  Future<List<Supplier>> preferred() =>
      repository.getPreferredSuppliers();

  Future<List<Supplier>> credit() =>
      repository.getCreditSuppliers();

  Future<List<Supplier>> withDebt() =>
      repository.getSuppliersWithDebt();
}
