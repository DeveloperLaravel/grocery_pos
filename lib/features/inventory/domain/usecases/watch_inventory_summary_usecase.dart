import '../entities/inventory_summary.dart';
import '../repositories/inventory_repository.dart';

class WatchInventorySummaryUseCase {
  final InventoryRepository repository;

  const WatchInventorySummaryUseCase(this.repository);

  Stream<InventorySummary> call() {
    return repository.watchInventorySummary();
  }
}
