
import 'package:flutter/material.dart';

import '../../domain/entities/sale.dart';

class SaleCard extends StatelessWidget {
  final Sale sale;
  final VoidCallback onTap;
  final VoidCallback onCancel;

  const SaleCard({
    super.key,
    required this.sale,
    required this.onTap,
    required this.onCancel,
  });

  String get _date {
    final date = sale.createdAt.toLocal();

    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      Icons.receipt_long_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'فاتورة #${sale.invoiceNumber}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _date,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const Divider(height: 1),

              const SizedBox(height: 12),

              Row(
                children: [
                  _InfoItem(
                    label: 'المنتجات',
                    value: '${sale.items.length}',
                    icon: Icons.shopping_bag_outlined,
                  ),
                  const Spacer(),
                  _InfoItem(
                    label: 'الإجمالي',
                    value: sale.total.toStringAsFixed(2),
                    icon: Icons.payments_outlined,
                    isHighlighted: true,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _PaymentInfo(
                      label: 'المدفوع',
                      value: sale.paidAmount,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PaymentInfo(
                      label: 'المتبقي',
                      value: (sale.total - sale.paidAmount)
                          .clamp(0, double.infinity)
                          .toDouble(),
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton.icon(
                  onPressed: onCancel,
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 18,
                  ),
                  label: const Text('إلغاء الفاتورة'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isHighlighted;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.icon,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isHighlighted
                    ? theme.colorScheme.primary
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentInfo extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _PaymentInfo({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.toStringAsFixed(2),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
