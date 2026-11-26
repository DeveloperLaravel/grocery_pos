
import 'package:injectable/injectable.dart';

import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierWatchUseCases {
  final SupplierRepository repository;

  SupplierWatchUseCases(this.repository);

  Stream<List<Supplier>> watchAll() =>
      repository.watchAllSuppliers();

  Stream<List<Supplier>> watchActive() =>
      repository.watchActiveSuppliers();

  Stream<Supplier?> watchById(int id) =>
      repository.watchSupplierById(id);

  Stream<List<Supplier>> watchSearch(String query) =>
      repository.watchSearchSuppliers(query);
}
