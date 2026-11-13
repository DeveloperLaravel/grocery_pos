
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';

import '../../domain/entities/sales_report.dart';
import '../../domain/entities/top_product_report.dart';
import '../../domain/repositories/reports_repository.dart';

import '../database/reports_local_data_source.dart';
import '../mappers/sales_report_mapper.dart';
import '../mappers/top_product_report_mapper.dart';

@LazySingleton(as: ReportsRepository)
class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsLocalDataSource _localDataSource;

  ReportsRepositoryImpl(this._localDataSource);

  @override
  TaskEither<Failure, SalesReport> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return TaskEither.tryCatch(
      () async {
        if (startDate.isAfter(endDate)) {
          throw ArgumentError(
            'تاريخ البداية يجب ألا يكون بعد تاريخ النهاية',
          );
        }

        final model = await _localDataSource.getSalesReport(
          startDate: startDate,
          endDate: endDate,
        );

        return SalesReportMapper.toEntity(model);
      },
      (error, stackTrace) {
        return Failure(
         error.toString(),
        );
      },
    );
  }

  @override
  TaskEither<Failure, List<TopProductReport>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) {
    return TaskEither.tryCatch(
      () async {
        if (startDate.isAfter(endDate)) {
          throw ArgumentError(
            'تاريخ البداية يجب ألا يكون بعد تاريخ النهاية',
          );
        }

        if (limit <= 0) {
          throw ArgumentError(
            'عدد المنتجات يجب أن يكون أكبر من صفر',
          );
        }

        final models = await _localDataSource.getTopProducts(
          startDate: startDate,
          endDate: endDate,
          limit: limit,
        );

        return TopProductReportMapper.toEntityList(models);
      },
      (error, stackTrace) {
        return Failure(
          error.toString(),
        );
      },
    );
  }
}