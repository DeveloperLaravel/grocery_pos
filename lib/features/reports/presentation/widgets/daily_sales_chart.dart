
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../domain/entities/daily_sales_report.dart';
import 'reports_empty_view.dart';

class DailySalesChart extends StatelessWidget {
  const DailySalesChart({
    super.key,
    required this.data,
  });

  final List<DailySalesReport> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const ReportsEmptyView(
        message: 'لا توجد مبيعات خلال الفترة المحددة',
        icon: Icons.bar_chart_rounded,
      );
    }

    final theme = Theme.of(context);

    final maximum = data.fold<double>(
      0,
      (current, item) =>
          item.totalSales > current ? item.totalSales : current,
    );

    final money = NumberFormat.currency(
      locale: 'ar',
      symbol: 'د.ل',
      decimalDigits: 2,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.show_chart_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 7),
                Text(
                  'المبيعات حسب اليوم',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${data.length} يوم',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 165,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final item in data)
                    Expanded(
                      child: _SalesBar(
                        item: item,
                        maximum: maximum,
                        money: money,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'قيمة المبيعات',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                Text(
                  money.format(
                    data.fold<double>(
                      0,
                      (sum, item) => sum + item.totalSales,
                    ),
                  ),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesBar extends StatelessWidget {
  const _SalesBar({
    required this.item,
    required this.maximum,
    required this.money,
  });

  final DailySalesReport item;
  final double maximum;
  final NumberFormat money;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final ratio = maximum > 0
        ? (item.totalSales / maximum).clamp(0.0, 1.0)
        : 0.0;

    final barHeight = ratio == 0 ? 3.0 : 105.0 * ratio;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: money.format(item.totalSales),
            child: Container(
              height: barHeight,
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.primaryLight,
                    AppColors.primaryDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            DateFormat('MM/dd').format(item.date),
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 9,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
