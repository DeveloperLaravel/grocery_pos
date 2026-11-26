
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../../../core/error/failure.dart';
import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierCrudUseCases {
  final SupplierRepository _repository;

  SupplierCrudUseCases(this._repository);

  // إضافة مورد
  TaskEither<Failure, int> insert(Supplier supplier) {
    return TaskEither.tryCatch(
      () => _repository.insertSupplier(supplier),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }

  // تحديث مورد
  TaskEither<Failure, int> update({
    required int id,
    required Supplier supplier,
  }) {
    return TaskEither.tryCatch(
      () => _repository.updateSupplier(
        id: id,
        supplier: supplier,
      ),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }

  // حذف مورد
  TaskEither<Failure, int> delete(int id) {
    return TaskEither.tryCatch(
      () => _repository.deleteSupplier(id),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }

  // أرشفة مورد
  TaskEither<Failure, int> archive(int id) {
    return TaskEither.tryCatch(
      () => _repository.archiveSupplier(id),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }
}
