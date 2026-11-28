
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/sales_report.dart';
import 'reports_metric_card.dart';

class ReportsSummaryGrid extends StatelessWidget {
  const ReportsSummaryGrid({
    super.key,
    required this.report,
  });

  final SalesReport report;

  @override
  Widget build(BuildContext context) {
    final items = [
      _MetricData(
        title: 'إجمالي المبيعات',
        value: report.salesTotal,
        icon: Icons.point_of_sale_rounded,
        color: AppColors.primary,
      ),
      _MetricData(
        title: 'صافي المبيعات',
        value: report.netSales,
        icon: Icons.trending_up_rounded,
        color: AppColors.success,
      ),
      _MetricData(
        title: 'صافي الربح',
        value: report.netProfit,
        icon: Icons.account_balance_wallet_rounded,
        color: report.netProfit >= 0
            ? AppColors.profit
            : AppColors.loss,
      ),
      _MetricData(
        title: 'تكلفة البضاعة',
        value: report.costOfGoodsSold,
        icon: Icons.inventory_2_outlined,
        color: AppColors.info,
      ),
      _MetricData(
        title: 'الخصومات',
        value: report.discounts,
        icon: Icons.discount_rounded,
        color: AppColors.warning,
      ),
      _MetricData(
        title: 'المرتجعات',
        value: report.returnsTotal,
        icon: Icons.assignment_return_rounded,
        color: AppColors.debt,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = width >= 900
            ? 3
            : width >= 520
                ? 3
                : 2;

        final ratio = width < 360 ? 1.35 : 1.45;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 11,
            mainAxisSpacing: 11,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return ReportsMetricCard(
              title: item.title,
              value: item.value,
              icon: item.icon,
              color: item.color,
            );
          },
        );
      },
    );
  }
}

class _MetricData {
  const _MetricData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final double value;
  final IconData icon;
  final Color color;
}
