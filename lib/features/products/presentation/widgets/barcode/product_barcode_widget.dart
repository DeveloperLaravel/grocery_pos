import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductBarcodeWidget extends StatelessWidget {
  final String barcode;
  final String barcodeType;
  final double width;
  final double height;
  final bool showValue;

  const ProductBarcodeWidget({
    super.key,
    required this.barcode,
    this.barcodeType = 'CODE128',
    this.width = 280,
    this.height = 90,
    this.showValue = true,
  });

  Barcode _getBarcodeType() {
    switch (barcodeType.toUpperCase()) {
      case 'EAN13':
        return Barcode.ean13();

      case 'EAN8':
        return Barcode.ean8();

      case 'UPC':
      case 'UPCA':
        return Barcode.upcA();

      case 'CODE128':
      case 'INTERNAL':
      default:
        return Barcode.code128();
    }
  }

  @override
  Widget build(BuildContext context) {
    final code = barcode.trim();

    if (code.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BarcodeWidget(
            barcode: _getBarcodeType(),
            data: code,
            width: width,
            height: height,
            drawText: false,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),

          if (showValue) ...[
            const SizedBox(height: 10),
            SelectableText(
              code,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(text: code),
                );

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم نسخ الباركود'),
                  ),
                );
              },
              icon: const Icon(Icons.copy, size: 18),
              label: const Text('نسخ الباركود'),
            ),
          ],
        ],
      ),
    );
  }
}