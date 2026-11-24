
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/service/internal_barcode_generator.dart';

class ProductBarcodeField extends StatelessWidget {
  final TextEditingController controller;
  final String barcodeType;
  final VoidCallback onScan;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String> onGenerated;
  final bool enabled;

  const ProductBarcodeField({
    super.key,
    required this.controller,
    required this.barcodeType,
    required this.onScan,
    required this.onGenerated,
    this.onChanged,
    this.enabled = true,
  });

  bool get _hasBarcode => controller.text.trim().isNotEmpty;

  bool get _isInternal => barcodeType == 'internal';

  void _generate(BuildContext context) {
    final barcode = InternalBarcodeGenerator.generate();

    onGenerated(barcode);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إنشاء باركود داخلي جديد'),
      ),
    );
  }

  Future<void> _copy(BuildContext context) async {
    final value = controller.text.trim();

    if (value.isEmpty) return;

    await Clipboard.setData(
      ClipboardData(text: value),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم نسخ الباركود'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: 'الباركود',
            hintText: 'أدخل أو امسح الباركود',
            prefixIcon: const Icon(
              Icons.qr_code_2_rounded,
            ),
            suffixIcon: IconButton(
              onPressed: enabled ? onScan : null,
              tooltip: 'مسح الباركود',
              icon: const Icon(
                Icons.qr_code_scanner_rounded,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                _isInternal
                    ? 'باركود داخلي'
                    : barcodeType == 'external'
                        ? 'باركود خارجي'
                        : 'بدون باركود',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_hasBarcode)
              IconButton(
                tooltip: 'نسخ الباركود',
                onPressed: enabled ? () => _copy(context) : null,
                icon: const Icon(Icons.copy_rounded),
              ),
            TextButton.icon(
              onPressed: enabled
                  ? () => _generate(context)
                  : null,
              icon: const Icon(Icons.auto_awesome_rounded),
              label: const Text('توليد داخلي'),
            ),
          ],
        ),
      ],
    );
  }
}
