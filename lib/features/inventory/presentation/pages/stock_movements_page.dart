import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';

import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

import '../movements/movement_card.dart';
import '../movements/movement_empty_state.dart';
import '../movements/movements_summary.dart';
import '../widgets/inventory_empty_state.dart';
import '../widgets/stock_movement_tile.dart';

class StockMovementsPage extends StatelessWidget {
  const StockMovementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InventoryBloc>()
        ..add(const InventoryEvent.started()),
      child: const _StockMovementsView(),
    );
  }
}

class _StockMovementsView extends StatelessWidget {
  const _StockMovementsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حركات المخزون'),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            onPressed: () {
              context.read<InventoryBloc>().add(
                    const InventoryEvent.refreshRequested(),
                  );
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<InventoryBloc>().add(
                      const InventoryEvent.refreshRequested(),
                    );
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(18),
                children: [
                  _buildFilters(context, state),

                  const SizedBox(height: 20),
                  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    MovementsSummary(
      movements: state.movements,
    ),

    const SizedBox(height: 22),

    if (state.movements.isEmpty)
      const MovementEmptyState()
    else
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.movements.length,
        itemBuilder: (context, index) {
          final movement = state.movements[index];

          return MovementCard(
            movement: movement,
          );
        },
      ),
  ],
),


                    const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'سجل العمليات',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '${state.movements.length} حركة',
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  if (state.isLoading && state.movements.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state.movements.isEmpty)
                    const InventoryEmptyState(
                      title: 'لا توجد حركات',
                      message: 'لم يتم تسجيل أي حركة للمخزون.',
                      icon: Icons.history_rounded,
                    )
                  else
                    ...state.movements.map(
                      (movement) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: StockMovementTile(
                          movement: movement,
                        ),
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

  Widget _buildFilters(
    BuildContext context,
    InventoryState state,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تصفية الحركات',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<int?>(
              initialValue: state.selectedProductId,
              decoration: const InputDecoration(
                labelText: 'المنتج',
                prefixIcon: Icon(Icons.inventory_2_outlined),
              ),
              items: [
                const DropdownMenuItem<int?>(
                  value: null,
                  child: Text('جميع المنتجات'),
                ),
                // يمكن إضافة قائمة المنتجات هنا لاحقًا
                // باستخدام state.inventory.
                ...state.inventory.map(
                  (product) => DropdownMenuItem<int?>(
                    value: product.id,
                    child: Text(product.name),
                  ),
                ),
              ],
              onChanged: (productId) {
                context.read<InventoryBloc>().add(
                      InventoryEvent.movementsFilterChanged(
                        productId: productId,
                        limit: state.movementsLimit,
                      ),
                    );
              },
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<int>(
              initialValue: state.movementsLimit,
              decoration: const InputDecoration(
                labelText: 'عدد الحركات',
                prefixIcon: Icon(Icons.format_list_numbered),
              ),
              items: const [
                DropdownMenuItem(
                  value: 20,
                  child: Text('20 حركة'),
                ),
                DropdownMenuItem(
                  value: 50,
                  child: Text('50 حركة'),
                ),
                DropdownMenuItem(
                  value: 100,
                  child: Text('100 حركة'),
                ),
                DropdownMenuItem(
                  value: 200,
                  child: Text('200 حركة'),
                ),
                DropdownMenuItem(
                  value: 500,
                  child: Text('500 حركة'),
                ),
              ],
              onChanged: (limit) {
                if (limit == null) return;

                context.read<InventoryBloc>().add(
                      InventoryEvent.movementsFilterChanged(
                        productId: state.selectedProductId,
                        limit: limit,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}