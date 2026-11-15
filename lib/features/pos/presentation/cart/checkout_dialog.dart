import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import '../bloc/pos_state.dart';

class CheckoutDialog extends StatefulWidget {
  const CheckoutDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: context.read<PosBloc>(),
        child: const CheckoutDialog(),
      ),
    );
  }

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  final _paidController = TextEditingController();

  String _paymentMethod = 'cash';
  String? _validationError;

  @override
  void dispose() {
    _paidController.dispose();
    super.dispose();
  }

  double _parsePaid() {
    return double.tryParse(
          _paidController.text.trim().replaceAll(',', '.'),
        ) ??
        0;
  }

  String _money(double value) => '${value.toStringAsFixed(2)} د.ل';

  void _submit(PosState state) {
    final paid = _parsePaid();

    if (paid < state.total) {
      setState(() {
        _validationError = 'المبلغ المدفوع أقل من إجمالي الفاتورة';
      });
      return;
    }

    if (paid < 0) {
      setState(() {
        _validationError = 'أدخل مبلغاً صحيحاً';
      });
      return;
    }

    context.read<PosBloc>().add(
          PosEvent.checkoutRequested(
            paid: paid,
            paymentMethod: _paymentMethod,
          ),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<PosBloc, PosState>(
      builder: (context, state) {
        final compact = MediaQuery.sizeOf(context).height < 650;

        if (_paidController.text.isEmpty && _paymentMethod == 'cash') {
          _paidController.text = state.total.toStringAsFixed(2);
        }

        final paid = _parsePaid();
        final change = (paid - state.total).clamp(0.0, double.infinity);

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(compact ? 16 : 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        color: colors.primary,
                        size: 27,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'إتمام عملية البيع',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'المبلغ المطلوب',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          _money(state.total),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'طريقة الدفع',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 9),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'cash',
                        label: Text('نقداً'),
                        icon: Icon(Icons.money_rounded),
                      ),
                      ButtonSegment(
                        value: 'card',
                        label: Text('بطاقة'),
                        icon: Icon(Icons.credit_card_rounded),
                      ),
                    ],
                    selected: {_paymentMethod},
                    onSelectionChanged: (selection) {
                      setState(() {
                        _paymentMethod = selection.first;
                        _validationError = null;

                        if (_paymentMethod == 'card') {
                          _paidController.text = state.total.toStringAsFixed(2);
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'المبلغ المدفوع',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _paidController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    onChanged: (_) {
                      setState(() {
                        _validationError = null;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '0.00',
                      suffixText: 'د.ل',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  if (_paymentMethod == 'cash') ...[
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text('الباقي للعميل'),
                          ),
                          Text(
                            _money(change),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (_validationError != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _validationError!,
                      style: TextStyle(
                        color: colors.error,
                        fontSize: 12,
                      ),
                    ),
                  ],
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: FilledButton.icon(
                          onPressed:
                              state.canCheckout ? () => _submit(state) : null,
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text('تأكيد البيع'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
