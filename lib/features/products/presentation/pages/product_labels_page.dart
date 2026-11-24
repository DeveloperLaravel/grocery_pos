import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../data/services/product_labels_pdf_service.dart';
import '../../domain/entities/product.dart';

class ProductLabelsPage extends StatefulWidget {
  final List<Product> products;

  const ProductLabelsPage({
    super.key,
    required this.products,
  });

  @override
  State<ProductLabelsPage> createState() =>
      _ProductLabelsPageState();
}

class _ProductLabelsPageState extends State<ProductLabelsPage> {
  int _copies = 1;
  bool _showPrice = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طباعة ملصقات المنتجات'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text('عدد النسخ لكل منتج'),
                        ),
                        IconButton(
                          onPressed: _copies > 1
                              ? () => setState(() => _copies--)
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          '$_copies',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        IconButton(
                          onPressed: () {
                            if (_copies < 100) {
                              setState(() => _copies++);
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('إظهار سعر المنتج'),
                      value: _showPrice,
                      onChanged: (value) {
                        setState(() => _showPrice = value);
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'المنتجات المحددة: ${widget.products.length}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: PdfPreview(
              canChangePageFormat: false,
              canChangeOrientation: false,
              allowPrinting: true,
              allowSharing: true,
              pdfFileName: 'product_labels.pdf',
              build: (format) {
                return ProductLabelsPdfService.generate(
                  products: widget.products,
                  copies: _copies,
                  showPrice: _showPrice,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}