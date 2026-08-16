import 'package:flutter/material.dart';
import 'package:grocery_pos/core/printer/pdf_receipt_service.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';

class ReceiptPage extends StatelessWidget {
  final SaleReceipt receipt;
  const ReceiptPage({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receipt.invoiceNumber)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('فاتورة بيع', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(receipt.invoiceNumber),
                  const Divider(),
                  Expanded(child: ListView.builder(itemCount: receipt.items.length, itemBuilder: (_, i) {
                    final item = receipt.items[i];
                    return ListTile(
                      title: Text(item.product.name),
                      subtitle: Text('${item.quantity} × ${item.product.salePrice.toStringAsFixed(2)}'),
                      trailing: Text('${item.total.toStringAsFixed(2)} د.ل'),
                    );
                  })),
                  const Divider(),
                  _row('الإجمالي', receipt.total),
                  _row('المدفوع', receipt.paid),
                  _row('الباقي', receipt.change),
                  const SizedBox(height: 12),
                  SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => PdfReceiptService.preview(receipt), icon: const Icon(Icons.print_outlined), label: const Text('معاينة / طباعة'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(String title, double value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title), Text('${value.toStringAsFixed(2)} د.ل', style: const TextStyle(fontWeight: FontWeight.bold))]),
  );
}
