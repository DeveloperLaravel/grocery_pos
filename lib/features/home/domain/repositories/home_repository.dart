
import 'package:fpdart/fpdart.dart';

import '../entities/home_dashboard.dart';
import '../failures/home_failure.dart';

abstract class HomeRepository {
  Future<Either<HomeFailure, HomeDashboard>> getDashboard();
}
