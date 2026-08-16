import 'package:flutter/material.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductEntity> products;
  final void Function(ProductEntity) onTap;
  const ProductGrid({super.key, required this.products, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const Center(child: Text('لا توجد منتجات'));
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 210,
        mainAxisExtent: 145,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        final out = p.quantity <= 0;
        final low = p.quantity > 0 && p.quantity <= p.minStock;
        return InkWell(
          onTap: out ? null : () => onTap(p),
          borderRadius: BorderRadius.circular(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700))),
                  Text(p.barcode, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Row(children: [
                    Expanded(child: Text('${p.salePrice.toStringAsFixed(2)} د.ل', style: const TextStyle(fontWeight: FontWeight.bold))),
                    Chip(label: Text(out ? 'نفد' : low ? 'منخفض ${p.quantity.g}' : p.quantity.g)),
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension _PrettyNumber on double {
  String get g => this == truncateToDouble() ? toInt().toString() : toStringAsFixed(2);
}
