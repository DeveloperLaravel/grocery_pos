
import 'package:flutter/material.dart';

import '../../../../core/widgets/products_empty_state.dart';
import '../../domain/entities/product.dart';
import '../cubit/products_state.dart';

import 'product_card.dart';

class ProductsContent extends StatelessWidget {
  final ProductsState state;
  final List<Product> products;

  final bool compact;
  final bool veryCompact;

  final ValueChanged<Product> onEdit;
  final ValueChanged<Product> onDelete;
  final VoidCallback onAdd;

  const ProductsContent({
    super.key,
    required this.state,
    required this.products,
    required this.compact,
    required this.veryCompact,
    required this.onEdit,
    required this.onDelete,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.products.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (products.isEmpty) {
      return ProductsEmptyState(
        searching: state.searchQuery.isNotEmpty,
        onAdd: onAdd,
      );
    }

    if (compact) {
      return ListView.separated(
        keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,

        itemCount: products.length,

        separatorBuilder: (_, __) =>
            const SizedBox(height: 10),

        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            compact: true,
            veryCompact: veryCompact,
            onEdit: () => onEdit(products[index]),
            onDelete: () => onDelete(products[index]),
          );
        },
      );
    }

    return GridView.builder(
      keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,

      gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 430,
        mainAxisExtent: 190,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),

      itemCount: products.length,

      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          compact: false,
          veryCompact: false,
          onEdit: () => onEdit(products[index]),
          onDelete: () => onDelete(products[index]),
        );
      },
    );
  }
}
