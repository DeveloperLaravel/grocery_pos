
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/get_stock_movements.dart';

class StockMovementsPage extends StatefulWidget {
  final int? productId;
  final String? productName;

  const StockMovementsPage({
    super.key,
    this.productId,
    this.productName,
  });

  @override
  State<StockMovementsPage> createState() =>
      _StockMovementsPageState();
}

class _StockMovementsPageState
    extends State<StockMovementsPage> {
  bool loading = true;
  String? error;
  List<StockMovementEntity> items = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (mounted) {
      setState(() {
        loading = true;
        error = null;
      });
    }

    final result = await getIt<GetStockMovements>()(
      productId: widget.productId,
    ).run();

    if (!mounted) return;

    result.match(
      (failure) {
        setState(() {
          loading = false;
          error = failure.message;
        });
      },
      (data) {
        setState(() {
          loading = false;
          items = data;
          error = null;
        });
      },
    );
  }

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
          widget.productName == null
              ? 'حركات المخزون'
              : 'حركات ${widget.productName}',
        ),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            onPressed: loading ? null : _load,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final veryCompact = width < 380;
            final compact = width < 700;
            final medium = width >= 700 && width < 1100;

            final horizontalPadding = veryCompact
                ? 8.0
                : compact
                    ? 12.0
                    : medium
                        ? 18.0
                        : 24.0;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1400,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    compact ? 10 : 16,
                    horizontalPadding,
                    12,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(
                        context,
                        compact: compact,
                        veryCompact: veryCompact,
                      ),

                      SizedBox(
                        height: compact ? 10 : 14,
                      ),

                      Expanded(
                        child: _buildBody(
                          context,
                          compact: compact,
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
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required bool compact,
    required bool veryCompact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    final incoming =
        items.where((e) => e.quantity > 0).length;
    final outgoing =
        items.where((e) => e.quantity < 0).length;

    return Container(
      padding: EdgeInsets.all(
        veryCompact ? 11 : compact ? 13 : 16,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(
          compact ? 18 : 22,
        ),
        border: Border.all(
          color: scheme.outlineVariant,
        ),
      ),
      child: compact
          ? Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    _headerIcon(
                      context,
                      compact: true,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _headerText(
                        context,
                        compact: true,
                        veryCompact: veryCompact,
                      ),
                    ),
                  ],
                ),
                if (!veryCompact) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _MiniStat(
                          label: 'الحركات',
                          value: '${items.length}',
                          icon: Icons.history_rounded,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _MiniStat(
                          label: 'داخل',
                          value: '$incoming',
                          icon: Icons.arrow_downward_rounded,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _MiniStat(
                          label: 'خارج',
                          value: '$outgoing',
                          icon: Icons.arrow_upward_rounded,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            )
          : Row(
              children: [
                _headerIcon(
                  context,
                  compact: false,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _headerText(
                    context,
                    compact: false,
                    veryCompact: false,
                  ),
                ),
                const SizedBox(width: 12),
                _MiniStat(
                  label: 'الحركات',
                  value: '${items.length}',
                  icon: Icons.history_rounded,
                ),
                const SizedBox(width: 8),
                _MiniStat(
                  label: 'داخل',
                  value: '$incoming',
                  icon: Icons.arrow_downward_rounded,
                ),
                const SizedBox(width: 8),
                _MiniStat(
                  label: 'خارج',
                  value: '$outgoing',
                  icon: Icons.arrow_upward_rounded,
                ),
              ],
            ),
    );
  }

  Widget _headerIcon(
    BuildContext context, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: compact ? 44 : 52,
      height: compact ? 44 : 52,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.history_rounded,
        color: scheme.onPrimaryContainer,
        size: compact ? 24 : 28,
      ),
    );
  }

  Widget _headerText(
    BuildContext context, {
    required bool compact,
    required bool veryCompact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productName == null
              ? 'سجل حركات المخزون'
              : widget.productName!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize:
                veryCompact ? 18 : compact ? 20 : 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        if (!veryCompact) ...[
          const SizedBox(height: 2),
          Text(
            widget.productName == null
                ? 'متابعة البيع والتوريد والجرد والتسويات'
                : 'كل الحركات الخاصة بهذا المنتج',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: compact ? 11 : 13,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required bool compact,
    required bool veryCompact,
    required bool medium,
  }) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
      return _ErrorState(
        message: error!,
        onRetry: _load,
      );
    }

    if (items.isEmpty) {
      return const _EmptyState();
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: compact
          ? ListView.separated(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: veryCompact ? 8 : 16,
              ),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: veryCompact ? 7 : 9),
              itemBuilder: (context, index) {
                return _MovementCard(
                  movement: items[index],
                  typeLabel: _typeLabel(
                    items[index].type,
                  ),
                  typeIcon: _typeIcon(
                    items[index].type,
                  ),
                  compact: true,
                  veryCompact: veryCompact,
                );
              },
            )
          : GridView.builder(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              gridDelegate:
                  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    medium ? 520 : 560,
                mainAxisExtent: 170,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _MovementCard(
                  movement: items[index],
                  typeLabel: _typeLabel(
                    items[index].type,
                  ),
                  typeIcon: _typeIcon(
                    items[index].type,
                  ),
                  compact: false,
                  veryCompact: false,
                );
              },
            ),
    );
  }
}

