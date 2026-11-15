
import 'package:injectable/injectable.dart';

import '../../domain/entities/home_dashboard.dart';
import '../../domain/repositories/home_repository.dart';

import '../database/home_local_data_source.dart';
import '../mappers/home_dashboard_mapper.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource;

  HomeRepositoryImpl(this._localDataSource);

  @override
  Future<HomeDashboard> getDashboard() async {
    final model = await _localDataSource.getDashboard();

    return HomeDashboardMapper.toEntity(model);
  }
}
