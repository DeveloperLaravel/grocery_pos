
import 'package:flutter/material.dart';

import '../../../../domain/entities/product/product_unit.dart';

class ProductUnitFormDialog extends StatefulWidget {
  final int productId;
  final ProductUnit? unit;

  const ProductUnitFormDialog({
    super.key,
    required this.productId,
    this.unit,
  });

  @override
  State<ProductUnitFormDialog> createState() =>
      _ProductUnitFormDialogState();
}

class _ProductUnitFormDialogState
    extends State<ProductUnitFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _factorController;
  late final TextEditingController _costController;
  late final TextEditingController _saleController;
  late final TextEditingController _sortController;

  bool _isActive = true;

  bool get isEditing => widget.unit != null;

  @override
  void initState() {
    super.initState();

    final unit = widget.unit;

    _nameController = TextEditingController(
      text: unit?.unitName ?? '',
    );

    _factorController = TextEditingController(
      text: (unit?.conversionFactor ?? 1).toString(),
    );

    _costController = TextEditingController(
      text: (unit?.costPrice ?? 0).toString(),
    );

    _saleController = TextEditingController(
      text: (unit?.salePrice ?? 0).toString(),
    );

    _sortController = TextEditingController(
      text: (unit?.sortOrder ?? 0).toString(),
    );

    _isActive = unit?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _factorController.dispose();
    _costController.dispose();
    _saleController.dispose();
    _sortController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال اسم الوحدة';
    }
    return null;
  }

  String? _validatePositive(String? value) {
    final number = double.tryParse(value ?? '');

    if (number == null || !number.isFinite || number <= 0) {
      return 'يجب إدخال رقم أكبر من صفر';
    }

    return null;
  }

  String? _validatePrice(String? value) {
    final number = double.tryParse(value ?? '');

    if (number == null || !number.isFinite || number < 0) {
      return 'يرجى إدخال سعر صحيح';
    }

    return null;
  }

  String? _validateSort(String? value) {
    final number = int.tryParse(value ?? '');

    if (number == null || number < 0) {
      return 'أدخل ترتيباً صحيحاً';
    }

    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final oldUnit = widget.unit;

    final unit = ProductUnit(
      id: oldUnit?.id ?? 0,
      productId: widget.productId,
      unitName: _nameController.text.trim(),
      conversionFactor:
          double.parse(_factorController.text.trim()),
      costPrice: double.parse(_costController.text.trim()),
      salePrice: double.parse(_saleController.text.trim()),
      isBaseUnit: oldUnit?.isBaseUnit ?? false,
      isDefault: oldUnit?.isDefault ?? false,
      isActive: _isActive,
      sortOrder: int.parse(_sortController.text.trim()),
    );

    Navigator.pop(context, unit);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 480,
            maxHeight: 720,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          isEditing
                              ? Icons.edit_rounded
                              : Icons.add_rounded,
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              isEditing
                                  ? 'تعديل وحدة المنتج'
                                  : 'إضافة وحدة جديدة',
                              style: theme.textTheme.titleLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'أدخل بيانات الوحدة والأسعار',
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  _sectionTitle('المعلومات الأساسية'),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _nameController,
                    validator: _validateName,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'اسم الوحدة',
                      hintText: 'مثال: قطعة، صندوق، كرتونة',
                      prefixIcon: Icon(Icons.straighten_rounded),
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextFormField(
                    controller: _factorController,
                    validator: _validatePositive,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'معامل التحويل',
                      hintText: 'مثال: 1 أو 12 أو 24',
                      prefixIcon: Icon(Icons.swap_horiz_rounded),
                      helperText:
                          'عدد وحدات الأساس الموجودة في هذه الوحدة',
                    ),
                  ),

                  const SizedBox(height: 24),

                  _sectionTitle('الأسعار'),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _costController,
                          validator: _validatePrice,
                          keyboardType:
                              const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'سعر التكلفة',
                            prefixIcon: Icon(
                              Icons.shopping_cart_outlined,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _saleController,
                          validator: _validatePrice,
                          keyboardType:
                              const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'سعر البيع',
                            prefixIcon: Icon(Icons.sell_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  _sectionTitle('إعدادات الوحدة'),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _sortController,
                    validator: _validateSort,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'ترتيب العرض',
                      prefixIcon: Icon(Icons.sort_rounded),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('الوحدة نشطة'),
                    subtitle: const Text(
                      'تحديد إمكانية استخدام الوحدة',
                    ),
                    value: _isActive,
                    onChanged: (value) {
                      setState(() => _isActive = value);
                    },
                  ),

                  if (isEditing) ...[
                    const SizedBox(height: 8),
                    _existingStatus(),
                  ],

                  const SizedBox(height: 22),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _save,
                          icon: const Icon(Icons.save_outlined),
                          label: Text(
                            isEditing ? 'حفظ التعديلات' : 'إضافة الوحدة',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }

  Widget _existingStatus() {
    final unit = widget.unit!;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _statusRow(
            'وحدة الأساس',
            unit.isBaseUnit,
          ),
          const SizedBox(height: 8),
          _statusRow(
            'وحدة البيع الافتراضية',
            unit.isDefault,
          ),
        ],
      ),
    );
  }

  Widget _statusRow(String title, bool value) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Icon(
          value ? Icons.check_circle : Icons.circle_outlined,
          color: value ? Colors.green : Colors.grey,
          size: 19,
        ),
      ],
    );
  }
}
