
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product/product_unit.dart';
import '../../bloc/product_units/product_units_bloc.dart';
import '../../bloc/product_units/product_units_event.dart';
import '../../bloc/product_units/product_units_state.dart';

import 'widgets/product_unit_form_dialog.dart';

class ProductUnitsPage extends StatelessWidget {
  final int productId;
  final String? productName;
  final ProductUnitsBloc bloc;

  const ProductUnitsPage({
    super.key,
    required this.productId,
    required this.bloc,
    this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..add(ProductUnitsEvent.watch(productId: productId)),
      child: _ProductUnitsView(
        productId: productId,
        productName: productName,
      ),
    );
  }
}

class _ProductUnitsView extends StatefulWidget {
  final int productId;
  final String? productName;

  const _ProductUnitsView({
    required this.productId,
    this.productName,
  });

  @override
  State<_ProductUnitsView> createState() =>
      _ProductUnitsViewState();
}

class _ProductUnitsViewState extends State<_ProductUnitsView> {
  final TextEditingController _searchController =
      TextEditingController();

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductUnit> _filterUnits(List<ProductUnit> units) {
    if (_searchQuery.trim().isEmpty) return units;

    return units.where((unit) {
      return unit.unitName.toLowerCase().contains(
            _searchQuery.trim().toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('وحدات المنتج'),
              if (widget.productName != null)
                Text(
                  widget.productName!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: 'تحديث',
              onPressed: () {
                context.read<ProductUnitsBloc>().add(
                      ProductUnitsEvent.load(
                        productId: widget.productId,
                      ),
                    );
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
            const SizedBox(width: 8),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _openForm(context),
          icon: const Icon(Icons.add_rounded),
          label: const Text('إضافة وحدة'),
        ),

        body: BlocConsumer<ProductUnitsBloc, ProductUnitsState>(
          listenWhen: (previous, current) =>
              previous.successMessage != current.successMessage ||
              previous.errorMessage != current.errorMessage,

          listener: (context, state) {
            if (state.successMessage != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.successMessage!),
                    backgroundColor: colors.primary,
                  ),
                );

              context.read<ProductUnitsBloc>().add(
                    const ProductUnitsEvent.clearMessages(),
                  );
            }

            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: colors.error,
                  ),
                );

              context.read<ProductUnitsBloc>().add(
                    const ProductUnitsEvent.clearMessages(),
                  );
            }
          },

