import 'package:flutter/material.dart';

import '../../domain/entities/inventory_item.dart';
import '../helpers/inventory_formatters.dart';

class StockAdjustmentDialog extends StatefulWidget {
  const StockAdjustmentDialog({
    super.key,
    required this.product,
    required this.onSubmit,
    this.isLoading = false,
  });

  final InventoryItem product;
  final bool isLoading;

  final void Function({
    required double quantity,
    required String type,
    String? reference,
    String? note,
  }) onSubmit;

  @override
  State<StockAdjustmentDialog> createState() =>
      _StockAdjustmentDialogState();
}

class _StockAdjustmentDialogState
    extends State<StockAdjustmentDialog> {
  final _formKey = GlobalKey<FormState>();

  final _quantityController = TextEditingController();
  final _referenceController = TextEditingController();
  final _noteController = TextEditingController();

  String _type = 'in';

  @override
  void dispose() {
    _quantityController.dispose();
    _referenceController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.tune_rounded,
                        color: colors.primary,
                        size: 25,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'تسوية المخزون',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: widget.isLoading
                            ? null
                            : () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.inventory_2_outlined),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'المخزون الحالي: ${InventoryFormatters.quantity(widget.product.quantity)}',
                                style: TextStyle(
                                  color: colors.onSurfaceVariant,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'نوع الحركة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 9),

                  DropdownButtonFormField<String>(
                    initialValue: _type,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.swap_vert_rounded),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'in',
                        child: Text('إضافة للمخزون'),
                      ),
                      DropdownMenuItem(
                        value: 'out',
                        child: Text('صرف من المخزون'),
                      ),
                      DropdownMenuItem(
                        value: 'sale',
                        child: Text('بيع'),
                      ),
                      DropdownMenuItem(
                        value: 'return',
                        child: Text('مرتجع'),
                      ),
                    ],
                    onChanged: widget.isLoading
                        ? null
                        : (value) {
                            if (value != null) {
                              setState(() => _type = value);
                            }
                          },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _quantityController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'الكمية',
                      hintText: 'أدخل الكمية',
                      prefixIcon: Icon(Icons.numbers_rounded),
                    ),
                    validator: (value) {
                      final quantity = double.tryParse(
                        value?.trim() ?? '',
                      );

                      if (quantity == null || quantity <= 0) {
                        return 'أدخل كمية صحيحة أكبر من صفر';
                      }

                      if ((_type == 'out' || _type == 'sale') &&
                          quantity > widget.product.quantity) {
                        return 'الكمية أكبر من المخزون المتوفر';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _referenceController,
                    decoration: const InputDecoration(
                      labelText: 'المرجع (اختياري)',
                      hintText: 'رقم الفاتورة أو المستند',
                      prefixIcon: Icon(Icons.receipt_long_outlined),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _noteController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات',
                      hintText: 'سبب تعديل الكمية...',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.notes_rounded),
                    ),
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: widget.isLoading
                          ? null
                          : _submit,
                      icon: widget.isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.check_rounded),
                      label: Text(
                        widget.isLoading
                            ? 'جارٍ الحفظ...'
                            : 'تأكيد الحركة',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit(
      quantity: double.parse(_quantityController.text.trim()),
      type: _type,
      reference: _referenceController.text.trim().isEmpty
          ? null
          : _referenceController.text.trim(),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );
  }
}