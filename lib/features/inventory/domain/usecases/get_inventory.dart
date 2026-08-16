import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class GetInventory {
  final InventoryRepository repository;
  GetInventory(this.repository);
  // ignore: strict_top_level_inference, always_declare_return_types
  call({String query = ''}) => repository.getInventory(query: query);
}
