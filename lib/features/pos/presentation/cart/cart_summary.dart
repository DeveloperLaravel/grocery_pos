import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.total,
  });

  final double subtotal;
  final double discount;
  final double total;

  String _money(double value) => '${value.toStringAsFixed(2)} د.ل';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final compact = MediaQuery.sizeOf(context).height < 650;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        compact ? 12 : 16,
        compact ? 9 : 13,
        compact ? 12 : 16,
        compact ? 7 : 10,
      ),
      child: Column(
        children: [
          _SummaryRow(
            title: 'الإجمالي الفرعي',
            value: _money(subtotal),
          ),
          SizedBox(height: compact ? 7 : 10),
          _SummaryRow(
            title: 'الخصم',
            value: _money(discount),
            valueColor: colors.error,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: compact ? 9 : 12,
            ),
            child: Divider(
              height: 1,
              color: colors.outlineVariant,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'الإجمالي النهائي',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                _money(total),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
    this.valueColor,
  });

  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
