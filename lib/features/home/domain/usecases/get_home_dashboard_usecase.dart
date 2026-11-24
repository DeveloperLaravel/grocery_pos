
import 'package:injectable/injectable.dart';

import '../entities/home_dashboard.dart';
import '../failures/home_failure.dart';
import '../repositories/home_repository.dart';

import 'package:fpdart/fpdart.dart';

@lazySingleton
class GetHomeDashboardUseCase {
  final HomeRepository _repository;

  GetHomeDashboardUseCase(this._repository);

  Future<Either<HomeFailure, HomeDashboard>> call() {
    return _repository.getDashboard();
  }
}
