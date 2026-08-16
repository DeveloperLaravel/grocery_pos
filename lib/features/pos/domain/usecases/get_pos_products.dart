import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/pos/domain/pos_repository.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

@injectable
class GetPosProducts {
  final PosRepository repository;
  GetPosProducts(this.repository);
  TaskEither<Failure, List<ProductEntity>> call([String query = '']) => repository.getProducts(query: query);
}
