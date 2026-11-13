import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutResult {
  final double paid;
  final String method;

  const CheckoutResult({
    required this.paid,
    required this.method,
  });
}

class CheckoutDialog extends StatefulWidget {
  final double total;
  final String initialMethod;

  const CheckoutDialog({
    super.key,
    required this.total,
    this.initialMethod = 'cash',
  });

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  late final TextEditingController _amountController;
  late String _method;

  double get paid =>
      double.tryParse(_amountController.text.trim()) ?? 0;

  double get change => (paid - widget.total)
      .clamp(0, double.infinity)
      .toDouble();

  bool get isValid => paid >= widget.total;

  @override
  void initState() {
    super.initState();

    _method = widget.initialMethod;
    _amountController = TextEditingController(
      text: widget.total.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _confirm() {
    if (!isValid) return;

    Navigator.of(context).pop(
      CheckoutResult(
        paid: paid,
        method: _method,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('إتمام عملية البيع'),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'الإجمالي: ${widget.total.toStringAsFixed(2)}',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'cash',
                  label: Text('نقداً'),
                  icon: Icon(Icons.payments_outlined),
                ),
                ButtonSegment(
                  value: 'card',
                  label: Text('بطاقة'),
                  icon: Icon(Icons.credit_card),
                ),
              ],
              selected: {_method},
              onSelectionChanged: (values) {
                setState(() {
                  _method = values.first;

                  if (_method == 'card') {
                    _amountController.text =
                        widget.total.toStringAsFixed(2);
                  }
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _amountController,
              enabled: _method == 'cash',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,2}'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'المبلغ المدفوع',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الباقي'),
                Text(
                  change.toStringAsFixed(2),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            if (!isValid) ...[
              const SizedBox(height: 8),
              const Text(
                'المبلغ المدفوع أقل من الإجمالي',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        FilledButton.icon(
          onPressed: isValid ? _confirm : null,
          icon: const Icon(Icons.check),
          label: const Text('تأكيد البيع'),
        ),
      ],
    );
  }
}