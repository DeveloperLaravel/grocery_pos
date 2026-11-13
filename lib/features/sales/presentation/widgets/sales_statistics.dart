
import 'package:flutter/material.dart';

import '../../domain/entities/sale.dart';

class SalesStatistics extends StatelessWidget {
  final List<Sale> sales;

  const SalesStatistics({
    super.key,
    required this.sales,
  });

  double get _totalSales {
    return sales.fold(
      0.0,
      (sum, sale) => sum + sale.total,
    );
  }

  double get _totalPaid {
    return sales.fold(
      0.0,
      (sum, sale) => sum + sale.paidAmount,
    );
  }

  double get _remaining {
    return sales.fold(
      0.0,
      (sum, sale) {
        final value = sale.total - sale.paidAmount;
        return sum + (value > 0 ? value : 0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ملخص المبيعات',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _StatisticsCard(
                  title: 'عدد الفواتير',
                  value: '${sales.length}',
                  icon: Icons.receipt_long_rounded,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatisticsCard(
                  title: 'إجمالي المبيعات',
                  value: _totalSales.toStringAsFixed(2),
                  icon: Icons.trending_up_rounded,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _StatisticsCard(
                  title: 'المبالغ المدفوعة',
                  value: _totalPaid.toStringAsFixed(2),
                  icon: Icons.check_circle_outline,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatisticsCard(
                  title: 'المبالغ المتبقية',
                  value: _remaining.toStringAsFixed(2),
                  icon: Icons.pending_actions_rounded,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
