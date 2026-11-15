
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../pos/domain/entities/sale_receipt.dart';

class ReceiptPdfService {
  ReceiptPdfService._();

  static const String currency = 'د.ل';

  static Future<Uint8List> generate({
    required SaleReceipt receipt,
    required PdfPageFormat format,
  }) async {
    final regularData = await rootBundle.load(
      'assets/fonts/Cairo-Regular.ttf',
    );

    final boldData = await rootBundle.load(
      'assets/fonts/Cairo-Bold.ttf',
    );

    final regularFont = pw.Font.ttf(regularData);
    final boldFont = pw.Font.ttf(boldData);

    final pdf = pw.Document(
      title: 'فاتورة ${receipt.invoiceNumber}',
      author: 'Grocery POS',
      subject: 'فاتورة مبيعات',
    );

    final theme = pw.ThemeData.withFont(
      base: regularFont,
      bold: boldFont,
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        theme: theme,
        textDirection: pw.TextDirection.rtl,
        margin: const pw.EdgeInsets.all(24),
        build: (context) {
          return [
            _header(receipt),
            pw.SizedBox(height: 18),
            _invoiceInfo(receipt),
            pw.SizedBox(height: 20),
            _itemsTable(receipt),
            pw.SizedBox(height: 20),
            _totals(receipt),
            pw.SizedBox(height: 24),
            _footer(),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _header(SaleReceipt receipt) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(18),
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex('#087F5B'),
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            'نقطة البيع',
            style: pw.TextStyle(
              fontSize: 23,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            'فاتورة مبيعات',
            style: const pw.TextStyle(
              fontSize: 15,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Text(
              'رقم الفاتورة: ${receipt.invoiceNumber}',
              style: pw.TextStyle(
                color: PdfColor.fromHex('#087F5B'),
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _invoiceInfo(SaleReceipt receipt) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex('#F3F7F4'),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        children: [
          _infoRow(
            'رقم الفاتورة',
            receipt.invoiceNumber,
          ),
          _infoRow(
            'التاريخ',
            _formatDate(receipt.createdAt),
          ),
          _infoRow(
            'طريقة الدفع',
            receipt.paymentMethod == 'cash' ? 'نقداً' : 'بطاقة',
          ),
        ],
      ),
    );
  }

  static pw.Widget _infoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            label,
            style: const pw.TextStyle(
              fontSize: 10,
              color: PdfColors.grey700,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _itemsTable(SaleReceipt receipt) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Text(
          'تفاصيل الأصناف',
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.TableHelper.fromTextArray(
          headers: [
            'الصنف',
            'الكمية',
            'السعر',
            'الإجمالي',
          ],
          data: receipt.items.map((item) {
            return [
              item.productName,
              '${item.quantity}',
              item.unitPrice.toStringAsFixed(2),
              item.total.toStringAsFixed(2),
            ];
          }).toList(),
          headerDecoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#087F5B'),
            borderRadius: pw.BorderRadius.circular(5),
          ),
          headerStyle: pw.TextStyle(
            color: PdfColors.white,
            fontSize: 9,
            fontWeight: pw.FontWeight.bold,
          ),
          cellStyle: const pw.TextStyle(
            fontSize: 9,
          ),
          cellAlignment: pw.Alignment.center,
          headerAlignment: pw.Alignment.center,
          border: pw.TableBorder(
            horizontalInside: pw.BorderSide(
              color: PdfColors.grey300,
              width: 0.5,
            ),
          ),
          cellPadding: const pw.EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 8,
          ),
        ),
      ],
    );
  }

  static pw.Widget _totals(SaleReceipt receipt) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(14),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          color: PdfColor.fromHex('#DCE8E0'),
        ),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        children: [
          _moneyRow('الإجمالي', receipt.subtotal),
          _moneyRow('الخصم', receipt.discount),
          pw.Divider(color: PdfColors.grey400),
          _moneyRow(
            'الصافي',
            receipt.total,
            bold: true,
            color: PdfColor.fromHex('#087F5B'),
          ),
          _moneyRow('المدفوع', receipt.paidAmount),
          _moneyRow(
            'الباقي للعميل',
            receipt.changeAmount,
            color: PdfColor.fromHex('#159B68'),
          ),
          _moneyRow(
            'المتبقي على العميل',
            receipt.remainingAmount,
            color: PdfColor.fromHex('#D94F55'),
          ),
        ],
      ),
    );
  }

  static pw.Widget _moneyRow(
    String label,
    double value, {
    bool bold = false,
    PdfColor? color,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 5),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            '${value.toStringAsFixed(2)} $currency',
            style: pw.TextStyle(
              fontSize: bold ? 14 : 10,
              fontWeight: bold
                  ? pw.FontWeight.bold
                  : pw.FontWeight.normal,
              color: color,
            ),
          ),
          pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: bold ? 13 : 10,
              fontWeight: bold
                  ? pw.FontWeight.bold
                  : pw.FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _footer() {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey300),
        pw.SizedBox(height: 8),
        pw.Text(
          'شكراً لتعاملكم معنا',
          style: pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromHex('#087F5B'),
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'نتمنى لكم يوماً سعيداً',
          style: const pw.TextStyle(
            fontSize: 9,
            color: PdfColors.grey600,
          ),
        ),
      ],
    );
  }

  static String _formatDate(DateTime date) {
    final d = date.toLocal();

    return '${d.year}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')} '
        '${d.hour.toString().padLeft(2, '0')}:'
        '${d.minute.toString().padLeft(2, '0')}';
  }
}
