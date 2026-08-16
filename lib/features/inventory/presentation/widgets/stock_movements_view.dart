import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';

class StockMovementsView extends StatelessWidget {
  final String? productName;
  final List<StockMovementEntity> items;
  final bool loading;
  final String? error;
  final Future<void> Function() onRefresh;

  const StockMovementsView({
    super.key,
    required this.productName,
    required this.items,
    required this.loading,
    required this.error,
    required this.onRefresh,
  });

  String _typeLabel(String type) => switch (type) {
        'sale' => 'بيع',
        'return' => 'مرتجع',
        'purchase' => 'توريد',
        'count' => 'جرد',
        _ => 'تسوية',
      };

  IconData _typeIcon(String type) => switch (type) {
        'sale' => Icons.shopping_cart_checkout_rounded,
        'return' => Icons.assignment_return_rounded,
        'purchase' => Icons.local_shipping_outlined,
        'count' => Icons.fact_check_outlined,
        _ => Icons.tune_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(
          productName == null
              ? 'حركات المخزون'
              : 'حركات $productName',
        ),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            onPressed: loading ? null : onRefresh,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
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

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    padding,
                    compact ? 10 : 16,
                    padding,
                    12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _MovementsHeader(
                        productName: productName,
                        items: items,
                        compact: compact,
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: _body(
                          context,
                          compact: compact,
                          medium: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _body(
    BuildContext context, {
    required bool compact,
    required bool medium,
  }) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return _MessageState(
        icon: Icons.error_outline_rounded,
        title: 'تعذر تحميل الحركات',
        message: error!,
        action: FilledButton.icon(
          onPressed: onRefresh,
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('إعادة المحاولة'),
        ),
      );
    }

    if (items.isEmpty) {
      return const _MessageState(
        icon: Icons.history_rounded,
        title: 'لا توجد حركات مخزون',
        message: 'ستظهر حركات البيع والتوريد والجرد هنا',
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: compact
          ? ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 9),
              itemBuilder: (_, index) => StockMovementCard(
                movement: items[index],
                typeLabel: _typeLabel(items[index].type),
                typeIcon: _typeIcon(items[index].type),
              ),
            )
          : GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: medium ? 520 : 560,
                mainAxisExtent: 170,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (_, index) => StockMovementCard(
                movement: items[index],
                typeLabel: _typeLabel(items[index].type),
                typeIcon: _typeIcon(items[index].type),
              ),
            ),
    );
  }
}

class _MovementsHeader extends StatelessWidget {
  final String? productName;
  final List<StockMovementEntity> items;
  final bool compact;

  const _MovementsHeader({
    required this.productName,
    required this.items,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final incoming = items.where((e) => e.quantity > 0).length;
    final outgoing = items.where((e) => e.quantity < 0).length;

    return Container(
      padding: EdgeInsets.all(compact ? 13 : 16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            color: scheme.primary,
            size: compact ? 28 : 34,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 150),
            child: Text(
              productName ?? 'سجل حركات المخزون',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: compact ? 19 : 23,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _Counter(label: 'الحركات', value: items.length),
          _Counter(label: 'داخل', value: incoming),
          _Counter(label: 'خارج', value: outgoing),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  final String label;
  final int value;

  const _Counter({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Chip(
      avatar: Icon(Icons.circle, size: 10, color: scheme.primary),
      label: Text('$label: $value'),
    );
  }
}

class StockMovementCard extends StatelessWidget {
  final StockMovementEntity movement;
  final String typeLabel;
  final IconData typeIcon;

  const StockMovementCard({
    super.key,
    required this.movement,
    required this.typeLabel,
    required this.typeIcon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final positive = movement.quantity >= 0;
    final background =
        positive ? scheme.primaryContainer : scheme.errorContainer;
    final foreground = positive
        ? scheme.onPrimaryContainer
        : scheme.onErrorContainer;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(typeIcon, color: foreground),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movement.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  Text(typeLabel),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat('yyyy/MM/dd HH:mm')
                        .format(movement.createdAt),
                    style:
                        TextStyle(color: scheme.onSurfaceVariant),
                  ),
                  if ((movement.note ?? '').isNotEmpty)
                    Text(
                      movement.note!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if ((movement.reference ?? '').isNotEmpty)
                    Text(
                      'مرجع: ${movement.reference}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(13),
              ),
              child: FittedBox(
                child: Text(
                  '${positive ? '+' : ''}'
                  '${movement.quantity.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: foreground,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  const _MessageState({
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(icon, size: 68, color: scheme.outline),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
