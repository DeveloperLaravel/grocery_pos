import 'package:flutter/material.dart';

import '../domain/entities/sale_receipt.dart';

class ReceiptPage extends StatelessWidget {
  final SaleReceipt receipt;

  const ReceiptPage({
    super.key,
    required this.receipt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('فاتورة البيع'),
        actions: [
          IconButton(
            tooltip: 'طباعة',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('اربط زر الطباعة بخدمة PDF الخاصة بك'),
                ),
              );
            },
            icon: const Icon(Icons.print_outlined),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Card(
            margin: const EdgeInsets.all(16),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Icon(
                  Icons.receipt_long,
                  size: 54,
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                Text(
                  'فاتورة مبيعات',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                _InfoRow(
                  label: 'رقم الفاتورة',
                  value: receipt.invoiceNumber,
                ),
                _InfoRow(
                  label: 'التاريخ',
                  value: _formatDate(receipt.createdAt),
                ),
                _InfoRow(
                  label: 'طريقة الدفع',
                  value: receipt.paymentMethod == 'cash'
                      ? 'نقداً'
                      : 'بطاقة',
                ),

                const Divider(height: 32),

                const Text(
                  'الأصناف',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                ...receipt.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(item.productName),
                        ),
                        Expanded(
                          child: Text(
                            '${item.quantity}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.unitPrice.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.total.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(height: 32),

                _MoneyRow(
                  label: 'الإجمالي',
                  value: receipt.subtotal,
                ),
                _MoneyRow(
                  label: 'الخصم',
                  value: receipt.discount,
                ),
                _MoneyRow(
                  label: 'الصافي',
                  value: receipt.total,
                  bold: true,
                ),
                _MoneyRow(
                  label: 'المدفوع',
                  value: receipt.paidAmount,
                ),
                _MoneyRow(
                  label: 'الباقي للعميل',
                  value: receipt.changeAmount,
                  color: Colors.green,
                ),
                _MoneyRow(
                  label: 'المتبقي على العميل',
                  value: receipt.remainingAmount,
                  color: Colors.red,
                ),

                const SizedBox(height: 24),
                const Text(
                  'شكراً لتعاملكم معنا',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    final d = date.toLocal();

    return '${d.year}-${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')} '
        '${d.hour.toString().padLeft(2, '0')}:'
        '${d.minute.toString().padLeft(2, '0')}';
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _MoneyRow extends StatelessWidget {
  final String label;
  final double value;
  final bool bold;
  final Color? color;

  const _MoneyRow({
    required this.label,
    required this.value,
    this.bold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            value.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: color,
              fontSize: bold ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}