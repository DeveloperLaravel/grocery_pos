
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_sales_report_usecase.dart';
import '../../domain/usecases/get_top_products_usecase.dart';
import '../../domain/usecases/get_daily_sales_usecase.dart';

import 'reports_state.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  final GetSalesReportUseCase getSalesReport;
  final GetTopProductsUseCase getTopProducts;
  final GetDailySalesUseCase getDailySales;

  ReportsCubit(
    this.getSalesReport,
    this.getTopProducts,
    this.getDailySales,
  ) : super(ReportsState.initial());

  // =========================================
  // Load Reports
  // =========================================

  Future<void> loadReports() async {
    emit(state.copyWith(
      status: ReportsStatus.loading,
      clearError: true,
    ));

    try {
      final results = await Future.wait([
        getSalesReport(
          startDate: state.startDate,
          endDate: state.endDate,
        ),
        getTopProducts(
          startDate: state.startDate,
          endDate: state.endDate,
          limit: 10,
        ),
        getDailySales(
          startDate: state.startDate,
          endDate: state.endDate,
        ),
      ]);

      emit(state.copyWith(
        status: ReportsStatus.success,
        salesReport: results[0] as dynamic,
        topProducts: results[1] as dynamic,
        dailySales: results[2] as dynamic,
        clearError: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: ReportsStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  // =========================================
  // Change Date Range
  // =========================================

  Future<void> setDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (startDate.isAfter(endDate)) {
      emit(state.copyWith(
        status: ReportsStatus.failure,
        errorMessage: 'تاريخ البداية يجب أن يسبق تاريخ النهاية.',
      ));
      return;
    }

    emit(state.copyWith(
      startDate: startDate,
      endDate: endDate,
    ));

    await loadReports();
  }

  // =========================================
  // Quick Filters
  // =========================================

  Future<void> today() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);

    return setDateRange(
      startDate: date,
      endDate: date,
    );
  }

  Future<void> lastSevenDays() {
    final now = DateTime.now();

    return setDateRange(
      startDate: DateTime(now.year, now.month, now.day)
          .subtract(const Duration(days: 6)),
      endDate: now,
    );
  }

  Future<void> thisMonth() {
    final now = DateTime.now();

    return setDateRange(
      startDate: DateTime(now.year, now.month, 1),
      endDate: now,
    );
  }

  Future<void> refresh() => loadReports();
}
