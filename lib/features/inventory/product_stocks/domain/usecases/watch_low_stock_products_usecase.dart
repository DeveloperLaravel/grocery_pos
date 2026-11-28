import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class WatchLowStockProductsUseCase {
  final InventoryRepository repository;

  const WatchLowStockProductsUseCase(this.repository);

  Stream<List<InventoryItem>> call() {
    return repository.watchLowStockProducts();
  }
}