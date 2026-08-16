import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class AdjustStock {
  final InventoryRepository repository;
  AdjustStock(this.repository);
  // ignore: strict_top_level_inference, always_declare_return_types
  call({required int productId, required double delta, required String note}) =>
      repository.adjustStock(productId: productId, delta: delta, note: note);
}
