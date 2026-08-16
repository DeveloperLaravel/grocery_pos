import 'package:fpdart/fpdart.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_summary.dart';
import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';

abstract interface class InventoryRepository {
  TaskEither<Failure, List<InventoryItem>> getInventory({String query = ''});
  TaskEither<Failure, List<InventoryItem>> getLowStock();
  TaskEither<Failure, InventorySummary> getSummary();
  TaskEither<Failure, List<StockMovementEntity>> getMovements({int? productId});
  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double delta,
    required String note,
  });
  TaskEither<Failure, Unit> setStock({
    required int productId,
    required double newQuantity,
    required String note,
  });
  TaskEither<Failure, Unit> updateMinStock({
    required int productId,
    required double minStock,
  });
}