class _MovementCard extends StatelessWidget {
  final StockMovementEntity movement;
  final String typeLabel;
  final IconData typeIcon;
  final bool compact;
  final bool veryCompact;

  const _MovementCard({
    required this.movement,
    required this.typeLabel,
    required this.typeIcon,
    required this.compact,
    required this.veryCompact,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final positive = movement.quantity >= 0;

    final accent = positive
        ? scheme.primary
        : scheme.error;

    final softBackground = positive
        ? scheme.primaryContainer
        : scheme.errorContainer;

    final date = DateFormat(
      'yyyy/MM/dd HH:mm',
    ).format(movement.createdAt);

    return Container(
      padding: EdgeInsets.all(
        veryCompact ? 10 : compact ? 12 : 14,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(
          compact ? 16 : 18,
        ),
        border: Border.all(
          color: scheme.outlineVariant,
        ),
      ),
      child: compact
          ? Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    _movementIcon(
                      accent,
                      softBackground,
                      compact: true,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _mainInfo(
                        context,
                        compact: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _quantityBadge(
                      context,
                      positive,
                      compact: true,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _details(
                  context,
                  date,
                  compact: true,
                ),
              ],
            )
          : Row(
              children: [
                _movementIcon(
                  accent,
                  softBackground,
                  compact: false,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      _mainInfo(
                        context,
                        compact: false,
                      ),
                      const SizedBox(height: 8),
                      _details(
                        context,
                        date,
                        compact: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _quantityBadge(
                  context,
                  positive,
                  compact: false,
                ),
              ],
            ),
    );
  }

  Widget _movementIcon(
    Color accent,
    Color background, {
    required bool compact,
  }) {
    return Container(
      width: compact ? 44 : 50,
      height: compact ? 44 : 50,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        typeIcon,
        color: accent,
        size: compact ? 22 : 25,
      ),
    );
  }

  Widget _mainInfo(
    BuildContext context, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movement.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: compact ? 15 : 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(
              Icons.sell_outlined,
              size: compact ? 15 : 16,
              color: scheme.onSurfaceVariant,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                typeLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 11 : 13,
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _details(
    BuildContext context,
    String date, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        compact ? 9 : 10,
      ),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailRow(
            icon: Icons.schedule_rounded,
            text: date,
            compact: compact,
          ),
          if ((movement.note ?? '').isNotEmpty) ...[
            const SizedBox(height: 5),
            _DetailRow(
              icon: Icons.notes_rounded,
              text: movement.note!,
              compact: compact,
            ),
          ],
          if ((movement.reference ?? '').isNotEmpty) ...[
            const SizedBox(height: 5),
            _DetailRow(
              icon: Icons.tag_rounded,
              text: 'مرجع: ${movement.reference}',
              compact: compact,
            ),
          ],
        ],
      ),
    );
  }

  Widget _quantityBadge(
    BuildContext context,
    bool positive, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    final background = positive
        ? scheme.primaryContainer
        : scheme.errorContainer;

    final foreground = positive
        ? scheme.onPrimaryContainer
        : scheme.onErrorContainer;

    return Container(
      constraints: BoxConstraints(
        minWidth: compact ? 70 : 86,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 9 : 11,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            positive
                ? Icons.add_rounded
                : Icons.remove_rounded,
            color: foreground,
            size: compact ? 18 : 20,
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${positive ? '+' : ''}${movement.quantity.toStringAsFixed(2)}',
              style: TextStyle(
                color: foreground,
                fontSize: compact ? 15 : 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool compact;

  const _DetailRow({
    required this.icon,
    required this.text,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: compact ? 14 : 15,
          color: scheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: compact ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: compact ? 11 : 12,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 92,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: scheme.primary,
          ),
          const SizedBox(width: 7),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .18,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.history_rounded,
                      size: 42,
                      color: scheme.primary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'لا توجد حركات مخزون',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'ستظهر حركات البيع والتوريد والجرد هنا',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 460,
          ),
          child: Column(
            children: [
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  color: scheme.errorContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 38,
                  color: scheme.error,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'تعذر تحميل الحركات',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
