import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';

class GetLowStockProductsUseCase {
  final InventoryRepository repository;

  const GetLowStockProductsUseCase(this.repository);

  TaskEither<Failure, List<InventoryItem>> call() {
    return repository.getLowStockProducts();
  }
}