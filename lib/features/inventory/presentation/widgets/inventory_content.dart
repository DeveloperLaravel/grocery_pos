import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';
import 'package:grocery_pos/features/inventory/presentation/pages/stock_movements_page.dart';
import 'package:grocery_pos/features/inventory/presentation/widgets/inventory_dialogs.dart';
import 'package:grocery_pos/features/inventory/presentation/widgets/inventory_summary.dart';

import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

class InventoryContent extends StatelessWidget {
  final InventoryState state;
  final Future<void> Function() onRefresh;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onLowStockToggled;

  const InventoryContent({
    super.key,
    required this.state,
    required this.onRefresh,
    required this.onSearchChanged,
    required this.onLowStockToggled,
  });

  @override
  Widget build(BuildContext context) {
    final visible = state.lowStockOnly
        ? state.items.where((e) => e.isLowStock).toList()
        : state.items;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final compact = width < 700;
        final medium = width >= 700 && width < 1100;
        final padding = width < 380
            ? 8.0
            : compact
                ? 12.0
                : medium
                    ? 18.0
                    : 24.0;

        return RefreshIndicator(
          onRefresh: onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  padding,
                  compact ? 12 : 18,
                  padding,
                  10,
                ),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 1400),
                      child: _Header(
                        state: state,
                        compact: compact,
                        onSearchChanged: onSearchChanged,
                        onLowStockToggled: onLowStockToggled,
                      ),
                    ),
                  ),
                ),
              ),
              if (state.loading)
                const SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                ),
              if (visible.isEmpty && !state.loading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: _EmptyInventory(),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    padding,
                    4,
                    padding,
                    80,
                  ),
                  sliver: SliverLayoutBuilder(
                    builder: (context, sliverConstraints) {
                      if (compact) {
                        return SliverList.separated(
                          itemCount: visible.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) =>
                              InventoryCard(item: visible[index]),
                        );
                      }

                      return SliverGrid(
                        gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: medium ? 520 : 560,
                          mainAxisExtent: 230,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              InventoryCard(item: visible[index]),
                          childCount: visible.length,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final InventoryState state;
  final bool compact;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onLowStockToggled;

  const _Header({
    required this.state,
    required this.compact,
    required this.onSearchChanged,
    required this.onLowStockToggled,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              width: compact ? 44 : 52,
              height: compact ? 44 : 52,
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.warehouse_rounded,
                color: scheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'المخزون',
                style: TextStyle(
                  fontSize: compact ? 23 : 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton.filledTonal(
              tooltip: 'سجل الحركات',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StockMovementsPage(),
                ),
              ),
              icon: const Icon(Icons.history_rounded),
            ),
          ],
        ),
        const SizedBox(height: 14),
        InventorySummary(state: state),
        const SizedBox(height: 14),
        TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_rounded),
            hintText: 'ابحث باسم المنتج أو الباركود',
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: FilterChip(
            selected: state.lowStockOnly,
            avatar: const Icon(Icons.warning_amber_rounded),
            label:
                Text('الناقص فقط (${state.summary.lowStockCount})'),
            onSelected: (_) => onLowStockToggled(),
          ),
        ),
      ],
    );
  }
}

class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  item.isLowStock
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                  color: item.isLowStock
                      ? scheme.error
                      : scheme.primary,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'باركود: ${item.barcode}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                FittedBox(
                  child: Text(
                    item.quantity.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'حد التنبيه: ${item.minStock.toStringAsFixed(2)}  •  '
              'قيمة التكلفة: ${item.stockCostValue.toStringAsFixed(2)} د.ل',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _adjust(context, true),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('إضافة'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _adjust(context, false),
                  icon: const Icon(Icons.remove_rounded),
                  label: const Text('خصم'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _count(context),
                  icon: const Icon(Icons.fact_check_outlined),
                  label: const Text('جرد'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _minStock(context),
                  icon:
                      const Icon(Icons.notifications_active_outlined),
                  label: const Text('حد النقص'),
                ),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => StockMovementsPage(
                        productId: item.id,
                        productName: item.name,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.history_rounded),
                  label: const Text('الحركات'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _adjust(BuildContext context, bool add) async {
    final result =
        await InventoryDialogs.showAdjustment(context, item, add);
    if (result == null || !context.mounted) return;

    context.read<InventoryBloc>().add(
          InventoryEvent.adjusted(
            productId: item.id,
            delta: result.$1,
            note: result.$2,
          ),
        );
  }

  Future<void> _count(BuildContext context) async {
    final result = await InventoryDialogs.showCount(context, item);
    if (result == null || !context.mounted) return;

    context.read<InventoryBloc>().add(
          InventoryEvent.stockSet(
            productId: item.id,
            quantity: result.$1,
            note: result.$2,
          ),
        );
  }

  Future<void> _minStock(BuildContext context) async {
    final value =
        await InventoryDialogs.showMinStock(context, item);
    if (value == null || !context.mounted) return;

    context.read<InventoryBloc>().add(
          InventoryEvent.minStockChanged(
            productId: item.id,
            minStock: value,
          ),
        );
  }
}

class _EmptyInventory extends StatelessWidget {
  const _EmptyInventory();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 68,
              color: scheme.outline,
            ),
            const SizedBox(height: 12),
            const Text(
              'لا توجد منتجات',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
