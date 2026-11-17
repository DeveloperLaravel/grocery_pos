
import '../../domain/entities/sales_report.dart';
import '../../domain/entities/top_product_report.dart';
import '../../domain/entities/daily_sales_report.dart';

enum ReportsStatus {
  initial,
  loading,
  success,
  failure,
}

class ReportsState {
  final ReportsStatus status;

  final DateTime startDate;
  final DateTime endDate;

  final SalesReport? salesReport;

  final List<TopProductReport> topProducts;
  final List<DailySalesReport> dailySales;

  final String? errorMessage;

  const ReportsState({
    this.status = ReportsStatus.initial,
    required this.startDate,
    required this.endDate,
    this.salesReport,
    this.topProducts = const [],
    this.dailySales = const [],
    this.errorMessage,
  });

  factory ReportsState.initial() {
    final now = DateTime.now();

    return ReportsState(
      startDate: DateTime(now.year, now.month, 1),
      endDate: DateTime(now.year, now.month, now.day),
    );
  }

  ReportsState copyWith({
    ReportsStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    SalesReport? salesReport,
    List<TopProductReport>? topProducts,
    List<DailySalesReport>? dailySales,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ReportsState(
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      salesReport: salesReport ?? this.salesReport,
      topProducts: topProducts ?? this.topProducts,
      dailySales: dailySales ?? this.dailySales,
      errorMessage: clearError
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
