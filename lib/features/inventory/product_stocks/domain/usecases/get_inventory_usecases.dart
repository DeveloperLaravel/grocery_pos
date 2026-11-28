
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';

// =============================================
// Get Inventory
// =============================================
@lazySingleton
class GetInventoryUseCase {
  final InventoryRepository repository;

  const GetInventoryUseCase(this.repository);

  TaskEither<Failure, List<InventoryItem>> call() {
    return repository.getInventory();
  }
}





