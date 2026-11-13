
import 'package:flutter/material.dart';

import '../../domain/entities/sale.dart';
import '../../domain/entities/sale_item.dart';

class SaleDetailsSheet extends StatelessWidget {
  final Sale sale;

  const SaleDetailsSheet({
    super.key,
    required this.sale,
  });

  static Future<void> show(
    BuildContext context,
    Sale sale,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SaleDetailsSheet(sale: sale),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final value = date.toLocal();

    return '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')} '
        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final remaining = (sale.total - sale.paidAmount)
        .clamp(0, double.infinity)
        .toDouble();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),

          Container(
            width: 42,
            height: 5,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Icon(
                  Icons.receipt_long_rounded,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تفاصيل الفاتورة',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'رقم الفاتورة: ${sale.invoiceNumber}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                _DetailRow(
                  title: 'تاريخ الفاتورة',
                  value: _formatDate(sale.createdAt),
                ),

                _DetailRow(
                  title: 'طريقة الدفع',
                  value: _paymentMethod(sale.paymentMethod),
                ),

                const SizedBox(height: 20),

                Text(
                  'المنتجات',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...sale.items.map(
                  (item) => _SaleItemTile(item: item),
                ),

                const SizedBox(height: 20),

                const Divider(),

                _DetailRow(
                  title: 'المجموع قبل الخصم',
                  value: sale.subtotal.toStringAsFixed(2),
                ),

                _DetailRow(
                  title: 'الخصم',
                  value: sale.discount.toStringAsFixed(2),
                ),

                _DetailRow(
                  title: 'الإجمالي',
                  value: sale.total.toStringAsFixed(2),
                  isBold: true,
                ),

                _DetailRow(
                  title: 'المبلغ المدفوع',
                  value: sale.paidAmount.toStringAsFixed(2),
                ),

                _DetailRow(
                  title: 'المبلغ المتبقي',
                  value: remaining.toStringAsFixed(2),
                  isBold: true,
                  valueColor: remaining > 0
                      ? Colors.orange
                      : Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _paymentMethod(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return 'نقداً';
      case 'card':
        return 'بطاقة مصرفية';
      default:
        return method;
    }
  }
}

class _SaleItemTile extends StatelessWidget {
  final SaleItem item;

  const _SaleItemTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest
            .withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.inventory_2_outlined),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'الكمية: ${item.quantity} × ${item.unitPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),

          Text(
            item.total.toStringAsFixed(2),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _DetailRow({
    required this.title,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isBold
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
