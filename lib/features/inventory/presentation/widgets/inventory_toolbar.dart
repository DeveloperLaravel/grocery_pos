import 'package:flutter/material.dart';

class InventoryToolbar extends StatelessWidget {
  const InventoryToolbar({
    super.key,
    required this.query,
    required this.onSearchChanged,
    required this.lowStockOnly,
    required this.onLowStockChanged,
    required this.onClear,
  });

  final String query;
  final ValueChanged<String> onSearchChanged;
  final bool lowStockOnly;
  final VoidCallback onLowStockChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        final search = TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'ابحث باسم المنتج أو الباركود...',
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: query.isNotEmpty
                ? IconButton(
                    onPressed: onClear,
                    icon: const Icon(Icons.close_rounded),
                  )
                : null,
            filled: true,
            fillColor: colors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
          ),
        );

        final filter = FilterChip(
          selected: lowStockOnly,
          onSelected: (_) => onLowStockChanged(),
          avatar: Icon(
            Icons.warning_amber_rounded,
            size: 18,
            color: lowStockOnly
                ? colors.onSecondaryContainer
                : colors.onSurfaceVariant,
          ),
          label: const Text('منخفض المخزون'),
          showCheckmark: true,
        );

        if (mobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              search,
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: filter,
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: search),
            const SizedBox(width: 12),
            filter,
          ],
        );
      },
    );
  }
}