
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/home_dashboard.dart';
import '../../domain/failures/home_failure.dart';
import '../../domain/repositories/home_repository.dart';

import '../database/home_local_data_source.dart';
import '../mappers/home_dashboard_mapper.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource;

  HomeRepositoryImpl(this._localDataSource);

  @override
  Future<Either<HomeFailure, HomeDashboard>>
      getDashboard() async {
    try {
      final model = await _localDataSource.getDashboard();

      final dashboard = HomeDashboardMapper.toEntity(model);

      return Right(dashboard);
    } catch (error) {
      return Left(
        HomeFailure(
          message: 'تعذر تحميل بيانات لوحة التحكم.',
          cause: error,
        ),
      );
    }
  }
}
