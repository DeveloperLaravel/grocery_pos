
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../widgets/product_ui_helpers.dart';

class EditProductPage extends StatefulWidget {
  final int productId;

  const EditProductPage({
    super.key,
    required this.productId,
  });

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _description = TextEditingController();
  final _barcode = TextEditingController();
  final _categoryId = TextEditingController();
  final _brandId = TextEditingController();
  final _baseUnit = TextEditingController();
  final _costPrice = TextEditingController();
  final _salePrice = TextEditingController();
  final _quantity = TextEditingController();
  final _minStock = TextEditingController();
  final _imagePath = TextEditingController();

  Product? _original;
  String _productType = 'standard';
  bool _allowDecimal = false;
  bool _isActive = true;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    context.read<ProductsBloc>().add(
          ProductsEvent.getById(widget.productId),
        );
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _barcode.dispose();
    _categoryId.dispose();
    _brandId.dispose();
    _baseUnit.dispose();
    _costPrice.dispose();
    _salePrice.dispose();
    _quantity.dispose();
    _minStock.dispose();
    _imagePath.dispose();
    super.dispose();
  }

  void _fill(Product product) {
    if (_initialized) return;

    _original = product;
    _name.text = product.name;
    _description.text = product.description ?? '';
    _barcode.text = product.barcode ?? '';
    _categoryId.text = product.categoryId?.toString() ?? '';
    _brandId.text = product.brandId?.toString() ?? '';
    _baseUnit.text = product.baseUnit;
    _costPrice.text = product.costPrice.toString();
    _salePrice.text = product.salePrice.toString();
    _quantity.text = product.quantity.toString();
    _minStock.text = product.minStock.toString();
    _imagePath.text = product.imagePath ?? '';

    _productType = product.productType;
    _allowDecimal = product.allowDecimalQuantity;
    _isActive = product.isActive;
    _initialized = true;
  }

  double _parse(String value) =>
      double.tryParse(value.trim().replaceAll(',', '.')) ?? 0;

  int? _parseId(String value) {
    if (value.trim().isEmpty) return null;
    return int.tryParse(value.trim());
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    return null;
  }

  String? _validateNumber(String? value) {
    final number = double.tryParse(
      (value ?? '').trim().replaceAll(',', '.'),
    );

    if (number == null || !number.isFinite || number < 0) {
      return 'أدخل رقماً صحيحاً غير سالب';
    }
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final old = _original;
    if (old == null) return;

    final updated = Product(
      id: old.id,
      name: _name.text.trim(),
      description: _description.text.trim().isEmpty
          ? null
          : _description.text.trim(),
      categoryId: _parseId(_categoryId.text),
      brandId: _parseId(_brandId.text),
      barcode: _barcode.text.trim().isEmpty
          ? null
          : _barcode.text.trim(),
      productType: _productType,
      baseUnit: _baseUnit.text.trim(),
      allowDecimalQuantity: _allowDecimal,
      costPrice: _parse(_costPrice.text),
      salePrice: _parse(_salePrice.text),
      quantity: _parse(_quantity.text),
      minStock: _parse(_minStock.text),
      imagePath: _imagePath.text.trim().isEmpty
          ? null
          : _imagePath.text.trim(),
      imageName: old.imageName,
      imageUpdatedAt: old.imageUpdatedAt,
      isActive: _isActive,
      createdAt: old.createdAt,
      updatedAt: DateTime.now(),
    );

    context.read<ProductsBloc>().add(
          ProductsEvent.update(updated),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.selectedProduct != current.selectedProduct ||
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final product = state.selectedProduct;

        if (product != null && product.id == widget.productId) {
          setState(() => _fill(product));
        }

        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successMessage!)),
          );
          Navigator.of(context).pop();
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          context.read<ProductsBloc>().add(
                const ProductsEvent.clearMessages(),
              );
        }
      },
      builder: (context, state) {
        if (state.isLoadingProduct && !_initialized) {
          return Scaffold(
            appBar: AppBar(title: const Text('تعديل المنتج')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.selectedProduct == null && !_initialized) {
          return Scaffold(
            appBar: AppBar(title: const Text('تعديل المنتج')),
            body: ProductUi.emptyState(
              context: context,
              icon: Icons.error_outline,
              title: 'المنتج غير موجود',
              subtitle: 'تعذر العثور على المنتج المطلوب',
              action: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('رجوع'),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('تعديل المنتج')),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 110),
              children: [
                _section(
                  context,
                  'المعلومات الأساسية',
                  [
                    TextFormField(
                      controller: _name,
                      decoration: ProductUi.input(
                        label: 'اسم المنتج *',
                        icon: Icons.inventory_2_outlined,
                      ),
                      validator: _required,
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _description,
                      maxLines: 3,
                      decoration: ProductUi.input(
                        label: 'الوصف',
                        icon: Icons.description_outlined,
                      ),
                    ),
                    const SizedBox(height: 13),
                    DropdownButtonFormField<String>(
                      value: _productType,
                      decoration: ProductUi.input(
                        label: 'نوع المنتج',
                        icon: Icons.category_outlined,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'standard',
                          child: Text('منتج عادي'),
                        ),
                        DropdownMenuItem(
                          value: 'service',
                          child: Text('خدمة'),
                        ),
                        DropdownMenuItem(
                          value: 'composite',
                          child: Text('منتج مركب'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _productType = value);
                        }
                      },
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _categoryId,
                      keyboardType: TextInputType.number,
                      decoration: ProductUi.input(label: 'رقم التصنيف'),
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _brandId,
                      keyboardType: TextInputType.number,
                      decoration: ProductUi.input(
                        label: 'رقم العلامة التجارية',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  'الباركود والوحدة',
                  [
                    TextFormField(
                      controller: _barcode,
                      decoration: ProductUi.input(
                        label: 'الباركود',
                        icon: Icons.qr_code_2,
                      ),
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _baseUnit,
                      decoration: ProductUi.input(
                        label: 'الوحدة الأساسية *',
                        icon: Icons.straighten,
                      ),
                      validator: _required,
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('السماح بالكميات العشرية'),
                      value: _allowDecimal,
                      onChanged: (value) =>
                          setState(() => _allowDecimal = value),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  'الأسعار والمخزون',
                  [
                    _numberField(_costPrice, 'سعر التكلفة'),
                    const SizedBox(height: 13),
                    _numberField(_salePrice, 'سعر البيع'),
                    const SizedBox(height: 13),
                    _numberField(_quantity, 'الكمية الحالية'),
                    const SizedBox(height: 13),
                    _numberField(_minStock, 'الحد الأدنى للمخزون'),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  'الصورة والحالة',
                  [
                    TextFormField(
                      controller: _imagePath,
                      decoration: ProductUi.input(
                        label: 'مسار الصورة',
                        icon: Icons.image_outlined,
                      ),
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('المنتج نشط'),
                      value: _isActive,
                      onChanged: (value) =>
                          setState(() => _isActive = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.all(16),
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
              label: Text(state.isSaving ? 'جارٍ الحفظ...' : 'حفظ التعديلات'),
            ),
          ),
        );
      },
    );
  }

  Widget _section(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductUi.sectionTitle(context, title),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _numberField(
    TextEditingController controller,
    String label,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: ProductUi.input(label: label),
      validator: _validateNumber,
    );
  }
}
