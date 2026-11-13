
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../pos_repository.dart';

class DeleteProductUseCase {
  final PosRepository repository;

  DeleteProductUseCase(this.repository);

  TaskEither<Failure, Unit> call(int id) {
    return repository.deleteProduct(id);
  }
}
