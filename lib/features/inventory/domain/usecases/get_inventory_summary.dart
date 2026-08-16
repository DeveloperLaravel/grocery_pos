import 'package:injectable/injectable.dart';
import '../repositories/inventory_repository.dart';

@injectable
class GetInventorySummary {
  final InventoryRepository repository;
  GetInventorySummary(this.repository);
  // ignore: strict_top_level_inference, always_declare_return_types
  call() => repository.getSummary();
}
