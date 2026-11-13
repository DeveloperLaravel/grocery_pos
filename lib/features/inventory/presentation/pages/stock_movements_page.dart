
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_event.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_state.dart';

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

class _StockMovementsPageState extends State<StockMovementsPage> {
  // static const Color primary = Color(0xFF1565C0);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<InventoryBloc>().add(
            InventoryEvent.movementsFilterChanged(
              productId: widget.productId,
              limit: 100,
            ),
          );
    });
  }

  void _refresh() {
    context.read<InventoryBloc>().add(
          InventoryEvent.movementsFilterChanged(
            productId: widget.productId,
            limit: 100,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.productName == null
        ? 'حركات المخزون'
        : 'حركات ${widget.productName}';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'تحديث الحركات',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          final movements = state.movements;

          if (state.isLoading && movements.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              _refresh();
              await context.read<InventoryBloc>().stream.firstWhere(
                    (state) => !state.isLoading,
                  );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: _MovementsSummary(
                      movements: movements,
                    ),
                  ),
                ),
                if (state.errorMessage != null && movements.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _MovementsError(
                      message: state.errorMessage!,
                      onRetry: _refresh,
                    ),
                  )
                else if (movements.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _MovementsEmpty(),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    sliver: SliverList.separated(
                      itemCount: movements.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return _MovementCard(
                          movement: movements[index],
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// Summary
// ============================================================

class _MovementsSummary extends StatelessWidget {
  final List<StockMovement> movements;

  const _MovementsSummary({
    required this.movements,
  });

  @override
  Widget build(BuildContext context) {
    final incoming = movements
        .where((movement) => movement.isIncoming)
        .fold<double>(0, (sum, movement) => sum + movement.quantity);

    final outgoing = movements
        .where((movement) => movement.isOutgoing)
        .fold<double>(0, (sum, movement) => sum + movement.quantity);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ملخص الحركات',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _MovementStat(
                  title: 'الوارد',
                  value: _formatQuantity(incoming),
                  icon: Icons.arrow_downward_rounded,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MovementStat(
                  title: 'الصادر',
                  value: _formatQuantity(outgoing),
                  icon: Icons.arrow_upward_rounded,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MovementStat(
                  title: 'عدد الحركات',
                  value: '${movements.length}',
                  icon: Icons.swap_vert_rounded,
                  color: const Color(0xFF1565C0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatQuantity(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _MovementStat extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MovementStat({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 21),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// Movement card
// ============================================================

class _MovementCard extends StatelessWidget {
  final StockMovement movement;

  const _MovementCard({
    required this.movement,
  });

  @override
  Widget build(BuildContext context) {
    final incoming = movement.isIncoming;
    final color = incoming ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  incoming
                      ? Icons.arrow_downward_rounded
                      : Icons.arrow_upward_rounded,
                  color: color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _movementType(movement.type),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(movement.createdAt),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${incoming ? '+' : '-'}${_formatQuantity(movement.quantity)}',
                style: TextStyle(
                  color: color,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (movement.reference != null ||
              movement.note != null) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 10),
            if (movement.reference != null)
              _MovementDetail(
                icon: Icons.receipt_long_outlined,
                text: 'المرجع: ${movement.reference}',
              ),
            if (movement.note != null)
              _MovementDetail(
                icon: Icons.notes_rounded,
                text: movement.note!,
              ),
          ],
        ],
      ),
    );
  }

  String _movementType(String type) {
    switch (type) {
      case 'in':
        return 'إضافة مخزون';
      case 'out':
        return 'إخراج مخزون';
      case 'sale':
        return 'عملية بيع';
      case 'return':
        return 'مرتجع';
      default:
        return 'حركة مخزون';
    }
  }

  String _formatQuantity(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();

    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year;

    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');

    return '$day/$month/$year - $hour:$minute';
  }
}

class _MovementDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MovementDetail({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Empty and error
// ============================================================

class _MovementsEmpty extends StatelessWidget {
  const _MovementsEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 14),
            const Text(
              'لا توجد حركات مخزون',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ستظهر هنا جميع عمليات الإضافة والإخراج والبيع والمرتجعات',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovementsError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _MovementsError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
