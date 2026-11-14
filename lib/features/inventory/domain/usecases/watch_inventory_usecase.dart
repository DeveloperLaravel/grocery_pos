import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class WatchInventoryUseCase {
  final InventoryRepository repository;

  const WatchInventoryUseCase(this.repository);

  Stream<List<InventoryItem>> call() {
    return repository.watchInventory();
  }
}