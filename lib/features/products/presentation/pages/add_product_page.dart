
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';
import '../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../widgets/product_ui_helpers.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _categoryController = TextEditingController();
  final _brandController = TextEditingController();
  final _baseUnitController = TextEditingController(text: 'قطعة');
  final _costPriceController = TextEditingController(text: '0');
  final _salePriceController = TextEditingController(text: '0');
  final _quantityController = TextEditingController(text: '0');
  final _minStockController = TextEditingController(text: '0');
  final _imagePathController = TextEditingController();

  String _productType = 'standard';
  bool _allowDecimal = false;
  bool _isActive = true;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _barcodeController.dispose();
    _categoryController.dispose();
    _brandController.dispose();
    _baseUnitController.dispose();
    _costPriceController.dispose();
    _salePriceController.dispose();
    _quantityController.dispose();
    _minStockController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }

  double _number(String value) =>
      double.tryParse(value.trim().replaceAll(',', '.')) ?? 0;

  int? _optionalId(String value) {
    if (value.trim().isEmpty) return null;
    return int.tryParse(value.trim());
  }

  String? _requiredText(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  String? _validateNumber(String? value, {bool allowZero = true}) {
    final number = double.tryParse(
      (value ?? '').trim().replaceAll(',', '.'),
    );

    if (number == null || !number.isFinite) {
      return 'أدخل رقماً صحيحاً';
    }

    if (allowZero ? number < 0 : number <= 0) {
      return allowZero
          ? 'لا يمكن أن تكون القيمة سالبة'
          : 'يجب أن تكون القيمة أكبر من صفر';
    }

    return null;
  }

  Future<void> _scanBarcode() async {
    final value = await AppNavigation.scanProductBarcode(context);

    if (!mounted || value == null || value.trim().isEmpty) return;

    setState(() => _barcodeController.text = value.trim());
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();

    final product = Product(
      id: 0,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      categoryId: _optionalId(_categoryController.text),
      brandId: _optionalId(_brandController.text),
      barcode: _barcodeController.text.trim().isEmpty
          ? null
          : _barcodeController.text.trim(),
      productType: _productType,
      baseUnit: _baseUnitController.text.trim(),
      allowDecimalQuantity: _allowDecimal,
      costPrice: _number(_costPriceController.text),
      salePrice: _number(_salePriceController.text),
      quantity: _number(_quantityController.text),
      minStock: _number(_minStockController.text),
      imagePath: _imagePathController.text.trim().isEmpty
          ? null
          : _imagePathController.text.trim(),
      imageName: null,
      imageUpdatedAt: null,
      isActive: _isActive,
      createdAt: now,
      updatedAt: now,
    );

    context.read<ProductsBloc>().add(
          ProductsEvent.create(product),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage ||
          previous.lastCreatedProductId != current.lastCreatedProductId,
      listener: (context, state) {
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
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة منتج جديد'),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 110),
              children: [
                _section(
                  context,
                  title: 'المعلومات الأساسية',
                  subtitle: 'أدخل اسم المنتج والبيانات التعريفية',
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: ProductUi.input(
                        label: 'اسم المنتج *',
                        hint: 'مثال: حليب كامل الدسم',
                        icon: Icons.inventory_2_outlined,
                      ),
                      validator: _requiredText,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: ProductUi.input(
                        label: 'الوصف',
                        hint: 'وصف اختياري للمنتج',
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
                      controller: _categoryController,
                      keyboardType: TextInputType.number,
                      decoration: ProductUi.input(
                        label: 'رقم التصنيف',
                        hint: 'اختياري',
                        icon: Icons.folder_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        }
                        return int.tryParse(value.trim()) == null
                            ? 'أدخل رقم تصنيف صحيحاً'
                            : null;
                      },
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _brandController,
                      keyboardType: TextInputType.number,
                      decoration: ProductUi.input(
                        label: 'رقم العلامة التجارية',
                        hint: 'اختياري',
                        icon: Icons.sell_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        }
                        return int.tryParse(value.trim()) == null
                            ? 'أدخل رقم علامة تجارية صحيحاً'
                            : null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  title: 'الباركود والوحدة',
                  subtitle: 'بيانات التعريف ووحدة القياس الأساسية',
                  children: [
                    TextFormField(
                      controller: _barcodeController,
                      decoration: ProductUi.input(
                        label: 'الباركود',
                        hint: 'أدخل الباركود أو امسحه',
                        icon: Icons.qr_code_2_rounded,
                        suffix: IconButton(
                          onPressed: _scanBarcode,
                          icon: const Icon(Icons.qr_code_scanner_rounded),
                          tooltip: 'قراءة الباركود',
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _baseUnitController,
                      decoration: ProductUi.input(
                        label: 'الوحدة الأساسية *',
                        hint: 'قطعة، كرتونة، كيلو...',
                        icon: Icons.straighten_rounded,
                      ),
                      validator: _requiredText,
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('السماح بالكميات العشرية'),
                      subtitle: const Text('مثل 1.5 كيلو'),
                      value: _allowDecimal,
                      onChanged: (value) =>
                          setState(() => _allowDecimal = value),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  title: 'الأسعار والمخزون',
                  subtitle: 'حدد سعر الشراء والبيع والكمية',
                  children: [
                    _numberField(
                      controller: _costPriceController,
                      label: 'سعر التكلفة',
                      icon: Icons.shopping_cart_outlined,
                    ),
                    const SizedBox(height: 13),
                    _numberField(
                      controller: _salePriceController,
                      label: 'سعر البيع',
                      icon: Icons.sell_outlined,
                    ),
                    const SizedBox(height: 13),
                    _numberField(
                      controller: _quantityController,
                      label: 'الكمية الحالية',
                      icon: Icons.inventory_outlined,
                    ),
                    const SizedBox(height: 13),
                    _numberField(
                      controller: _minStockController,
                      label: 'الحد الأدنى للمخزون',
                      icon: Icons.warning_amber_outlined,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _section(
                  context,
                  title: 'صورة المنتج',
                  children: [
                    TextFormField(
                      controller: _imagePathController,
                      decoration: ProductUi.input(
                        label: 'مسار الصورة',
                        hint: 'مسار أو رابط الصورة',
                        icon: Icons.image_outlined,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'يمكنك ترك الحقل فارغاً. اختيار الصورة من الجهاز يحتاج ربط منتقي الملفات.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Card(
                  child: SwitchListTile(
                    title: const Text('المنتج نشط'),
                    subtitle: const Text('إتاحة المنتج في عمليات البيع'),
                    value: _isActive,
                    onChanged: (value) =>
                        setState(() => _isActive = value),
                  ),
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
              label: Text(state.isSaving ? 'جارٍ الحفظ...' : 'حفظ المنتج'),
            ),
          ),
        );
      },
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    String? subtitle,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductUi.sectionTitle(
              context,
              title,
              subtitle: subtitle,
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: ProductUi.input(
        label: label,
        icon: icon,
      ),
      validator: (value) => _validateNumber(value),
    );
  }
}
