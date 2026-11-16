
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

class InventorySearch extends StatelessWidget {
  const InventorySearch({
    super.key,
    required this.state,
  });

  final InventoryState state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (value) {
            context.read<InventoryBloc>().add(
              InventoryEvent.searchChanged(value),
            );
          },
          decoration: InputDecoration(
            hintText: 'ابحث عن منتج أو امسح الباركود...',
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: state.query.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      context.read<InventoryBloc>().add(
                        const InventoryEvent.searchChanged(''),
                      );
                    },
                    icon: const Icon(Icons.close_rounded),
                  )
                : const Icon(Icons.qr_code_scanner_rounded),
            filled: true,
            fillColor: colors.surface,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilterChip(
                selected: state.lowStockOnly,
                onSelected: (_) {
                  context.read<InventoryBloc>().add(
                    const InventoryEvent.lowStockToggled(),
                  );
                },
                avatar: Icon(
                  Icons.warning_amber_rounded,
                  color: state.lowStockOnly
                      ? colors.onSecondaryContainer
                      : colors.tertiary,
                  size: 18,
                ),
                label: const Text('المخزون المنخفض فقط'),
                showCheckmark: false,
              ),
            ),
            if (state.isLoading)
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
