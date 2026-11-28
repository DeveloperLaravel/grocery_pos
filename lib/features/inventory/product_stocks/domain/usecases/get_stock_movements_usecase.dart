
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/stock_movement_entity.dart';
import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetStockMovementsUseCase {
  final InventoryRepository repository;

  const GetStockMovementsUseCase(this.repository);

  TaskEither<Failure, List<StockMovement>> call({
    int? productId,
    int limit = 50,
  }) {
    return repository.getStockMovements(
      productId: productId,
      limit: limit,
    );
  }
}
