import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';

class WatchInventoryUseCase {
  final InventoryRepository repository;

  const WatchInventoryUseCase(this.repository);

  Stream<List<InventoryItem>> call() {
    return repository.watchInventory();
  }
}