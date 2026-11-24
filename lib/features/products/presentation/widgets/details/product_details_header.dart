
import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Product product;

  const ProductDetailsHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(
                  Icons.inventory_2_outlined,
                  size: 42,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product.barcode ?? 'بدون باركود',
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Text(
                '${product.salePrice.toStringAsFixed(2)} د.ل',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
