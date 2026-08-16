import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/pos/domain/pos_repository.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

@injectable
class FindProductByBarcode {
  final PosRepository repository;
  FindProductByBarcode(this.repository);
  TaskEither<Failure, ProductEntity?> call(String barcode) => repository.findByBarcode(barcode);
}
