
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/entities/product/product_barcode.dart';
import '../../bloc/barcodes/barcodes_bloc.dart';
import '../../bloc/barcodes/barcodes_event.dart';
import '../../bloc/barcodes/barcodes_state.dart';

// =======================================================
// Product Barcodes Page
// =======================================================

class ProductBarcodesPage extends StatefulWidget {
  final int productId;

  const ProductBarcodesPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductBarcodesPage> createState() =>
      _ProductBarcodesPageState();
}

class _ProductBarcodesPageState
    extends State<ProductBarcodesPage> {
  final TextEditingController _searchController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<BarcodesBloc>().add(
        BarcodesEvent.watchRequested(
          productId: widget.productId,
        ),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // =====================================================
  // Add Barcode Dialog
  // =====================================================

  Future<void> _showAddBarcodeDialog() async {
    final barcodeController = TextEditingController();
    final sourceController = TextEditingController();

    String barcodeType = 'EAN13';
    int? productUnitId;
    bool isDefault = false;
    bool isActive = true;

    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.qr_code_2_rounded),
                  SizedBox(width: 10),
                  Text('إضافة باركود'),
                ],
              ),
              content: SizedBox(
                width: 450,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: barcodeController,
                          autofocus: true,
                          keyboardType:
                              TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'رقم الباركود',
                            hintText: 'أدخل رقم الباركود',
                            prefixIcon: Icon(
                              Icons.qr_code_rounded,
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'الباركود مطلوب';
                            }

                            if (value.trim().length < 4) {
                              return 'الباركود قصير جداً';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        DropdownButtonFormField<String>(
                          value: barcodeType,
                          decoration:
                              const InputDecoration(
                            labelText: 'نوع الباركود',
                            prefixIcon: Icon(
                              Icons.category_outlined,
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'EAN13',
                              child: Text('EAN-13'),
                            ),
                            DropdownMenuItem(
                              value: 'EAN8',
                              child: Text('EAN-8'),
                            ),
                            DropdownMenuItem(
                              value: 'UPC',
                              child: Text('UPC'),
                            ),
                            DropdownMenuItem(
                              value: 'CODE128',
                              child: Text('CODE 128'),
                            ),
                            DropdownMenuItem(
                              value: 'QR',
                              child: Text('QR Code'),
                            ),
                            DropdownMenuItem(
                              value: 'OTHER',
                              child: Text('أخرى'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setDialogState(() {
                                barcodeType = value;
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'رقم وحدة المنتج (اختياري)',
                            hintText: 'Product Unit ID',
                            prefixIcon: Icon(
                              Icons.inventory_2_outlined,
                            ),
                          ),
                          onChanged: (value) {
                            productUnitId =
                                int.tryParse(value.trim());
                          },
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: sourceController,
                          decoration: const InputDecoration(
                            labelText: 'مصدر الباركود',
                            hintText: 'مثلاً: يدوي أو مورد',
                            prefixIcon: Icon(
                              Icons.info_outline,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'باركود افتراضي',
                          ),
                          subtitle: const Text(
                            'استخدامه كرمز أساسي للمنتج',
                          ),
                          value: isDefault,
                          onChanged: (value) {
                            setDialogState(() {
                              isDefault = value;
                            });
                          },
                        ),

                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'باركود نشط',
                          ),
                          value: isActive,
                          onChanged: (value) {
                            setDialogState(() {
                              isActive = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('إلغاء'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    final barcode = ProductBarcode(
                      id: 0,
                      productId: widget.productId,
                      productUnitId: productUnitId,
                      barcode: barcodeController.text.trim(),
                      barcodeType: barcodeType,
                      source: sourceController.text.trim().isEmpty
                          ? null
                          : sourceController.text.trim(),
                      isDefault: isDefault,
                      isActive: isActive,
                    );

                    context.read<BarcodesBloc>().add(
                      BarcodesEvent.addRequested(
                        barcode: barcode,
                      ),
                    );

                    Navigator.pop(dialogContext);
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('حفظ الباركود'),
                ),
              ],
            );
          },
        );
      },
    );

    barcodeController.dispose();
    sourceController.dispose();
  }

  // =====================================================
  // Delete Barcode
  // =====================================================

  Future<void> _confirmDelete(
    ProductBarcode barcode,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('حذف الباركود'),
          content: Text(
            'هل تريد حذف الباركود ${barcode.barcode}؟',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context)
                    .colorScheme.error,
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && mounted) {
      context.read<BarcodesBloc>().add(
        BarcodesEvent.deleteRequested(
          id: barcode.id,
        ),
      );
    }
  }

  // =====================================================
  // Set Default
  // =====================================================

  void _setDefault(ProductBarcode barcode) {
    context.read<BarcodesBloc>().add(
      BarcodesEvent.setDefaultRequested(
        productId: widget.productId,
        barcodeId: barcode.id,
      ),
    );
  }

  // =====================================================
  // Search Product By Barcode
  // =====================================================

  void _searchBarcode() {
    final value = _searchController.text.trim();

    if (value.isEmpty) return;

    context.read<BarcodesBloc>().add(
      BarcodesEvent.productLookupRequested(
        barcode: value,
      ),
    );
  }

  // =====================================================
  // UI
  // =====================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocListener<BarcodesBloc, BarcodesState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage ??
            state.successMessage;

        if (message == null || message.isEmpty) return;

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: state.errorMessage != null
                  ? colors.error
                  : colors.primary,
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('باركودات المنتج'),
          actions: [
            IconButton(
              tooltip: 'تحديث',
              onPressed: () {
                context.read<BarcodesBloc>().add(
                  BarcodesEvent.watchRequested(
                    productId: widget.productId,
                  ),
                );
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: _showAddBarcodeDialog,
          icon: const Icon(Icons.add),
          label: const Text('إضافة باركود'),
        ),

        body: SafeArea(
          child: BlocBuilder<BarcodesBloc, BarcodesState>(
            builder: (context, state) {
              if (state.isLoading && !state.hasLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.errorMessage != null &&
                  !state.hasLoaded &&
                  state.barcodes.isEmpty) {
                return _ErrorView(
                  message: state.errorMessage!,
                  onRetry: () {
                    context.read<BarcodesBloc>().add(
                      BarcodesEvent.watchRequested(
                        productId: widget.productId,
                      ),
                    );
                  },
                );
              }

              final barcodes = state.barcodes;

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<BarcodesBloc>().add(
                    BarcodesEvent.loadRequested(
                      productId: widget.productId,
                    ),
                  );

                  await Future.delayed(
                    const Duration(milliseconds: 500),
                  );
                },
                child: CustomScrollView(
                  physics:
                      const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _BarcodeHero(
                            productId: widget.productId,
                            count: barcodes.length,
                            activeCount: barcodes
                                .where((e) => e.isActive)
                                .length,
                            defaultCount: barcodes
                                .where((e) => e.isDefault)
                                .length,
                          ),

                          const SizedBox(height: 20),

                          _BarcodeSearch(
                            controller: _searchController,
                            isSearching: state.isSearching,
                            onSearch: _searchBarcode,
                            onClear: () {
                              _searchController.clear();
                              context.read<BarcodesBloc>().add(
                                const BarcodesEvent.clearLookup(),
                              );
                            },
                          ),

                          if (state.scannedProduct != null) ...[
                            const SizedBox(height: 12),
                            Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      colors.primaryContainer,
                                  child: Icon(
                                    Icons.inventory_2_outlined,
                                    color: colors.primary,
                                  ),
                                ),
                                title: Text(
                                  'تم العثور على المنتج',
                                  style: theme.textTheme.titleMedium,
                                ),
                                subtitle: Text(
                                  'معرّف المنتج: '
                                  '${state.scannedProduct!.id}',
                                ),
                              ),
                            ),
                          ],

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'قائمة الباركودات',
                                  style:
                                      theme.textTheme.titleLarge,
                                ),
                              ),
                              Text(
                                '${barcodes.length} باركود',
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),
                        ]),
                      ),
                    ),

                    if (barcodes.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: _EmptyBarcodes(
                          onAdd: _showAddBarcodeDialog,
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                          16, 0, 16, 100,
                        ),
                        sliver: SliverList.separated(
                          itemCount: barcodes.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final barcode = barcodes[index];

                            return _BarcodeCard(
                              barcode: barcode,
                              onSetDefault: () =>
                                  _setDefault(barcode),
                              onDelete: () =>
                                  _confirmDelete(barcode),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// =======================================================
// Hero Summary
// =======================================================

class _BarcodeHero extends StatelessWidget {
  final int productId;
  final int count;
  final int activeCount;
  final int defaultCount;

  const _BarcodeHero({
    required this.productId,
    required this.count,
    required this.activeCount,
    required this.defaultCount,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primary,
            colors.secondary,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.qr_code_2_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.verified_outlined,
                color: Colors.white70,
                size: 26,
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'إدارة باركودات المنتج',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'رقم المنتج: $productId',
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _HeroStat(
                title: 'الإجمالي',
                value: count,
              ),
              _HeroStat(
                title: 'النشطة',
                value: activeCount,
              ),
              _HeroStat(
                title: 'الافتراضي',
                value: defaultCount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String title;
  final int value;

  const _HeroStat({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Search
// =======================================================

class _BarcodeSearch extends StatelessWidget {
  final TextEditingController controller;
  final bool isSearching;
  final VoidCallback onSearch;
  final VoidCallback onClear;

  const _BarcodeSearch({
    required this.controller,
    required this.isSearching,
    required this.onSearch,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (_) => onSearch(),
      decoration: InputDecoration(
        hintText: 'ابحث عن منتج بواسطة الباركود',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSearching)
              const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            else
              IconButton(
                onPressed: onSearch,
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            IconButton(
              onPressed: onClear,
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

// =======================================================
// Barcode Card
// =======================================================

class _BarcodeCard extends StatelessWidget {
  final ProductBarcode barcode;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;

  const _BarcodeCard({
    required this.barcode,
    required this.onSetDefault,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final active = barcode.isActive;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.qr_code_2_rounded,
                    color: colors.primary,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        barcode.barcode,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        barcode.barcodeType,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'default') {
                      onSetDefault();
                    } else if (value == 'delete') {
                      onDelete();
                    }
                  },
                  itemBuilder: (context) => [
                    if (!barcode.isDefault)
                      const PopupMenuItem(
                        value: 'default',
                        child: ListTile(
                          leading: Icon(
                            Icons.star_outline_rounded,
                          ),
                          title: Text('تعيين كافتراضي'),
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        title: Text('حذف الباركود'),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _StatusChip(
                  label: active ? 'نشط' : 'غير نشط',
                  color: active
                      ? colors.primary
                      : colors.error,
                ),
                if (barcode.isDefault)
                  _StatusChip(
                    label: 'افتراضي',
                    color: colors.tertiary,
                    icon: Icons.star_rounded,
                  ),
                if (barcode.productUnitId != null)
                  _StatusChip(
                    label: 'الوحدة #${barcode.productUnitId}',
                    color: colors.secondary,
                  ),
              ],
            ),

            if (barcode.source != null &&
                barcode.source!.isNotEmpty) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المصدر: ${barcode.source}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// =======================================================
// Status Chip
// =======================================================

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const _StatusChip({
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Empty
// =======================================================

class _EmptyBarcodes extends StatelessWidget {
  final VoidCallback onAdd;

  const _EmptyBarcodes({
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner_rounded,
              size: 76,
              color: colors.onSurfaceVariant.withValues(
                alpha: 0.5,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'لا توجد باركودات لهذا المنتج',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'يمكنك إضافة باركود واحد أو أكثر للمنتج',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('إضافة أول باركود'),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// Error
// =======================================================

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 55,
            ),
            const SizedBox(height: 12),
            const Text(
              'تعذر تحميل الباركودات',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
