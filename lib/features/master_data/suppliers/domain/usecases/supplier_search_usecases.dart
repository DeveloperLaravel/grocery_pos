
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../../../core/error/failure.dart';
import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierSearchUseCases {
  final SupplierRepository _repository;

  SupplierSearchUseCases(this._repository);

  // البحث عن الموردين مرة واحدة
  TaskEither<Failure, List<Supplier>> search(String query) {
    return TaskEither.tryCatch(
      () => _repository.searchSuppliers(query),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }

  // البحث مع مراقبة التغييرات المستمرة
  Stream<List<Supplier>> watchSearch(String query) {
    return _repository.watchSearchSuppliers(query);
  }

  // جلب الموردين باستخدام Pagination
  TaskEither<Failure, List<Supplier>> paginate({
    required int limit,
    required int offset,
  }) {
    return TaskEither.tryCatch(
      () => _repository.getSuppliersPaginated(
        limit: limit,
        offset: offset,
      ),
      (error, stackTrace) =>
          ErrorHandler.handle(error, stackTrace),
    );
  }
}
