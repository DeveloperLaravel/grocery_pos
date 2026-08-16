
import 'package:flutter/material.dart';

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
  late final TextEditingController paidController;
  late String method;

  @override
  void initState() {
    super.initState();

    method = widget.initialMethod == 'card' ? 'card' : 'cash';

    paidController = TextEditingController(
      text: widget.total.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    paidController.dispose();
    super.dispose();
  }

  double get paid {
    return double.tryParse(
          paidController.text.trim().replaceAll(',', '.'),
        ) ??
        0;
  }

  double get change {
    final result = paid - widget.total;
    return result < 0 ? 0 : result;
  }

  bool get valid => paid >= widget.total;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);
    final compact = size.width < 600;
    final tiny = size.width < 380;

    return Dialog(
      insetPadding: EdgeInsets.all(compact ? 12 : 20),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 560,
          maxHeight: size.height * .92,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(compact ? 16 : 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.payments_rounded,
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'إتمام البيع',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(compact ? 17 : 20),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      'إجمالي الفاتورة',
                      style: TextStyle(
                        color: scheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${widget.total.toStringAsFixed(2)} د.ل',
                        style: TextStyle(
                          color: scheme.onPrimaryContainer,
                          fontSize: compact ? 32 : 38,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment<String>(
                      value: 'cash',
                      icon: Icon(Icons.payments_outlined),
                      label: Text('نقدي'),
                    ),
                    ButtonSegment<String>(
                      value: 'card',
                      icon: Icon(Icons.credit_card_rounded),
                      label: Text('بطاقة'),
                    ),
                  ],
                  selected: {method},
                  showSelectedIcon: false,
                  onSelectionChanged: (selection) {
                    setState(() {
                      method = selection.first;

                      if (method == 'card') {
                        paidController.text =
                            widget.total.toStringAsFixed(2);
                      }
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: paidController,
                enabled: method == 'cash',
                autofocus: true,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => setState(() {}),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                decoration: InputDecoration(
                  labelText: 'المبلغ المدفوع',
                  suffixText: 'د.ل',
                  prefixIcon: const Icon(
                    Icons.account_balance_wallet_outlined,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: valid
                      ? scheme.secondaryContainer
                      : scheme.errorContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(
                      valid
                          ? Icons.currency_exchange_rounded
                          : Icons.warning_amber_rounded,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        valid ? 'الباقي للزبون' : 'المبلغ أقل من الإجمالي',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${change.toStringAsFixed(2)} د.ل',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              if (tiny) ...[
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: valid ? _confirm : null,
                    icon: const Icon(Icons.check_circle_outline_rounded),
                    label: const Text('تأكيد البيع'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء'),
                  ),
                ),
              ] else
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 50,
                        child: FilledButton.icon(
                          onPressed: valid ? _confirm : null,
                          icon: const Icon(
                            Icons.check_circle_outline_rounded,
                          ),
                          label: const Text('تأكيد البيع'),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirm() {
    Navigator.pop(
      context,
      CheckoutResult(
        paid: paid,
        method: method,
      ),
    );
  }
}
