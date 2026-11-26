
import 'package:injectable/injectable.dart';

import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierPaginationUseCases {
  final SupplierRepository repository;

  SupplierPaginationUseCases(this.repository);

  Future<List<Supplier>> execute({
    required int limit,
    required int offset,
  }) =>
      repository.getSuppliersPaginated(
        limit: limit,
        offset: offset,
      );
}
