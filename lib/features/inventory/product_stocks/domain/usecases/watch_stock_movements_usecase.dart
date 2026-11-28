

import '../entities/stock_movement_entity.dart';

import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class WatchStockMovementsUseCase {
  final InventoryRepository repository;

  const WatchStockMovementsUseCase(this.repository);

  Stream<List<StockMovement>> call({
    int? productId,
    int limit = 50,
  }) {
    return repository.watchStockMovements(
      productId: productId,
      limit: limit,
    );
  }
}

