
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../pos/domain/entities/sale_receipt.dart';
import '../../domain/entities/receipt_paper_size.dart';

class ReceiptPrinterService {
  ReceiptPrinterService._();

  static Future<void> printReceipt({
    required SaleReceipt receipt,
    required ReceiptPaperSize paperSize,
  }) async {
    final regularFont = pw.Font.ttf(
      await rootBundle.load(
        'assets/fonts/cairo/Cairo-Regular.ttf',
      ),
    );

    final boldFont = pw.Font.ttf(
      await rootBundle.load(
        'assets/fonts/cairo/Cairo-Bold.ttf',
      ),
    );

    final theme = pw.ThemeData.withFont(
      base: regularFont,
      bold: boldFont,
    );

    final pdf = pw.Document(
      theme: theme,
      compress: true,
    );

    final pageFormat = _getPageFormat(
      paperSize,
      receipt.items.length,
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: pageFormat,
        theme: theme,
        margin: pw.EdgeInsets.all(
          paperSize == ReceiptPaperSize.thermal58
              ? 3 * PdfPageFormat.mm
              : paperSize == ReceiptPaperSize.thermal80
                  ? 4 * PdfPageFormat.mm
                  : 18 * PdfPageFormat.mm,
        ),
        textDirection: pw.TextDirection.rtl,
        build: (context) => [
          _centerText(
            'فاتورة مبيعات',
            bold: true,
            size: paperSize == ReceiptPaperSize.a4 ? 22 : 18,
          ),

          pw.SizedBox(height: 6),

          _centerText(
            'رقم الفاتورة: ${receipt.invoiceNumber}',
            bold: true,
          ),

          _centerText(
            DateFormat('yyyy/MM/dd - hh:mm a')
                .format(receipt.createdAt),
            size: 9,
          ),

          pw.SizedBox(height: 8),
          pw.Divider(),

          _infoRow(
            'طريقة الدفع',
            _paymentMethod(receipt.paymentMethod),
          ),

          pw.SizedBox(height: 10),

          _centerText(
            'تفاصيل المنتجات',
            bold: true,
            size: 12,
          ),

          pw.SizedBox(height: 8),

          ...receipt.items.map(
            (item) => _productItem(
              item.productName,
              item.quantity,
              item.unitPrice,
              item.total,
            ),
          ),

          pw.Divider(),

          _moneyRow(
            'الإجمالي قبل الخصم',
            receipt.subtotal,
          ),

          _moneyRow(
            'الخصم',
            receipt.discount,
          ),

          pw.Divider(),

          _moneyRow(
            'الإجمالي النهائي',
            receipt.total,
            bold: true,
            size: 12,
          ),

          pw.SizedBox(height: 5),

          _moneyRow(
            'المبلغ المدفوع',
            receipt.paidAmount,
          ),

          _moneyRow(
            'الباقي',
            receipt.changeAmount,
          ),

          _moneyRow(
            'المبلغ المتبقي',
            receipt.remainingAmount,
          ),

          pw.SizedBox(height: 15),
          pw.Divider(),

          _centerText(
            'شكراً لتعاملكم معنا',
            bold: true,
            size: 12,
          ),

          pw.SizedBox(height: 5),

          _centerText(
            'نتمنى لكم يوماً سعيداً',
            size: 9,
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      name: 'Invoice-${receipt.invoiceNumber}',
      format: pageFormat,
      onLayout: (format) async => pdf.save(),
    );
  }

  static PdfPageFormat _getPageFormat(
    ReceiptPaperSize size,
    int itemCount,
  ) {
    switch (size) {
      case ReceiptPaperSize.thermal58:
        final height = 145 + (itemCount * 22);

        return PdfPageFormat(
          58 * PdfPageFormat.mm,
          height * PdfPageFormat.mm,
        );

      case ReceiptPaperSize.thermal80:
        final height = 145 + (itemCount * 22);

        return PdfPageFormat(
          80 * PdfPageFormat.mm,
          height * PdfPageFormat.mm,
        );

      case ReceiptPaperSize.a4:
        return PdfPageFormat.a4;
    }
  }

  static pw.Widget _productItem(
    String name,
    num quantity,
    num unitPrice,
    num total,
  ) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Text(
            name,
            textAlign: pw.TextAlign.right,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 4),

          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                '${total.toStringAsFixed(2)} د.ل',
                style: const pw.TextStyle(fontSize: 9),
              ),
              pw.Text(
                '$quantity × ${unitPrice.toStringAsFixed(2)}',
                style: const pw.TextStyle(fontSize: 9),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _centerText(
    String value, {
    bool bold = false,
    double size = 10,
  }) {
    return pw.Text(
      value,
      textAlign: pw.TextAlign.center,
      style: pw.TextStyle(
        fontSize: size,
        fontWeight: bold
            ? pw.FontWeight.bold
            : pw.FontWeight.normal,
      ),
    );
  }

  static pw.Widget _infoRow(
    String title,
    String value,
  ) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          value,
          style: const pw.TextStyle(fontSize: 9),
        ),
        pw.Text(
          title,
          style: const pw.TextStyle(fontSize: 9),
        ),
      ],
    );
  }

  static pw.Widget _moneyRow(
    String title,
    num value, {
    bool bold = false,
    double size = 10,
  }) {
    final style = pw.TextStyle(
      fontSize: size,
      fontWeight: bold
          ? pw.FontWeight.bold
          : pw.FontWeight.normal,
    );

    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            '${value.toStringAsFixed(2)} د.ل',
            style: style,
          ),
          pw.Text(
            title,
            style: style,
          ),
        ],
      ),
    );
  }

  static String _paymentMethod(String method) {
    switch (method) {
      case 'cash':
        return 'نقداً';

      case 'card':
        return 'بطاقة';

      case 'bank_transfer':
        return 'تحويل مصرفي';

      default:
        return method;
    }
  }
}
