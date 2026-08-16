import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class UpdateMinStock {
  final InventoryRepository repository;
  UpdateMinStock(this.repository);
  // ignore: strict_top_level_inference, always_declare_return_types
  call({required int productId, required double minStock}) =>
      repository.updateMinStock(productId: productId, minStock: minStock);
}
