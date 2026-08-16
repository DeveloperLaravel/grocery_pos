import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class GetStockMovements {
  final InventoryRepository repository;
  GetStockMovements(this.repository);
  // ignore: always_declare_return_types, strict_top_level_inference
  call({int? productId}) => repository.getMovements(productId: productId);
}
