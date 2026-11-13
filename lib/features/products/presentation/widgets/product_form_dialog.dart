
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../pages/product_barcode_scanner_page.dart';

class ProductFormDialog extends StatefulWidget {
  final Product? product;

  const ProductFormDialog({
    super.key,
    this.product,
  });

  @override
  State<ProductFormDialog> createState() =>
      _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _costController;
  late final TextEditingController _saleController;
  late final TextEditingController _quantityController;
  late final TextEditingController _minStockController;

  final FocusNode _barcodeFocus = FocusNode();

  bool get isEditing => widget.product != null;

  @override
  void initState() {
    super.initState();

    final product = widget.product;

    _nameController = TextEditingController(
      text: product?.name ?? '',
    );

    _barcodeController = TextEditingController(
      text: product?.barcode ?? '',
    );

    _costController = TextEditingController(
      text: product?.costPrice.toString() ?? '0',
    );

    _saleController = TextEditingController(
      text: product?.salePrice.toString() ?? '',
    );

    _quantityController = TextEditingController(
      text: product?.quantity.toString() ?? '0',
    );

    _minStockController = TextEditingController(
      text: product?.minStock.toString() ?? '5',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _barcodeController.dispose();
    _costController.dispose();
    _saleController.dispose();
    _quantityController.dispose();
    _minStockController.dispose();
    _barcodeFocus.dispose();
    super.dispose();
  }

  double _number(String value) {
    return double.parse(
      value.trim().replaceAll(',', '.'),
    );
  }

  String? _validateNumber(
    String? value, {
    required String label,
    bool allowZero = true,
  }) {
    final number = double.tryParse(
      (value ?? '').trim().replaceAll(',', '.'),
    );

    if (number == null || !number.isFinite) {
      return 'أدخل $label بشكل صحيح';
    }

    if (allowZero ? number < 0 : number <= 0) {
      return allowZero
          ? '$label لا يمكن أن يكون سالباً'
          : '$label يجب أن يكون أكبر من صفر';
    }

    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final oldProduct = widget.product;

    final product = Product(
      id: oldProduct?.id,
      name: _nameController.text.trim(),
      barcode: _barcodeController.text.trim(),
      costPrice: _number(_costController.text),
      salePrice: _number(_saleController.text),
      quantity: _number(_quantityController.text),
      minStock: _number(_minStockController.text),
      createdAt: oldProduct?.createdAt ?? now,
      updatedAt: now,
    );

    final cubit = context.read<ProductsCubit>();

    final success = isEditing
        ? await cubit.updateProduct(product)
        : await cubit.addProduct(product);

    if (!mounted) return;

    if (success) {
      Navigator.of(context).pop();
    } else {
      final error = cubit.state.errorMessage;

      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
        cubit.clearMessages();
      }
    }
  }

  Future<void> _scanBarcode() async {
    if (!Platform.isAndroid) {
      _barcodeFocus.requestFocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'مرر المنتج أمام قارئ الباركود الآن',
          ),
        ),
      );

      return;
    }

    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const ProductBarcodeScannerPage(),
      ),
    );

    if (!mounted || barcode == null || barcode.isEmpty) {
      return;
    }

    setState(() {
      _barcodeController.text = barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 620,
            maxHeight: size.height * .92,
          ),
          child: Padding(
            padding: EdgeInsets.all(
              size.width < 500 ? 14 : 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          theme.colorScheme.primaryContainer,
                      child: Icon(
                        isEditing
                            ? Icons.edit_rounded
                            : Icons.add_box_rounded,
                        color: theme.colorScheme.primary,
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
                                ? 'تعديل المنتج'
                                : 'إضافة منتج جديد',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            isEditing
                                ? 'تحديث بيانات المنتج'
                                : 'أدخل بيانات المنتج والمخزون',
                            style: TextStyle(
                              color:
                                  theme.colorScheme.onSurfaceVariant,
                              fontSize: 12,
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

                const SizedBox(height: 20),

                // Form
                Flexible(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final twoColumns =
                              constraints.maxWidth >= 500;

                          final fields = [
                            _buildField(
                              controller: _nameController,
                              label: 'اسم المنتج',
                              icon: Icons.inventory_2_outlined,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty) {
                                  return 'أدخل اسم المنتج';
                                }

                                if (value.trim().length > 150) {
                                  return 'الاسم طويل جداً';
                                }

                                return null;
                              },
                            ),
                            _buildBarcodeField(),
                            _buildField(
                              controller: _costController,
                              label: 'سعر التكلفة',
                              icon: Icons.payments_outlined,
                              numeric: true,
                              validator: (value) =>
                                  _validateNumber(
                                value,
                                label: 'سعر التكلفة',
                              ),
                            ),
                            _buildField(
                              controller: _saleController,
                              label: 'سعر البيع',
                              icon: Icons.sell_outlined,
                              numeric: true,
                              validator: (value) =>
                                  _validateNumber(
                                value,
                                label: 'سعر البيع',
                                allowZero: false,
                              ),
                            ),
                            _buildField(
                              controller: _quantityController,
                              label: 'الكمية',
                              icon: Icons.numbers_rounded,
                              numeric: true,
                              validator: (value) =>
                                  _validateNumber(
                                value,
                                label: 'الكمية',
                              ),
                            ),
                            _buildField(
                              controller: _minStockController,
                              label: 'حد المخزون المنخفض',
                              icon: Icons.warning_amber_rounded,
                              numeric: true,
                              validator: (value) =>
                                  _validateNumber(
                                value,
                                label: 'حد المخزون',
                              ),
                            ),
                          ];

                          if (!twoColumns) {
                            return Column(
                              children: [
                                for (int i = 0;
                                    i < fields.length;
                                    i++) ...[
                                  fields[i],
                                  if (i < fields.length - 1)
                                    const SizedBox(height: 14),
                                ],
                              ],
                            );
                          }

                          return Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            children: fields.map((field) {
                              return SizedBox(
                                width:
                                    (constraints.maxWidth - 14) / 2,
                                child: field,
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Buttons
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: state.isSaving
                                ? null
                                : () => Navigator.pop(context),
                            child: const Text('إلغاء'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: FilledButton.icon(
                            onPressed: state.isSaving ? null : _save,
                            icon: state.isSaving
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.save_outlined),
                            label: Text(
                              state.isSaving
                                  ? 'جارٍ الحفظ...'
                                  : 'حفظ المنتج',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarcodeField() {
    return TextFormField(
      controller: _barcodeController,
      focusNode: _barcodeFocus,
      autofocus: Platform.isWindows,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'أدخل الباركود';
        }

        if (value.trim().length > 100) {
          return 'الباركود طويل جداً';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'الباركود',
        hintText: Platform.isWindows
            ? 'استخدم قارئ الباركود USB'
            : 'اكتب الباركود أو امسحه',
        prefixIcon: const Icon(Icons.qr_code_rounded),
        suffixIcon: IconButton.filledTonal(
          onPressed: _scanBarcode,
          tooltip: 'مسح الباركود',
          icon: Icon(
            Platform.isAndroid
                ? Icons.qr_code_scanner
                : Icons.usb_rounded,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool numeric = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: numeric
          ? const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            )
          : TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
