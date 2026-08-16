import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../features/pos/domain/sale_receipt.dart';
import '../config/app_config.dart';

class PdfReceiptService {
  const PdfReceiptService._();

  static Future<void> preview(SaleReceipt receipt) async {
    final document = _buildDocument(receipt);
    await Printing.layoutPdf(
      onLayout: (_) async => document.save(),
    );
  }

  static Future<List<int>> buildBytes(SaleReceipt receipt) async {
    final document = _buildDocument(receipt);
    return document.save();
  }

  static pw.Document _buildDocument(SaleReceipt receipt) {
    final document = pw.Document();

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const pw.EdgeInsets.all(12),
        build: (_) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Text(
                AppConfig.appName,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                receipt.invoiceNumber,
                textAlign: pw.TextAlign.center,
              ),
              pw.Divider(),
              ...receipt.items.map(
                (item) => pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(child: pw.Text(item.product.name)),
                      pw.Text(
                        '${item.quantity} x '
                        '${item.product.salePrice.toStringAsFixed(2)}',
                      ),
                      pw.SizedBox(width: 6),
                      pw.Text(item.total.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
              pw.Divider(),
              pw.Text(
                'TOTAL ${receipt.total.toStringAsFixed(2)} '
                '${AppConfig.currencyCode}',
                textAlign: pw.TextAlign.right,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );

    return document;
  }
}
