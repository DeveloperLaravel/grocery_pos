
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class DeleteProductUseCase {
  final PosRepository _repository;

  DeleteProductUseCase(this._repository);

  TaskEither<Failure, Unit> call(int id) {
    return _repository.deleteProduct(id);
  }
}
