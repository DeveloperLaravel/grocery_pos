import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/pos/domain/pos_repository.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final PosRepository repo = getIt<PosRepository>();

  final TextEditingController _searchController =
      TextEditingController();

  List<ProductEntity> products = [];
  bool loading = true;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductEntity> get filteredProducts {
    final query = searchText.trim().toLowerCase();

    if (query.isEmpty) {
      return products;
    }

    return products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.barcode.toLowerCase().contains(query);
    }).toList();
  }

  int get lowStockCount =>
      products.where((p) => p.isLowStock).length;

  Future<void> _load() async {
    if (mounted) {
      setState(() => loading = true);
    }

    final result = await repo.getProducts().run();

    result.match(
      (failure) => _showMessage(
        failure.message,
        error: true,
      ),
      (data) {
        products = data;
      },
    );

    if (mounted) {
      setState(() => loading = false);
    }
  }

  void _showMessage(
    String message, {
    bool error = false,
  }) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(
                error
                    ? Icons.error_outline
                    : Icons.check_circle_outline,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message),
              ),
            ],
          ),
          backgroundColor:
              error ? Colors.red.shade700 : Colors.green.shade700,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final bool veryCompact = width < 380;
        final bool compact = width < 700;
        final bool medium = width >= 700 && width < 1100;

        return Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.surfaceContainerLowest,
          floatingActionButton: compact
              ? FloatingActionButton.extended(
                  onPressed: () => _edit(),
                  icon: const Icon(Icons.add),
                  label: const Text('منتج جديد'),
                )
              : null,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(
                veryCompact ? 8 : compact ? 12 : medium ? 16 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(
                    compact,
                    veryCompact: veryCompact,
                  ),

                  SizedBox(height: veryCompact ? 10 : 16),

                  _buildStatistics(
                    compact,
                    veryCompact: veryCompact,
                  ),

                  SizedBox(height: veryCompact ? 10 : 16),

                  _buildSearch(),

                  SizedBox(height: veryCompact ? 10 : 16),

                  Expanded(
                    child: _buildContent(
                      compact,
                      veryCompact: veryCompact,
                      medium: medium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
    bool compact, {
    required bool veryCompact,
  }) {
    return Row(
      children: [
        Container(
          width: veryCompact ? 40 : compact ? 44 : 52,
          height: veryCompact ? 40 : compact ? 44 : 52,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Icons.inventory_2_rounded,
            color: Theme.of(context)
                .colorScheme
                .onPrimaryContainer,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المنتجات',
                style: TextStyle(
                  fontSize: veryCompact ? 20 : compact ? 23 : 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (!veryCompact) ...[
                const SizedBox(height: 2),
                const Text(
                  'إدارة المنتجات والأسعار والمخزون',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),

        IconButton.filledTonal(
          tooltip: 'تحديث',
          onPressed: loading ? null : _load,
          icon: const Icon(Icons.refresh_rounded),
        ),

        if (!compact) ...[
          const SizedBox(width: 10),

          FilledButton.icon(
            onPressed: () => _edit(),
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة منتج'),
          ),
        ],
      ],
    );
  }

  Widget _buildStatistics(
    bool compact, {
    required bool veryCompact,
  }) {
    if (veryCompact) {
      return Column(
        children: [
          _statCard(
            title: 'المنتجات',
            value: '${products.length}',
            icon: Icons.inventory_2_outlined,
          ),
          const SizedBox(height: 8),
          _statCard(
            title: 'مخزون منخفض',
            value: '$lowStockCount',
            icon: Icons.warning_amber_rounded,
            warning: lowStockCount > 0,
          ),
        ],
      );
    }

    if (compact) {
      return Row(
        children: [
          Expanded(
            child: _statCard(
              title: 'المنتجات',
              value: '${products.length}',
              icon: Icons.inventory_2_outlined,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _statCard(
              title: 'مخزون منخفض',
              value: '$lowStockCount',
              icon: Icons.warning_amber_rounded,
              warning: lowStockCount > 0,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _statCard(
            title: 'إجمالي المنتجات',
            value: '${products.length}',
            icon: Icons.inventory_2_outlined,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _statCard(
            title: 'مخزون منخفض',
            value: '$lowStockCount',
            icon: Icons.warning_amber_rounded,
            warning: lowStockCount > 0,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _statCard(
            title: 'متوفر بالمخزون',
            value:
                '${products.where((p) => p.quantity > 0).length}',
            icon: Icons.check_circle_outline_rounded,
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    bool warning = false,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: warning
          // ignore: deprecated_member_use
          ? scheme.errorContainer.withOpacity(.55)
          : scheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: warning
                  // ignore: deprecated_member_use
                  ? scheme.error.withOpacity(.12)
                  // ignore: deprecated_member_use
                  : scheme.primary.withOpacity(.12),
              child: Icon(
                icon,
                color: warning
                    ? scheme.error
                    : scheme.primary,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'ابحث باسم المنتج أو الباركود...',
        prefixIcon:
            const Icon(Icons.search_rounded),
        suffixIcon: searchText.isNotEmpty
            ? IconButton(
                tooltip: 'مسح البحث',
                onPressed: () {
                  _searchController.clear();

                  setState(() {
                    searchText = '';
                  });
                },
                icon: const Icon(Icons.close),
              )
            : null,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildContent(
    bool compact, {
    required bool veryCompact,
    required bool medium,
  }) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final data = filteredProducts;

    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 70,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 14),
            Text(
              searchText.isEmpty
                  ? 'لا توجد منتجات بعد'
                  : 'لم يتم العثور على منتج',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              searchText.isEmpty
                  ? 'ابدأ بإضافة أول منتج'
                  : 'جرّب اسمًا أو باركودًا آخر',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    if (compact) {
      return ListView.separated(
        keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: data.length,
        separatorBuilder: (_, __) =>
            SizedBox(height: veryCompact ? 8 : 10),
        itemBuilder: (_, index) =>
            _productCard(
              data[index],
              compact: true,
              veryCompact: veryCompact,
            ),
      );
    }

    return GridView.builder(
      keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: medium ? 390 : 430,
        mainAxisExtent: medium ? 178 : 185,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: data.length,
      itemBuilder: (_, index) =>
          _productCard(
            data[index],
            compact: false,
            veryCompact: false,
          ),
    );
  }

  Widget _productCard(
    ProductEntity product, {
    required bool compact,
    required bool veryCompact,
  }) {
    final bool low = product.isLowStock;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _edit(product),
        child: Padding(
          padding: EdgeInsets.all(
            veryCompact ? 11 : compact ? 13 : 16,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: veryCompact ? 18 : compact ? 20 : 22,
                    child: Text(
                      product.name.isNotEmpty
                          ? product.name[0]
                          : '?',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: veryCompact ? 14 : compact ? 15 : 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Row(
                          children: [
                            const Icon(
                              Icons.qr_code,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                product.barcode,
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis,
                                style: TextStyle(
                                  color:
                                      Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    tooltip: 'تعديل',
                    onPressed: () =>
                        _edit(product),
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              if (veryCompact)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _miniInfo(
                            'البيع',
                            '${product.salePrice.toStringAsFixed(2)} د.ل',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _miniInfo(
                            'التكلفة',
                            '${product.costPrice.toStringAsFixed(2)} د.ل',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _stockBadge(product, low),
                  ],
                )
              else
                Row(
                  children: [
                    _miniInfo(
                      'البيع',
                      '${product.salePrice.toStringAsFixed(2)} د.ل',
                    ),
                    const SizedBox(width: 10),
                    _miniInfo(
                      'التكلفة',
                      '${product.costPrice.toStringAsFixed(2)} د.ل',
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _stockBadge(product, low),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stockBadge(
    ProductEntity product,
    bool low,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: low
            // ignore: deprecated_member_use
            ? Colors.red.withOpacity(.10)
            // ignore: deprecated_member_use
            : Colors.green.withOpacity(.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'المخزون: ${product.quantity}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: low
              ? Colors.red.shade700
              : Colors.green.shade700,
        ),
      ),
    );
  }

  Widget _miniInfo(
    String title,
    String value,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> _edit([
    ProductEntity? product,
  ]) async {
    final nameController =
        TextEditingController(
      text: product?.name ?? '',
    );

    final barcodeController =
        TextEditingController(
      text: product?.barcode ?? '',
    );

    final costController =
        TextEditingController(
      text: product?.costPrice.toString() ?? '0',
    );

    final priceController =
        TextEditingController(
      text: product?.salePrice.toString() ?? '',
    );

    final quantityController =
        TextEditingController(
      text: product?.quantity.toString() ?? '0',
    );

    final minStockController =
        TextEditingController(
      text: product?.minStock.toString() ?? '5',
    );

    final barcodeFocus = FocusNode();

    final save = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        final size = MediaQuery.sizeOf(dialogContext);
        final dialogCompact = size.width < 600;

        return Dialog(
          insetPadding: EdgeInsets.all(
            size.width < 380 ? 8 : 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 620,
              maxHeight: size.height * .92,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                dialogCompact ? 14 : 22,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          product == null
                              ? Icons.add
                              : Icons.edit,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          product == null
                              ? 'إضافة منتج جديد'
                              : 'تعديل المنتج',
                          style:
                              const TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () =>
                            Navigator.pop(
                          dialogContext,
                          false,
                        ),
                        icon:
                            const Icon(Icons.close),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Flexible(
                    child: SingleChildScrollView(
                      child: LayoutBuilder(
                        builder:
                            (context, constraints) {
                          final twoColumns =
                              constraints.maxWidth >
                                  520;

                          if (!twoColumns) {
                            final fields = _formFields(
                              dialogContext,
                              nameController,
                              barcodeController,
                              barcodeFocus,
                              costController,
                              priceController,
                              quantityController,
                              minStockController,
                            );

                            return Column(
                              children: [
                                for (int i = 0;
                                    i < fields.length;
                                    i++) ...[
                                  fields[i],
                                  if (i != fields.length - 1)
                                    const SizedBox(height: 12),
                                ],
                              ],
                            );
                          }

                          final fields =
                              _formFields(
                            dialogContext,
                            nameController,
                            barcodeController,
                            barcodeFocus,
                            costController,
                            priceController,
                            quantityController,
                            minStockController,
                          );

                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: fields
                                .map(
                                  (widget) =>
                                      SizedBox(
                                    width:
                                        (constraints.maxWidth -
                                                12) /
                                            2,
                                    child:
                                        widget,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  if (dialogCompact)
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton.icon(
                            onPressed: () =>
                                Navigator.pop(
                              dialogContext,
                              true,
                            ),
                            icon: const Icon(
                              Icons.save_outlined,
                            ),
                            label: const Text('حفظ'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () =>
                                Navigator.pop(
                              dialogContext,
                              false,
                            ),
                            child: const Text('إلغاء'),
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(
                            dialogContext,
                            false,
                          ),
                          child: const Text('إلغاء'),
                        ),
                        const SizedBox(width: 10),
                        FilledButton.icon(
                          onPressed: () =>
                              Navigator.pop(
                            dialogContext,
                            true,
                          ),
                          icon: const Icon(
                            Icons.save_outlined,
                          ),
                          label: const Text('حفظ'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );

    barcodeFocus.dispose();

    if (save != true) return;

    final name = nameController.text.trim();
    final barcode =
        barcodeController.text.trim();

    if (name.isEmpty) {
      _showMessage(
        'اكتب اسم المنتج',
        error: true,
      );
      return;
    }

    if (barcode.isEmpty) {
      _showMessage(
        'أدخل أو امسح باركود المنتج',
        error: true,
      );
      return;
    }

    final salePrice = double.tryParse(
          priceController.text
              .trim()
              .replaceAll(',', '.'),
        ) ??
        0;

    if (salePrice <= 0) {
      _showMessage(
        'سعر البيع يجب أن يكون أكبر من صفر',
        error: true,
      );
      return;
    }

    final entity = ProductEntity(
      id: product?.id ?? 0,
      name: name,
      barcode: barcode,
      costPrice: double.tryParse(
            costController.text
                .trim()
                .replaceAll(',', '.'),
          ) ??
          0,
      salePrice: salePrice,
      quantity: double.tryParse(
            quantityController.text
                .trim()
                .replaceAll(',', '.'),
          ) ??
          0,
      minStock: double.tryParse(
            minStockController.text
                .trim()
                .replaceAll(',', '.'),
          ) ??
          0,
    );

    final result =
        await repo.saveProduct(entity).run();

    result.match(
      (failure) => _showMessage(
        failure.message,
        error: true,
      ),
      (_) async {
        await _load();

        _showMessage(
          product == null
              ? 'تمت إضافة المنتج بنجاح'
              : 'تم تعديل المنتج بنجاح',
        );
      },
    );
  }

  List<Widget> _formFields(
    BuildContext dialogContext,
    TextEditingController name,
    TextEditingController barcode,
    FocusNode barcodeFocus,
    TextEditingController cost,
    TextEditingController price,
    TextEditingController qty,
    TextEditingController min,
  ) {
    return [
      _field(
        name,
        'اسم المنتج',
        icon: Icons.inventory_2_outlined,
      ),

      _barcodeField(
        controller: barcode,
        focusNode: barcodeFocus,
        dialogContext: dialogContext,
      ),

      _field(
        cost,
        'سعر التكلفة',
        numeric: true,
        icon: Icons.payments_outlined,
      ),

      _field(
        price,
        'سعر البيع',
        numeric: true,
        icon: Icons.sell_outlined,
      ),

      _field(
        qty,
        'الكمية',
        numeric: true,
        icon: Icons.numbers,
      ),

      _field(
        min,
        'حد المخزون المنخفض',
        numeric: true,
        icon: Icons.warning_amber_rounded,
      ),
    ];
  }

  Widget _barcodeField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required BuildContext dialogContext,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: Platform.isWindows,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'الباركود',
        hintText: Platform.isWindows
            ? 'مرر المنتج أمام قارئ USB'
            : 'امسح بالكاميرا أو اكتب الباركود',
        prefixIcon:
            const Icon(Icons.qr_code_rounded),
        suffixIcon: IconButton.filledTonal(
          tooltip: Platform.isAndroid
              ? 'مسح بالكاميرا'
              : 'استقبال من قارئ USB',
          onPressed: () async {
            if (Platform.isAndroid) {
              final value =
                  await Navigator.of(
                dialogContext,
              ).push<String>(
                MaterialPageRoute(
                  builder: (_) =>
                      const ProductBarcodeScannerPage(),
                ),
              );

              if (value != null &&
                  value.isNotEmpty) {
                controller.text = value;
              }

              return;
            }

            if (Platform.isWindows) {
              focusNode.requestFocus();

              _showMessage(
                'مرر المنتج أمام قارئ الباركود الآن',
              );
            }
          },
          icon: Icon(
            Platform.isAndroid
                ? Icons.qr_code_scanner
                : Icons.usb_rounded,
          ),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool numeric = false,
    IconData? icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: numeric
          ? const TextInputType.numberWithOptions(
              decimal: true,
            )
          : null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:
            icon == null ? null : Icon(icon),
        filled: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(14),
        ),
      ),
    );
  }
}

class ProductBarcodeScannerPage
    extends StatefulWidget {
  const ProductBarcodeScannerPage({
    super.key,
  });

  @override
  State<ProductBarcodeScannerPage>
      createState() =>
          _ProductBarcodeScannerPageState();
}

class _ProductBarcodeScannerPageState
    extends State<ProductBarcodeScannerPage> {
  final MobileScannerController controller =
      MobileScannerController();

  bool detected = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(
    BarcodeCapture capture,
  ) async {
    if (detected ||
        capture.barcodes.isEmpty) {
      return;
    }

    final barcode =
        capture.barcodes.first.rawValue?.trim();

    if (barcode == null ||
        barcode.isEmpty) {
      return;
    }

    detected = true;

    await controller.stop();

    if (!mounted) return;

    Navigator.pop(context, barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            const Text('مسح باركود المنتج'),
        actions: [
          IconButton(
            tooltip: 'الفلاش',
            onPressed:
                controller.toggleTorch,
            icon:
                const Icon(Icons.flash_on),
          ),
          IconButton(
            tooltip: 'تبديل الكاميرا',
            onPressed:
                controller.switchCamera,
            icon: const Icon(
              Icons.cameraswitch,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
          ),

          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final frameWidth =
                    (constraints.maxWidth * .78).clamp(220.0, 360.0);
                return Container(
                  width: frameWidth,
                  height: frameWidth * .48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 35,
            child: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      // ignore: deprecated_member_use
                      Colors.black.withOpacity(.65),
                  borderRadius:
                      BorderRadius.circular(16),
                ),
                child: const Text(
                  'ضع باركود المنتج داخل الإطار وسيتم تسجيله تلقائيًا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}