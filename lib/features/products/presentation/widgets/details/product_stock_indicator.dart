
import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';

class ProductStockIndicator extends StatelessWidget {
  final Product product;

  const ProductStockIndicator({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isOut = product.quantity <= 0;
    final isLow = !isOut && product.quantity <= product.minStock;

    final color = isOut
        ? Colors.red
        : isLow
            ? Colors.orange
            : Colors.green;

    final message = isOut
        ? 'نفد المخزون'
        : isLow
            ? 'المخزون منخفض'
            : 'المخزون جيد';

    final progress = product.minStock <= 0
        ? 1.0
        : (product.quantity / (product.minStock * 2))
            .clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warehouse_outlined),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'حالة المخزون',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              borderRadius: BorderRadius.circular(20),
              color: color,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 10),
            Text(
              'المتوفر: ${product.quantity} ${product.baseUnit}',
            ),
            const SizedBox(height: 4),
            Text(
              'الحد الأدنى: ${product.minStock} ${product.baseUnit}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
