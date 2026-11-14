import '../entities/inventory_summary.dart';
import '../repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class WatchInventorySummaryUseCase {
  final InventoryRepository repository;

  const WatchInventorySummaryUseCase(this.repository);

  Stream<InventorySummary> call() {
    return repository.watchInventorySummary();
  }
}
