import 'package:flutter/material.dart';

class CheckoutResult {
  final double paid;
  final String method;
  const CheckoutResult(this.paid, this.method);
}

class CheckoutDialog extends StatefulWidget {
  final double total;
  final String initialMethod;
  const CheckoutDialog({super.key, required this.total, this.initialMethod = 'cash'});

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  late final TextEditingController paid;
  late String method;

  @override
  void initState() {
    super.initState();
    paid = TextEditingController(text: widget.total.toStringAsFixed(2));
    method = widget.initialMethod;
  }

  @override
  void dispose() {
    paid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paidValue = double.tryParse(paid.text.replaceAll(',', '.')) ?? 0;
    final change = paidValue - widget.total;
    return AlertDialog(
      title: const Text('إتمام البيع'),
      content: SizedBox(
        width: 420,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(title: const Text('الإجمالي'), trailing: Text('${widget.total.toStringAsFixed(2)} د.ل', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'cash', icon: Icon(Icons.payments_outlined), label: Text('نقدي')),
              ButtonSegment(value: 'card', icon: Icon(Icons.credit_card), label: Text('بطاقة')),
            ],
            selected: {method},
            onSelectionChanged: (value) => setState(() => method = value.first),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: paid,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'المبلغ المدفوع', border: OutlineInputBorder()),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          Align(alignment: Alignment.centerRight, child: Text('الباقي: ${change < 0 ? 0 : change.toStringAsFixed(2)} د.ل')),
        ]),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        FilledButton(
          onPressed: paidValue < widget.total ? null : () => Navigator.pop(context, CheckoutResult(paidValue, method)),
          child: const Text('تأكيد البيع'),
        ),
      ],
    );
  }
}