          builder: (context, state) {
            final units = _filterUnits(state.units);

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductUnitsBloc>().add(
                      ProductUnitsEvent.load(
                        productId: widget.productId,
                      ),
                    );
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      16, 16, 16, 8,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildSummary(state),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildSearch(),
                    ),
                  ),

                  if (state.isLoading && state.units.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )

                  else if (state.units.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildEmptyState(),
                    )

                  else if (units.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildNoSearchResults(),
                    )

                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        16, 8, 16, 100,
                      ),
                      sliver: SliverList.separated(
                        itemCount: units.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final unit = units[index];

                          return _buildUnitCard(
                            context,
                            unit,
                            state,
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
    );
  }

  // ==========================================
  // SUMMARY
  // ==========================================

  Widget _buildSummary(ProductUnitsState state) {
    final units = state.units;

    final baseCount =
        units.where((unit) => unit.isBaseUnit).length;

    final defaultCount =
        units.where((unit) => unit.isDefault).length;

    final activeCount =
        units.where((unit) => unit.isActive).length;

    return Row(
      children: [
        Expanded(
          child: _summaryItem(
            title: 'إجمالي الوحدات',
            value: units.length.toString(),
            icon: Icons.inventory_2_outlined,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _summaryItem(
            title: 'وحدة الأساس',
            value: baseCount.toString(),
            icon: Icons.scale_outlined,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _summaryItem(
            title: 'النشطة',
            value: activeCount.toString(),
            icon: Icons.check_circle_outline,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _summaryItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ??
            theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 10),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // SEARCH
  // ==========================================

  Widget _buildSearch() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() => _searchQuery = value);
      },
      decoration: InputDecoration(
        hintText: 'ابحث عن وحدة...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                icon: const Icon(Icons.close_rounded),
              )
            : null,
      ),
    );
  }

  // ==========================================
  // UNIT CARD
  // ==========================================

  Widget _buildUnitCard(
    BuildContext context,
    ProductUnit unit,
    ProductUnitsState state,
  ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    Icons.straighten_rounded,
                    color: colors.primary,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.unitName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'معامل التحويل: ${unit.conversionFactor}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                PopupMenuButton<String>(
                  tooltip: 'الخيارات',
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        _openForm(context, unit: unit);
                        break;
                      case 'delete':
                        _confirmDelete(context, unit);
                        break;
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 10),
                          Text('تعديل'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          Text('حذف'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _priceItem(
                    'سعر التكلفة',
                    unit.costPrice,
                    Icons.shopping_cart_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _priceItem(
                    'سعر البيع',
                    unit.salePrice,
                    Icons.sell_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (unit.isBaseUnit)
                  _statusChip(
                    'وحدة الأساس',
                    Colors.green,
                    Icons.check_circle_outline,
                  ),

                if (unit.isDefault)
                  _statusChip(
                    'وحدة البيع الافتراضية',
                    Colors.blue,
                    Icons.star_outline,
                  ),

                _statusChip(
                  unit.isActive ? 'نشطة' : 'غير نشطة',
                  unit.isActive ? Colors.green : Colors.grey,
                  unit.isActive
                      ? Icons.check_circle_outline
                      : Icons.pause_circle_outline,
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 4),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: unit.isBaseUnit ||
                            state.isSettingBase
                        ? null
                        : () => _setBase(context, unit),
                    icon: const Icon(
                      Icons.scale_outlined,
                      size: 18,
                    ),
                    label: Text(
                      unit.isBaseUnit
                          ? 'وحدة الأساس'
                          : 'تعيين كأساس',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: unit.isDefault ||
                            state.isSettingDefault
                        ? null
                        : () => _setDefault(context, unit),
                    icon: const Icon(
                      Icons.star_outline,
                      size: 18,
                    ),
                    label: Text(
                      unit.isDefault
                          ? 'الافتراضية'
                          : 'تعيين افتراضية',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceItem(
    String label,
    double price,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price.toStringAsFixed(2),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(
    String label,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 15),
          const SizedBox(width: 5),
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

  // ==========================================
  // EMPTY STATES
  // ==========================================

  Widget _buildEmptyState() {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.straighten_rounded,
              size: 76,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 18),
            Text(
              'لا توجد وحدات لهذا المنتج',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'أضف وحدة مثل قطعة أو صندوق أو كرتونة',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => _openForm(context),
              icon: const Icon(Icons.add),
              label: const Text('إضافة أول وحدة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoSearchResults() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded, size: 60),
          SizedBox(height: 12),
          Text('لا توجد نتائج مطابقة للبحث'),
        ],
      ),
    );
  }

  // ==========================================
  // FORM
  // ==========================================

  Future<void> _openForm(
    BuildContext context, {
    ProductUnit? unit,
  }) async {
    final result = await showDialog<ProductUnit>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProductUnitFormDialog(
        productId: widget.productId,
        unit: unit,
      ),
    );

    if (!context.mounted || result == null) return;

    final bloc = context.read<ProductUnitsBloc>();

    if (unit == null) {
      bloc.add(
        ProductUnitsEvent.create(unit: result),
      );
    } else {
      bloc.add(
        ProductUnitsEvent.update(
          id: unit.id,
          unit: result,
        ),
      );
    }
  }

  // ==========================================
  // SET BASE
  // ==========================================

  void _setBase(BuildContext context, ProductUnit unit) {
    context.read<ProductUnitsBloc>().add(
          ProductUnitsEvent.setBase(
            productId: widget.productId,
            unitId: unit.id,
          ),
        );
  }

  // ==========================================
  // SET DEFAULT
  // ==========================================

  void _setDefault(BuildContext context, ProductUnit unit) {
    context.read<ProductUnitsBloc>().add(
          ProductUnitsEvent.setDefault(
            productId: widget.productId,
            unitId: unit.id,
          ),
        );
  }

  // ==========================================
  // DELETE
  // ==========================================

  Future<void> _confirmDelete(
    BuildContext context,
    ProductUnit unit,
  ) async {
    final colors = Theme.of(context).colorScheme;

    if (unit.isBaseUnit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يمكن حذف وحدة الأساس قبل تعيين وحدة أساس أخرى'),
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: Icon(
            Icons.delete_outline_rounded,
            color: colors.error,
            size: 35,
          ),
          title: const Text('حذف وحدة المنتج'),
          content: Text(
            'هل أنت متأكد من حذف وحدة "${unit.unitName}"؟',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
              ),
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      context.read<ProductUnitsBloc>().add(
            ProductUnitsEvent.delete(id: unit.id),
          );
    }
  }
}
