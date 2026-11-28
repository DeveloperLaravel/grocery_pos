
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/inventory_summary.dart';
import '../repositories/inventory_repository.dart';
@lazySingleton
class GetInventorySummaryUseCase {
  final InventoryRepository repository;

  const GetInventorySummaryUseCase(this.repository);

  TaskEither<Failure, InventorySummary> call() {
    return repository.getInventorySummary();
  }
}