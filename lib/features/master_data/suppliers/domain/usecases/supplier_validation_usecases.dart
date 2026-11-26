
import 'package:injectable/injectable.dart';

import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierValidationUseCases {
  final SupplierRepository repository;

  SupplierValidationUseCases(this.repository);

  Future<bool> codeExists(
    String code, {
    int? excludeId,
  }) =>
      repository.supplierCodeExists(
        code,
        excludeId: excludeId,
      );
}
