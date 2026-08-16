import 'package:flutter/material.dart';

import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';

abstract final class InventoryDialogs {
  static Future<(double, String)?> showAdjustment(
    BuildContext context,
    InventoryItem item,
    bool add,
  ) async {
    final qty = TextEditingController();
    final note = TextEditingController();

    try {
      return await showDialog<(double, String)>(
        context: context,
        builder: (dialogContext) => _ResponsiveDialog(
          title: '${add ? 'إضافة' : 'خصم'} مخزون • ${item.name}',
          fields: [
            TextField(
              controller: qty,
              autofocus: true,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'الكمية'),
            ),
            TextField(
              controller: note,
              decoration: const InputDecoration(
                labelText: 'ملاحظة / المورد / السبب',
              ),
            ),
          ],
          confirmLabel: 'حفظ',
          onConfirm: () {
            final value =
                double.tryParse(qty.text.replaceAll(',', '.'));
            if (value == null || value <= 0) return;
            Navigator.pop(
              dialogContext,
              (add ? value : -value, note.text.trim()),
            );
          },
        ),
      );
    } finally {
      qty.dispose();
      note.dispose();
    }
  }

  static Future<(double, String)?> showCount(
    BuildContext context,
    InventoryItem item,
  ) async {
    final qty =
        TextEditingController(text: item.quantity.toStringAsFixed(2));
    final note = TextEditingController(text: 'جرد فعلي');

    try {
      return await showDialog<(double, String)>(
        context: context,
        builder: (dialogContext) => _ResponsiveDialog(
          title: 'جرد ${item.name}',
          confirmLabel: 'اعتماد الجرد',
          fields: [
            TextField(
              controller: qty,
              autofocus: true,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration:
                  const InputDecoration(labelText: 'الكمية الفعلية'),
            ),
            TextField(
              controller: note,
              decoration: const InputDecoration(labelText: 'ملاحظة'),
            ),
          ],
          onConfirm: () {
            final value =
                double.tryParse(qty.text.replaceAll(',', '.'));
            if (value == null || value < 0) return;
            Navigator.pop(
              dialogContext,
              (value, note.text.trim()),
            );
          },
        ),
      );
    } finally {
      qty.dispose();
      note.dispose();
    }
  }

  static Future<double?> showMinStock(
    BuildContext context,
    InventoryItem item,
  ) async {
    final controller =
        TextEditingController(text: item.minStock.toStringAsFixed(2));

    try {
      return await showDialog<double>(
        context: context,
        builder: (dialogContext) => _ResponsiveDialog(
          title: 'حد تنبيه ${item.name}',
          confirmLabel: 'حفظ',
          fields: [
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'نبهني عند وصول الكمية إلى',
              ),
            ),
          ],
          onConfirm: () {
            final value =
                double.tryParse(controller.text.replaceAll(',', '.'));
            if (value == null || value < 0) return;
            Navigator.pop(dialogContext, value);
          },
        ),
      );
    } finally {
      controller.dispose();
    }
  }
}

class _ResponsiveDialog extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final String confirmLabel;
  final VoidCallback onConfirm;

  const _ResponsiveDialog({
    required this.title,
    required this.fields,
    required this.confirmLabel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final compact = size.width < 600;

    return Dialog(
      insetPadding: EdgeInsets.all(size.width < 380 ? 8 : 16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: size.height * .9,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(compact ? 16 : 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: compact ? 19 : 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 18),
              for (var i = 0; i < fields.length; i++) ...[
                fields[i],
                if (i != fields.length - 1)
                  const SizedBox(height: 12),
              ],
              const SizedBox(height: 20),
              if (compact) ...[
                FilledButton(
                  onPressed: onConfirm,
                  child: Text(confirmLabel),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('إلغاء'),
                ),
              ] else
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('إلغاء'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: onConfirm,
                      child: Text(confirmLabel),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
