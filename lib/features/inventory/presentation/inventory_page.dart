import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_event.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_state.dart';
import 'package:grocery_pos/features/inventory/presentation/stock_movements_page.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InventoryBloc>()..add(const InventoryEvent.started()),
      child: const _InventoryView(),
    );
  }
}

class _InventoryView extends StatelessWidget {
  const _InventoryView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryBloc, InventoryState>(
      listenWhen: (p, c) => p.error != c.error || p.message != c.message,
      listener: (context, state) {
        final text = state.error ?? state.message;
        if (text != null && text.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
        }
      },
      builder: (context, state) {
        final visible = state.lowStockOnly ? state.items.where((e) => e.isLowStock).toList() : state.items;
        return RefreshIndicator(
          onRefresh: () async => context.read<InventoryBloc>().add(const InventoryEvent.refreshed()),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
                sliver: SliverToBoxAdapter(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Row(children: [
                      const Expanded(child: Text('المخزون', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                      IconButton(
                        tooltip: 'سجل الحركات',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StockMovementsPage())),
                        icon: const Icon(Icons.history),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    _Summary(state: state),
                    const SizedBox(height: 12),
                    TextField(
                      onChanged: (v) => context.read<InventoryBloc>().add(InventoryEvent.searchChanged(v)),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'ابحث باسم المنتج أو الباركود',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    FilterChip(
                      selected: state.lowStockOnly,
                      avatar: const Icon(Icons.warning_amber_rounded),
                      label: Text('الناقص فقط (${state.summary.lowStockCount})'),
                      onSelected: (_) => context.read<InventoryBloc>().add(const InventoryEvent.lowStockToggled()),
                    ),
                    if (state.loading) const Padding(padding: EdgeInsets.only(top: 8), child: LinearProgressIndicator()),
                  ]),
                ),
              ),
              if (visible.isEmpty && !state.loading)
                const SliverFillRemaining(hasScrollBody: false, child: Center(child: Text('لا توجد منتجات')))
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 90),
                  sliver: SliverList.separated(
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => _InventoryCard(item: visible[index]),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Summary extends StatelessWidget {
  final InventoryState state;
  const _Summary({required this.state});

  @override
  Widget build(BuildContext context) {
    final s = state.summary;
    return Wrap(spacing: 8, runSpacing: 8, children: [
      _Stat(label: 'المنتجات', value: '${s.productsCount}', icon: Icons.inventory_2_outlined),
      _Stat(label: 'منخفض', value: '${s.lowStockCount}', icon: Icons.warning_amber_rounded),
      _Stat(label: 'الوحدات', value: s.totalUnits.toStringAsFixed(0), icon: Icons.layers_outlined),
      _Stat(label: 'قيمة التكلفة', value: '${s.stockCostValue.toStringAsFixed(2)} د.ل', icon: Icons.payments_outlined),
    ]);
  }
}

class _Stat extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _Stat({required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 165,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [Icon(icon), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]))]),
          ),
        ),
      );
}

class _InventoryCard extends StatelessWidget {
  final InventoryItem item;
  const _InventoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Icon(item.isLowStock ? Icons.warning_amber_rounded : Icons.check_circle_outline),
            const SizedBox(width: 8),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text('باركود: ${item.barcode}'),
            ])),
            // ignore: unnecessary_string_interpolations
            Text('${item.quantity.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ]),
          const SizedBox(height: 8),
          Text('حد التنبيه: ${item.minStock.toStringAsFixed(2)} • قيمة التكلفة: ${item.stockCostValue.toStringAsFixed(2)} د.ل'),
          const SizedBox(height: 8),
          Wrap(spacing: 6, runSpacing: 6, children: [
            OutlinedButton.icon(onPressed: () => _adjust(context, item, true), icon: const Icon(Icons.add), label: const Text('إضافة')),
            OutlinedButton.icon(onPressed: () => _adjust(context, item, false), icon: const Icon(Icons.remove), label: const Text('خصم')),
            OutlinedButton.icon(onPressed: () => _count(context, item), icon: const Icon(Icons.fact_check_outlined), label: const Text('جرد')),
            OutlinedButton.icon(onPressed: () => _minStock(context, item), icon: const Icon(Icons.notifications_active_outlined), label: const Text('حد النقص')),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => StockMovementsPage(productId: item.id, productName: item.name))),
              icon: const Icon(Icons.history),
              label: const Text('الحركات'),
            ),
          ]),
        ]),
      ),
    );
  }

  Future<void> _adjust(BuildContext context, InventoryItem item, bool add) async {
    final qty = TextEditingController();
    final note = TextEditingController();
    final result = await showDialog<(double, String)?>(context: context, builder: (dctx) => AlertDialog(
      title: Text('${add ? 'إضافة' : 'خصم'} مخزون • ${item.name}'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: qty, autofocus: true, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'الكمية')),
        TextField(controller: note, decoration: const InputDecoration(labelText: 'ملاحظة / المورد / السبب')),
      ]),
      actions: [TextButton(onPressed: () => Navigator.pop(dctx), child: const Text('إلغاء')), FilledButton(onPressed: () {
        final q = double.tryParse(qty.text.replaceAll(',', '.'));
        if (q == null || q <= 0) return;
        Navigator.pop(dctx, (add ? q : -q, note.text));
      }, child: const Text('حفظ'))],
    ));
    if (result == null || !context.mounted) return;
    context.read<InventoryBloc>().add(InventoryEvent.adjusted(productId: item.id, delta: result.$1, note: result.$2));
  }

  Future<void> _count(BuildContext context, InventoryItem item) async {
    final qty = TextEditingController(text: item.quantity.toStringAsFixed(2));
    final note = TextEditingController(text: 'جرد فعلي');
    final result = await showDialog<(double, String)?>(context: context, builder: (dctx) => AlertDialog(
      title: Text('جرد ${item.name}'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: qty, autofocus: true, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'الكمية الفعلية')),
        TextField(controller: note, decoration: const InputDecoration(labelText: 'ملاحظة')),
      ]),
      actions: [TextButton(onPressed: () => Navigator.pop(dctx), child: const Text('إلغاء')), FilledButton(onPressed: () {
        final q = double.tryParse(qty.text.replaceAll(',', '.'));
        if (q == null || q < 0) return;
        Navigator.pop(dctx, (q, note.text));
      }, child: const Text('اعتماد الجرد'))],
    ));
    if (result == null || !context.mounted) return;
    context.read<InventoryBloc>().add(InventoryEvent.stockSet(productId: item.id, quantity: result.$1, note: result.$2));
  }

  Future<void> _minStock(BuildContext context, InventoryItem item) async {
    final c = TextEditingController(text: item.minStock.toStringAsFixed(2));
    final value = await showDialog<double?>(context: context, builder: (dctx) => AlertDialog(
      title: Text('حد تنبيه ${item.name}'),
      content: TextField(controller: c, autofocus: true, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'نبهني عند وصول الكمية إلى')),
      actions: [TextButton(onPressed: () => Navigator.pop(dctx), child: const Text('إلغاء')), FilledButton(onPressed: () {
        final q = double.tryParse(c.text.replaceAll(',', '.'));
        if (q == null || q < 0) return;
        Navigator.pop(dctx, q);
      }, child: const Text('حفظ'))],
    ));
    if (value == null || !context.mounted) return;
    context.read<InventoryBloc>().add(InventoryEvent.minStockChanged(productId: item.id, minStock: value));
  }
}
