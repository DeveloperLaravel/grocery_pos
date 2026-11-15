import 'package:flutter/material.dart';

class PosDiscountDialog {
  const PosDiscountDialog._();

  static Future<double?> show(
    BuildContext context, {
    required double currentDiscount,
    required double subtotal,
  }) async {
    final controller = TextEditingController(
      text: currentDiscount.toStringAsFixed(2),
    );

    final result = await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('إضافة خصم'),
          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'قيمة الخصم',
              prefixIcon: Icon(Icons.discount_outlined),
              suffixText: 'د.ل',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                final value = double.tryParse(
                  controller.text.trim(),
                );

                if (value == null ||
                    !value.isFinite ||
                    value < 0 ||
                    value > subtotal) {
                  return;
                }

                Navigator.pop(dialogContext, value);
              },
              child: const Text('تطبيق الخصم'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    return result;
  }
}
