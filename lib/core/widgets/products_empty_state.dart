
import 'package:flutter/material.dart';

class ProductsEmptyState extends StatelessWidget {
  final bool searching;
  final VoidCallback onAdd;

  const ProductsEmptyState({
    super.key,
    required this.searching,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(30),
              ),

              child: Icon(
                searching
                    ? Icons.search_off_rounded
                    : Icons.inventory_2_outlined,

                size: 48,
                color: scheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              searching
                  ? 'لم يتم العثور على منتج'
                  : 'لا توجد منتجات حتى الآن',

              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: scheme.onSurface,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              searching
                  ? 'جرّب البحث باسم أو باركود آخر'
                  : 'ابدأ بإضافة أول منتج إلى مخزونك',

              textAlign: TextAlign.center,

              style: TextStyle(
                color: scheme.onSurfaceVariant,
                fontSize: 13,
              ),
            ),

            if (!searching) ...[
              const SizedBox(height: 22),

              FilledButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_rounded),
                label: const Text('إضافة أول منتج'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
