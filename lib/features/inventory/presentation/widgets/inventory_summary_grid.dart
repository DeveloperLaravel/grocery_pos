
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/inventory_summary.dart';
import '../helpers/inventory_formatters.dart';
import 'inventory_stat_card.dart';

class InventorySummaryGrid extends StatelessWidget {
  const InventorySummaryGrid({
    super.key,
    required this.summary,
  });

  final InventorySummary summary;

  @override
  Widget build(BuildContext context) {
    final items = [
      _SummaryItem(
        title: 'إجمالي المنتجات',
        value: '${summary.productsCount}',
        subtitle: 'منتج مسجل',
        icon: Icons.category_rounded,
        color: AppColors.info,
      ),
      _SummaryItem(
        title: 'إجمالي الوحدات',
        value: InventoryFormatters.quantity(summary.totalUnits),
        subtitle: 'وحدة داخل المخزون',
        icon: Icons.inventory_2_rounded,
        color: AppColors.primary,
      ),
      _SummaryItem(
        title: 'مخزون منخفض',
        value: '${summary.lowStockCount}',
        subtitle: 'يحتاج إلى متابعة',
        icon: Icons.warning_amber_rounded,
        color: AppColors.stockLow,
      ),
      _SummaryItem(
        title: 'قيمة التكلفة',
        value: InventoryFormatters.currency(
          summary.stockCostValue,
        ),
        subtitle: 'القيمة الشرائية',
        icon: Icons.account_balance_wallet_rounded,
        color: AppColors.expense,
      ),
      _SummaryItem(
        title: 'قيمة البيع',
        value: InventoryFormatters.currency(
          summary.stockSaleValue,
        ),
        subtitle: 'القيمة عند البيع',
        icon: Icons.sell_rounded,
        color: AppColors.revenue,
      ),
      _SummaryItem(
        title: 'الربح المتوقع',
        value: InventoryFormatters.currency(
          summary.potentialProfit,
        ),
        subtitle: 'الفرق بين البيع والتكلفة',
        icon: Icons.trending_up_rounded,
        color: summary.potentialProfit >= 0
            ? AppColors.profit
            : AppColors.loss,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = width >= 1100
            ? 3
            : width >= 480
                ? 2
                : 1;

        const spacing = 14.0;

        final cardWidth =
            (width - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((item) {
            return SizedBox(
              width: cardWidth,
              child: InventoryStatCard(
                title: item.title,
                value: item.value,
                subtitle: item.subtitle,
                icon: item.icon,
                color: item.color,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SummaryItem {
  const _SummaryItem({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
}
