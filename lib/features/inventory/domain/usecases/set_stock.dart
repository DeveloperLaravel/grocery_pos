import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class SetStock {
  final InventoryRepository repository;
  SetStock(this.repository);
  // ignore: strict_top_level_inference, always_declare_return_types
  call({required int productId, required double newQuantity, required String note}) =>
      repository.setStock(productId: productId, newQuantity: newQuantity, note: note);
}
