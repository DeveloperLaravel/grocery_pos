import 'package:flutter/material.dart';

import '../../cashier_shifts/domain/entities/product_entity.dart';
import 'pos_product_card.dart';

class PosProductGrid extends StatelessWidget {
  const PosProductGrid({
    super.key,
    required this.products,
    required this.onAddProduct,
    this.isLoading = false,
  });

  final List<ProductEntity> products;
  final ValueChanged<ProductEntity> onAddProduct;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading && products.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (products.isEmpty) {
      return const _EmptyProducts();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = switch (width) {
          < 350 => 1,
          < 600 => 2,
          < 900 => 3,
          < 1200 => 4,
          < 1600 => 5,
          _ => 6,
        };

        return GridView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(3),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: width < 450 ? 0.82 : 0.88,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return PosProductCard(
              product: product,
              onAdd: product.quantity > 0 ? () => onAddProduct(product) : null,
            );
          },
        );
      },
    );
  }
}

class _EmptyProducts extends StatelessWidget {
  const _EmptyProducts();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 58,
            color: colors.outline,
          ),
          const SizedBox(height: 12),
          Text(
            'لا توجد منتجات',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'لم يتم العثور على منتجات مطابقة للبحث',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
