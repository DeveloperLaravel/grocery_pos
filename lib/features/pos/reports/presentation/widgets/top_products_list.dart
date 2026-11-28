
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/top_product_report.dart';
import 'reports_empty_view.dart';

class TopProductsList extends StatelessWidget {
  const TopProductsList({
    super.key,
    required this.products,
  });

  final List<TopProductReport> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const ReportsEmptyView(
        message: 'لا توجد منتجات مباعة خلال الفترة المحددة',
        icon: Icons.inventory_2_outlined,
      );
    }

    final money = NumberFormat.currency(
      locale: 'ar',
      symbol: 'د.ل',
      decimalDigits: 2,
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var index = 0; index < products.length; index++) ...[
            _ProductItem(
              product: products[index],
              index: index,
              money: money,
            ),
            if (index != products.length - 1)
              const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    required this.product,
    required this.index,
    required this.money,
  });

  final TopProductReport product;
  final int index;
  final NumberFormat money;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final rankColor = switch (index) {
      0 => AppColors.accent,
      1 => AppColors.secondary,
      2 => AppColors.info,
      _ => theme.colorScheme.onSurfaceVariant,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: rankColor.withOpacity(0.13),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: rankColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'الكمية المباعة: ${product.quantitySold}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                money.format(product.salesTotal),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'الربح ${money.format(product.grossProfit)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: product.grossProfit >= 0
                      ? AppColors.profit
                      : AppColors.loss,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
