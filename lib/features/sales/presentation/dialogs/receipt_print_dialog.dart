
import 'package:flutter/material.dart';

import '../../../pos/domain/entities/sale_receipt.dart';
import '../../domain/entities/receipt_paper_size.dart';
import '../../data/services/receipt_printer_service.dart';

class ReceiptPrintDialog {
  ReceiptPrintDialog._();

  static Future<void> show({
    required BuildContext context,
    required SaleReceipt receipt,
    required VoidCallback onPreview,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _ReceiptPrintDialogContent(
        receipt: receipt,
        onPreview: onPreview,
      ),
    );
  }
}

class _ReceiptPrintDialogContent extends StatefulWidget {
  const _ReceiptPrintDialogContent({
    required this.receipt,
    required this.onPreview,
  });

  final SaleReceipt receipt;
  final VoidCallback onPreview;

  @override
  State<_ReceiptPrintDialogContent> createState() =>
      _ReceiptPrintDialogContentState();
}

class _ReceiptPrintDialogContentState
    extends State<_ReceiptPrintDialogContent> {
  ReceiptPaperSize _selectedSize = ReceiptPaperSize.thermal80;

  bool _isPrinting = false;

  Future<void> _print() async {
    if (_isPrinting) return;

    setState(() => _isPrinting = true);

    try {
      await ReceiptPrinterService.printReceipt(
        receipt: widget.receipt,
        paperSize: _selectedSize,
      );

      if (!mounted) return;

      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('تعذرت طباعة الفاتورة: $error'),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
    } finally {
      if (mounted) {
        setState(() => _isPrinting = false);
      }
    }
  }

  void _preview() {
    if (_isPrinting) return;

    Navigator.of(context).pop();
    widget.onPreview();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.print_rounded,
              color: colors.primary,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'خيارات طباعة الفاتورة',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.receipt_long_rounded,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'الفاتورة رقم',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '"${widget.receipt.invoiceNumber}"',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'اختر حجم الورق',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 12),

            _PaperOption(
              title: 'حراري 58mm',
              subtitle: 'مناسب للفواتير الصغيرة',
              icon: Icons.receipt_outlined,
              selected:
                  _selectedSize == ReceiptPaperSize.thermal58,
              onTap: () => _selectSize(
                ReceiptPaperSize.thermal58,
              ),
            ),

            _PaperOption(
              title: 'حراري 80mm',
              subtitle: 'مناسب لمعظم طابعات نقاط البيع',
              icon: Icons.receipt_long_rounded,
              selected:
                  _selectedSize == ReceiptPaperSize.thermal80,
              onTap: () => _selectSize(
                ReceiptPaperSize.thermal80,
              ),
            ),

            _PaperOption(
              title: 'A4',
              subtitle: 'فاتورة كاملة للطباعة المكتبية',
              icon: Icons.description_outlined,
              selected: _selectedSize == ReceiptPaperSize.a4,
              onTap: () => _selectSize(
                ReceiptPaperSize.a4,
              ),
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
      actions: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _isPrinting ? null : _preview,
            icon: const Icon(Icons.visibility_outlined),
            label: const Text('معاينة الفاتورة'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: _isPrinting
                    ? null
                    : () => Navigator.of(context).pop(),
                child: const Text('إغلاق'),
              ),
            ),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _isPrinting ? null : _print,
                icon: _isPrinting
                    ? const SizedBox(
                        width: 17,
                        height: 17,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.print_rounded),
                label: Text(
                  _isPrinting ? 'جاري الطباعة...' : 'طباعة الفاتورة',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _selectSize(ReceiptPaperSize size) {
    if (_isPrinting) return;

    setState(() => _selectedSize = size);
  }
}

class _PaperOption extends StatelessWidget {
  const _PaperOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Material(
        color: selected
            ? colors.primary.withValues(alpha: 0.07)
            : colors.surface,
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: selected
                    ? colors.primary
                    : theme.dividerColor,
                width: selected ? 1.6 : 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected
                      ? colors.primary
                      : colors.onSurfaceVariant,
                  size: 23,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selected ? colors.primary : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: selected
                      ? colors.primary
                      : colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
