import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetLowStockProductsUseCase {
  final InventoryRepository repository;

  const GetLowStockProductsUseCase(this.repository);

  TaskEither<Failure, List<InventoryItem>> call() {
    return repository.getLowStockProducts();
  }
}