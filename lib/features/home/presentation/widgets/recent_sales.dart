import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/home_dashboard.dart';

class RecentSales extends StatelessWidget {
  final List<HomeSale> sales;

  const RecentSales({
    super.key,
    required this.sales,
  });

  @override
  Widget build(BuildContext context) {
    if (sales.isEmpty) {
      return const _EmptySection(
        message: 'لا توجد فواتير حتى الآن',
      );
    }

    return Column(
      children: sales.map((sale) {
        return _SaleItem(sale: sale);
      }).toList(),
    );
  }
}

class _SaleItem extends StatelessWidget {
  final HomeSale sale;

  const _SaleItem({
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final payment = _paymentInfo(sale.paymentMethod);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.55),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: theme.brightness == Brightness.dark ? 0.08 : 0.025,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            // ربط صفحة التفاصيل بعد التأكد من وجود sale.id في HomeSale.
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.receipt_long_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sale.invoiceNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: colors.onSurfaceVariant,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _formatTime(sale.createdAt),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      sale.total.toStringAsFixed(2),
                      maxLines: 1,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.revenue,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: payment.color.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            payment.icon,
                            size: 12,
                            color: payment.color,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            payment.label,
                            style: TextStyle(
                              color: payment.color,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  _PaymentInfo _paymentInfo(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return const _PaymentInfo(
          label: 'نقداً',
          icon: Icons.payments_rounded,
          color: AppColors.success,
        );

      case 'card':
        return const _PaymentInfo(
          label: 'بطاقة',
          icon: Icons.credit_card_rounded,
          color: AppColors.info,
        );

      case 'bank':
      case 'transfer':
        return const _PaymentInfo(
          label: 'تحويل',
          icon: Icons.account_balance_rounded,
          color: AppColors.secondary,
        );

      case 'credit':
        return const _PaymentInfo(
          label: 'آجل',
          icon: Icons.schedule_rounded,
          color: AppColors.warning,
        );

      default:
        return _PaymentInfo(
          label: method,
          icon: Icons.payment_rounded,
          color: AppColors.info,
        );
    }
  }
}

class _PaymentInfo {
  final String label;
  final IconData icon;
  final Color color;

  const _PaymentInfo({
    required this.label,
    required this.icon,
    required this.color,
  });
}

class _EmptySection extends StatelessWidget {
  final String message;

  const _EmptySection({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            message,
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'ستظهر عمليات البيع الجديدة هنا',
            style: TextStyle(
              color: colors.onSurfaceVariant.withValues(alpha: 0.7),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}