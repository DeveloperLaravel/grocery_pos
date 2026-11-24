
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_unit.dart';
import '../../domain/entities/product_barcode.dart';
import '../../domain/entities/product_image.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../widgets/product_ui_helpers.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    final bloc = context.read<ProductsBloc>();
    bloc.add(ProductsEvent.getById(widget.productId));
    bloc.add(ProductsEvent.loadUnits(widget.productId));
    bloc.add(ProductsEvent.loadBarcodes(widget.productId));
    bloc.add(ProductsEvent.loadImages(widget.productId));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.successMessage != current.successMessage,
      listener: (context, state) {
        final message = state.errorMessage ?? state.successMessage;

        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: state.hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.primary,
            ),
          );

          context.read<ProductsBloc>().add(
                const ProductsEvent.clearMessages(),
              );
        }
      },
      builder: (context, state) {
        final product = state.selectedProduct;

        if (state.isLoadingProduct && product == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('تفاصيل المنتج')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (product == null || product.id != widget.productId) {
          return Scaffold(
            appBar: AppBar(title: const Text('تفاصيل المنتج')),
            body: ProductUi.emptyState(
              context: context,
              icon: Icons.inventory_2_outlined,
              title: 'المنتج غير موجود',
              subtitle: 'تعذر تحميل بيانات المنتج',
              action: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('رجوع'),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('تفاصيل المنتج'),
            actions: [
              IconButton(
                tooltip: 'تعديل المنتج',
                onPressed: () => AppNavigation.editProduct(
                  context,
                  product.id,
                ),
                icon: const Icon(Icons.edit_outlined),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Column(
            children: [
              _ProductHeader(product: product),
              Material(
                color: Theme.of(context).colorScheme.surface,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'نظرة عامة', icon: Icon(Icons.info_outline)),
                    Tab(text: 'الوحدات', icon: Icon(Icons.straighten)),
                    Tab(text: 'الباركود', icon: Icon(Icons.qr_code_2)),
                    Tab(text: 'الصور', icon: Icon(Icons.image_outlined)),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _OverviewTab(product: product),
                    _UnitsTab(
                      product: product,
                      units: state.units,
                      loading: state.isLoadingUnits,
                    ),
                    _BarcodesTab(
                      product: product,
                      barcodes: state.barcodes,
                      loading: state.isLoadingBarcodes,
                    ),
                    _ImagesTab(
                      product: product,
                      images: state.images,
                      loading: state.isLoadingImages,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProductHeader extends StatelessWidget {
  final Product product;

  const _ProductHeader({required this.product});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: _ProductImage(path: product.imagePath),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      product.barcode ?? 'لا يوجد باركود رئيسي',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 9),
                    Wrap(
                      spacing: 6,
                      children: [
                        ProductUi.statusChip(
                          context,
                          label: product.isActive ? 'نشط' : 'غير نشط',
                          color: product.isActive
                              ? Colors.green
                              : scheme.onSurfaceVariant,
                        ),
                        if (product.isLowStock)
                          ProductUi.statusChip(
                            context,
                            label: 'مخزون منخفض',
                            color: scheme.error,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  final Product product;

  const _OverviewTab({required this.product});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: ProductUi.statCard(
                context: context,
                title: 'سعر البيع',
                value: '${ProductUi.money(product.salePrice)} د.ل',
                icon: Icons.sell_outlined,
                color: scheme.primary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProductUi.statCard(
                context: context,
                title: 'الكمية',
                value: '${product.quantity}',
                icon: Icons.inventory_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ProductUi.statCard(
                context: context,
                title: 'قيمة المخزون',
                value: ProductUi.money(product.stockValue),
                icon: Icons.account_balance_wallet_outlined,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProductUi.statCard(
                context: context,
                title: 'قيمة البيع المتوقعة',
                value: ProductUi.money(product.potentialSalesValue),
                icon: Icons.trending_up_rounded,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _InfoCard(
          title: 'معلومات المنتج',
          children: [
            _InfoRow(label: 'اسم المنتج', value: product.name),
            _InfoRow(
              label: 'نوع المنتج',
              value: _typeLabel(product.productType),
            ),
            _InfoRow(label: 'الوحدة الأساسية', value: product.baseUnit),
            _InfoRow(
              label: 'الباركود',
              value: product.barcode ?? 'غير محدد',
            ),
            _InfoRow(
              label: 'التصنيف',
              value: product.categoryId?.toString() ?? 'غير محدد',
            ),
            _InfoRow(
              label: 'العلامة التجارية',
              value: product.brandId?.toString() ?? 'غير محدد',
            ),
            _InfoRow(
              label: 'سعر التكلفة',
              value: '${ProductUi.money(product.costPrice)} د.ل',
            ),
            _InfoRow(
              label: 'سعر البيع',
              value: '${ProductUi.money(product.salePrice)} د.ل',
            ),
            _InfoRow(
              label: 'الحد الأدنى للمخزون',
              value: '${product.minStock}',
            ),
            _InfoRow(
              label: 'الكميات العشرية',
              value: product.allowDecimalQuantity ? 'مسموح' : 'غير مسموح',
            ),
          ],
        ),
        if (product.description != null &&
            product.description!.trim().isNotEmpty) ...[
          const SizedBox(height: 12),
          _InfoCard(
            title: 'الوصف',
            children: [
              Text(product.description!),
            ],
          ),
        ],
        const SizedBox(height: 12),
        _InfoCard(
          title: 'التواريخ',
          children: [
            _InfoRow(
              label: 'تاريخ الإنشاء',
              value: _date(product.createdAt),
            ),
            _InfoRow(
              label: 'آخر تحديث',
              value: _date(product.updatedAt),
            ),
          ],
        ),
      ],
    );
  }

  static String _typeLabel(String type) {
    switch (type) {
      case 'service':
        return 'خدمة';
      case 'composite':
        return 'منتج مركب';
      default:
        return 'منتج عادي';
    }
  }

  static String _date(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }
}

class _UnitsTab extends StatelessWidget {
  final Product product;
  final List<ProductUnit> units;
  final bool loading;

  const _UnitsTab({
    required this.product,
    required this.units,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ProductUi.sectionTitle(
            context,
            'وحدات المنتج',
            subtitle: '${units.length} وحدة',
            action: FilledButton.tonalIcon(
              onPressed: () => _showUnitDialog(context, product),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('إضافة'),
            ),
          ),
        ),
        Expanded(
          child: units.isEmpty
              ? ProductUi.emptyState(
                  context: context,
                  icon: Icons.straighten_outlined,
                  title: 'لا توجد وحدات إضافية',
                  subtitle: 'أضف وحدة مثل كرتونة أو حبة أو صندوق',
                  action: FilledButton.icon(
                    onPressed: () => _showUnitDialog(context, product),
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة وحدة'),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: units.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 9),
                  itemBuilder: (context, index) {
                    final unit = units[index];

                    return Card(
                      child: ListTile(
                        title: Text(
                          unit.unitName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'معامل التحويل: ${unit.conversionFactor}\n'
                          'سعر البيع: ${ProductUi.money(unit.salePrice)} د.ل',
                        ),
                        isThreeLine: true,
                        leading: const CircleAvatar(
                          child: Icon(Icons.straighten),
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'default') {
                              context.read<ProductsBloc>().add(
                                    ProductsEvent.setDefaultUnit(
                                      productId: product.id,
                                      unitId: unit.id,
                                    ),
                                  );
                            } else if (value == 'edit') {
                              _showUnitDialog(
                                context,
                                product,
                                unit: unit,
                              );
                            } else if (value == 'delete') {
                              final ok = await ProductUi.confirmDelete(
                                context,
                                title: 'حذف الوحدة',
                                message: 'هل تريد حذف ${unit.unitName}؟',
                              );

                              if (ok && context.mounted) {
                                context.read<ProductsBloc>().add(
                                      ProductsEvent.deleteUnit(
                                        id: unit.id,
                                        productId: product.id,
                                      ),
                                    );
                              }
                            }
                          },
                          itemBuilder: (_) => [
                            const PopupMenuItem(
                              value: 'default',
                              child: Text('تعيين كافتراضية'),
                            ),
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('تعديل'),
                            ),
                            if (!unit.isBaseUnit)
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('حذف'),
                              ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

Future<void> _showUnitDialog(
  BuildContext context,
  Product product, {
  ProductUnit? unit,
}) async {
  final name = TextEditingController(text: unit?.unitName ?? '');
  final symbol = TextEditingController(text: unit?.unitSymbol ?? '');
  final factor = TextEditingController(
    text: unit?.conversionFactor.toString() ?? '1',
  );
  final sale = TextEditingController(
    text: unit?.salePrice.toString() ?? product.salePrice.toString(),
  );
  final purchase = TextEditingController(
    text: unit?.purchasePrice.toString() ?? product.costPrice.toString(),
  );

  final formKey = GlobalKey<FormState>();
  bool active = unit?.isActive ?? true;

  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (context, setDialogState) => AlertDialog(
        title: Text(unit == null ? 'إضافة وحدة' : 'تعديل الوحدة'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: name,
                  decoration: ProductUi.input(label: 'اسم الوحدة'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'أدخل اسم الوحدة' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: symbol,
                  decoration: ProductUi.input(label: 'رمز الوحدة'),
                ),
                const SizedBox(height: 10),
                _dialogNumberField(factor, 'معامل التحويل'),
                const SizedBox(height: 10),
                _dialogNumberField(sale, 'سعر البيع'),
                const SizedBox(height: 10),
                _dialogNumberField(purchase, 'سعر الشراء'),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('الوحدة نشطة'),
                  value: active,
                  onChanged: (v) => setDialogState(() => active = v),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(dialogContext, true);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    ),
  );

  if (result == true && context.mounted) {
    final now = DateTime.now();
    final newUnit = ProductUnit(
      id: unit?.id ?? 0,
      productId: product.id,
      unitName: name.text.trim(),
      unitSymbol: symbol.text.trim().isEmpty ? null : symbol.text.trim(),
      conversionFactor: _parseDialogNumber(factor.text),
      salePrice: _parseDialogNumber(sale.text),
      purchasePrice: _parseDialogNumber(purchase.text),
      isBaseUnit: unit?.isBaseUnit ?? false,
      isDefault: unit?.isDefault ?? false,
      isActive: active,
      sortOrder: unit?.sortOrder ?? 0,
      createdAt: unit?.createdAt ?? now,
      updatedAt: now,
    );

    context.read<ProductsBloc>().add(
          unit == null
              ? ProductsEvent.addUnit(newUnit)
              : ProductsEvent.updateUnit(newUnit),
        );
  }

  name.dispose();
  symbol.dispose();
  factor.dispose();
  sale.dispose();
  purchase.dispose();
}

class _BarcodesTab extends StatelessWidget {
  final Product product;
  final List<ProductBarcode> barcodes;
  final bool loading;

  const _BarcodesTab({
    required this.product,
    required this.barcodes,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ProductUi.sectionTitle(
            context,
            'باركودات المنتج',
            subtitle: '${barcodes.length} باركود',
            action: FilledButton.tonalIcon(
              onPressed: () => _showBarcodeDialog(context, product),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('إضافة'),
            ),
          ),
        ),
        Expanded(
          child: barcodes.isEmpty
              ? ProductUi.emptyState(
                  context: context,
                  icon: Icons.qr_code_2,
                  title: 'لا توجد باركودات إضافية',
                  subtitle: 'يمكنك إضافة باركود داخلي أو خارجي',
                  action: FilledButton.icon(
                    onPressed: () => _showBarcodeDialog(context, product),
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة باركود'),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: barcodes.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 9),
                  itemBuilder: (context, index) {
                    final barcode = barcodes[index];

                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.qr_code_2),
                        ),
                        title: Text(
                          barcode.barcode,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${barcode.isInternal ? 'داخلي' : 'خارجي'}'
                          '${barcode.belongsToUnit ? ' • مرتبط بوحدة' : ''}',
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'default') {
                              context.read<ProductsBloc>().add(
                                    ProductsEvent.setDefaultBarcode(
                                      id: barcode.id,
                                      productId: product.id,
                                    ),
                                  );
                            } else if (value == 'delete') {
                              final ok = await ProductUi.confirmDelete(
                                context,
                                title: 'حذف الباركود',
                                message: 'هل تريد حذف هذا الباركود؟',
                              );

                              if (ok && context.mounted) {
                                context.read<ProductsBloc>().add(
                                      ProductsEvent.deleteBarcode(
                                        id: barcode.id,
                                        productId: product.id,
                                      ),
                                    );
                              }
                            }
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                              value: 'default',
                              child: Text('تعيين كافتراضي'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('حذف'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

Future<void> _showBarcodeDialog(
  BuildContext context,
  Product product,
) async {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String type = 'internal';

  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (context, setDialogState) => AlertDialog(
        title: const Text('إضافة باركود'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller,
                decoration: ProductUi.input(
                  label: 'قيمة الباركود',
                  icon: Icons.qr_code_2,
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? 'أدخل قيمة الباركود'
                        : null,
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                value: type,
                decoration: ProductUi.input(label: 'نوع الباركود'),
                items: const [
                  DropdownMenuItem(
                    value: 'internal',
                    child: Text('داخلي'),
                  ),
                  DropdownMenuItem(
                    value: 'external',
                    child: Text('خارجي'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setDialogState(() => type = value);
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(dialogContext, true);
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    ),
  );

  if (result == true && context.mounted) {
    final now = DateTime.now();

    context.read<ProductsBloc>().add(
          ProductsEvent.addBarcode(
            ProductBarcode(
              id: 0,
              productId: product.id,
              barcode: controller.text.trim(),
              barcodeType: type,
              source: 'manual',
              isDefault: false,
              isActive: true,
              createdAt: now,
              updatedAt: now,
            ),
          ),
        );
  }

  controller.dispose();
}

class _ImagesTab extends StatelessWidget {
  final Product product;
  final List<ProductImage> images;
  final bool loading;

  const _ImagesTab({
    required this.product,
    required this.images,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ProductUi.sectionTitle(
            context,
            'صور المنتج',
            subtitle: '${images.length} صورة',
            action: FilledButton.tonalIcon(
              onPressed: () => _showImageDialog(context, product),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('إضافة'),
            ),
          ),
        ),
        Expanded(
          child: images.isEmpty
              ? ProductUi.emptyState(
                  context: context,
                  icon: Icons.image_outlined,
                  title: 'لا توجد صور',
                  subtitle: 'أضف مسار صورة المنتج لإضافتها إلى المعرض',
                  action: FilledButton.icon(
                    onPressed: () => _showImageDialog(context, product),
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة صورة'),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: images.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final image = images[index];

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                _ProductImage(path: image.imagePath),
                                if (image.isPrimary)
                                  PositionedDirectional(
                                    top: 8,
                                    start: 8,
                                    child: ProductUi.statusChip(
                                      context,
                                      label: 'رئيسية',
                                      color: Colors.green,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                tooltip: 'تعيين كرئيسية',
                                onPressed: () {
                                  context.read<ProductsBloc>().add(
                                        ProductsEvent.setPrimaryImage(
                                          id: image.id,
                                          productId: product.id,
                                        ),
                                      );
                                },
                                icon: Icon(
                                  image.isPrimary
                                      ? Icons.star
                                      : Icons.star_border,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                tooltip: 'حذف الصورة',
                                onPressed: () async {
                                  final ok = await ProductUi.confirmDelete(
                                    context,
                                    title: 'حذف الصورة',
                                    message: 'هل تريد حذف هذه الصورة؟',
                                  );

                                  if (ok && context.mounted) {
                                    context.read<ProductsBloc>().add(
                                          ProductsEvent.deleteImage(
                                            id: image.id,
                                            productId: product.id,
                                          ),
                                        );
                                  }
                                },
                                color: Theme.of(context).colorScheme.error,
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

Future<void> _showImageDialog(
  BuildContext context,
  Product product,
) async {
  final path = TextEditingController();
  final name = TextEditingController();

  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('إضافة صورة'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: path,
            decoration: ProductUi.input(
              label: 'مسار الصورة أو رابطها',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: name,
            decoration: ProductUi.input(label: 'اسم الصورة'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('إلغاء'),
        ),
        FilledButton(
          onPressed: () {
            if (path.text.trim().isNotEmpty) {
              Navigator.pop(dialogContext, true);
            }
          },
          child: const Text('إضافة'),
        ),
      ],
    ),
  );

  if (result == true && context.mounted) {
    context.read<ProductsBloc>().add(
          ProductsEvent.addImage(
            ProductImage(
              id: 0,
              productId: product.id,
              imagePath: path.text.trim(),
              imageName: name.text.trim().isEmpty
                  ? null
                  : name.text.trim(),
              isPrimary: false,
              sortOrder: 0,
              createdAt: DateTime.now(),
            ),
          ),
        );
  }

  path.dispose();
  name.dispose();
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductUi.sectionTitle(context, title),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? path;

  const _ProductImage({this.path});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (path != null && path!.trim().isNotEmpty) {
      final value = path!;

      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: value.startsWith('http://') || value.startsWith('https://')
            ? Image.network(
                value,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(scheme),
              )
            : Image.asset(
                value,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(scheme),
              ),
      );
    }

    return _placeholder(scheme);
  }

  Widget _placeholder(ColorScheme scheme) {
    return Container(
      color: scheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_outlined,
        color: scheme.onSurfaceVariant,
        size: 34,
      ),
    );
  }
}

Widget _dialogNumberField(
  TextEditingController controller,
  String label,
) {
  return TextFormField(
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    decoration: ProductUi.input(label: label),
    validator: (value) {
      final number = double.tryParse(
        (value ?? '').trim().replaceAll(',', '.'),
      );

      if (number == null || !number.isFinite || number <= 0) {
        return 'أدخل قيمة أكبر من صفر';
      }

      return null;
    },
  );
}

double _parseDialogNumber(String value) {
  return double.tryParse(value.trim().replaceAll(',', '.')) ?? 0;
}
