
import 'package:injectable/injectable.dart';

import '../entities/home_dashboard.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetHomeDashboardUseCase {
  final HomeRepository _repository;

  GetHomeDashboardUseCase(this._repository);

  Future<HomeDashboard> call() {
    return _repository.getDashboard();
  }
}
