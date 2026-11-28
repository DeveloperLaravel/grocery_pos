

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../core/database/app_database.dart';
import '../../../../app/di/injection.dart';

enum ReceiptPaperSize {
  a4,
  thermal80,
  thermal58,
}

class ReceiptPrintPreviewPage extends StatefulWidget {
  final int saleId;

  const ReceiptPrintPreviewPage({
    super.key,
    required this.saleId,
  });

  @override
  State<ReceiptPrintPreviewPage> createState() =>
      _ReceiptPrintPreviewPageState();
}

class _ReceiptPrintPreviewPageState
    extends State<ReceiptPrintPreviewPage> {
  final AppDatabase _db = getIt<AppDatabase>();

  SaleDb? _sale;
  List<SaleItemDb> _items = [];

  bool _loading = true;
  String? _error;

  ReceiptPaperSize _paperSize = ReceiptPaperSize.a4;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final sale = await (_db.select(_db.sales)
            ..where((t) => t.id.equals(widget.saleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw Exception('الفاتورة غير موجودة');
      }

      final items = await (_db.select(_db.saleItems)
            ..where((t) => t.saleId.equals(widget.saleId)))
          .get();

      if (!mounted) return;

      setState(() {
        _sale = sale;
        _items = items;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  String get _paperLabel {
    switch (_paperSize) {
      case ReceiptPaperSize.a4:
        return 'A4';
      case ReceiptPaperSize.thermal80:
        return 'حراري 80mm';
      case ReceiptPaperSize.thermal58:
        return 'حراري 58mm';
    }
  }

  PdfPageFormat get _pageFormat {
    switch (_paperSize) {
      case ReceiptPaperSize.a4:
        return PdfPageFormat.a4;

      case ReceiptPaperSize.thermal80:
        return PdfPageFormat(
          80 * PdfPageFormat.mm,
          2000 * PdfPageFormat.mm,
          marginAll: 4 * PdfPageFormat.mm,
        );

      case ReceiptPaperSize.thermal58:
        return PdfPageFormat(
          58 * PdfPageFormat.mm,
          2000 * PdfPageFormat.mm,
          marginAll: 3 * PdfPageFormat.mm,
        );
    }
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final sale = _sale!;

    final regularFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/cairo/Cairo-Regular.ttf'),
    );

    final boldFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/cairo/Cairo-Bold.ttf'),
    );

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: regularFont,
        bold: boldFont,
      ),
    );

    final isA4 = _paperSize == ReceiptPaperSize.a4;

    final date = DateFormat('yyyy/MM/dd  HH:mm').format(sale.createdAt);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        textDirection: pw.TextDirection.rtl,
        margin: pw.EdgeInsets.all(
          isA4 ? 32 : 8,
        ),
        build: (context) => [
          pw.Center(
            child: pw.Text(
              'فاتورة مبيعات',
              style: pw.TextStyle(
                font: boldFont,
                fontSize: isA4 ? 24 : 15,
              ),
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Center(
            child: pw.Text(
              'رقم الفاتورة: ${sale.invoiceNumber}',
              style: pw.TextStyle(
                font: boldFont,
                fontSize: isA4 ? 14 : 10,
              ),
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Text(
              date,
              style: pw.TextStyle(fontSize: isA4 ? 11 : 8),
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Divider(),
          pw.SizedBox(height: 6),
          pw.TableHelper.fromTextArray(
            headers: const [
              'المنتج',
              'الكمية',
              'السعر',
              'الإجمالي',
            ],
            data: _items.map((item) {
              return [
                item.productName,
                item.quantity.toString(),
                item.unitPrice.toStringAsFixed(2),
                item.total.toStringAsFixed(2),
              ];
            }).toList(),
            headerStyle: pw.TextStyle(
              font: boldFont,
              fontSize: isA4 ? 11 : 7,
            ),
            cellStyle: pw.TextStyle(
              font: regularFont,
              fontSize: isA4 ? 10 : 7,
            ),
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.grey300,
            ),
            cellAlignment: pw.Alignment.center,
            headerAlignment: pw.Alignment.center,
            border: pw.TableBorder.all(
              color: PdfColors.grey400,
              width: 0.5,
            ),
            cellPadding: pw.EdgeInsets.all(isA4 ? 7 : 3),
            columnWidths: {
              0: const pw.FlexColumnWidth(2.5),
              1: const pw.FlexColumnWidth(1),
              2: const pw.FlexColumnWidth(1.3),
              3: const pw.FlexColumnWidth(1.3),
            },
          ),
          pw.SizedBox(height: 14),
          pw.Divider(),
          pw.SizedBox(height: 8),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'عدد المنتجات:',
                style: pw.TextStyle(font: boldFont),
              ),
              pw.Text('${_items.length}'),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: const pw.BoxDecoration(
              color: PdfColors.grey200,
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'الإجمالي النهائي',
                  style: pw.TextStyle(
                    font: boldFont,
                    fontSize: isA4 ? 16 : 11,
                  ),
                ),
                pw.Text(
                  '${sale.total.toStringAsFixed(2)} د.ل',
                  style: pw.TextStyle(
                    font: boldFont,
                    fontSize: isA4 ? 16 : 11,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 24),
          pw.Center(
            child: pw.Text(
              'شكراً لتسوقكم معنا',
              style: pw.TextStyle(
                font: regularFont,
                fontSize: isA4 ? 12 : 9,
              ),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('معاينة الفاتورة'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _error!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : _sale == null
                  ? const Center(child: Text('الفاتورة غير موجودة'))
                  : Column(
                      children: [
                        _buildControls(colors),
                        Expanded(
                          child: PdfPreview(
                            key: ValueKey(_paperSize),
                            build: _buildPdf,
                            initialPageFormat: _pageFormat,
                            allowPrinting: true,
                            allowSharing: true,
                            canChangePageFormat: false,
                            canChangeOrientation: false,
                            pdfFileName:
                                'invoice_${_sale!.invoiceNumber}.pdf',
                            loadingWidget:
                                const CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
    );
  }

  Widget _buildControls(ColorScheme colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          bottom: BorderSide(color: colors.outlineVariant),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'حجم ورق الطباعة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SegmentedButton<ReceiptPaperSize>(
            segments: const [
              ButtonSegment(
                value: ReceiptPaperSize.a4,
                label: Text('A4'),
                icon: Icon(Icons.description_outlined),
              ),
              ButtonSegment(
                value: ReceiptPaperSize.thermal80,
                label: Text('80mm'),
                icon: Icon(Icons.receipt_long),
              ),
              ButtonSegment(
                value: ReceiptPaperSize.thermal58,
                label: Text('58mm'),
                icon: Icon(Icons.receipt),
              ),
            ],
            selected: {_paperSize},
            onSelectionChanged: (selection) {
              setState(() {
                _paperSize = selection.first;
              });
            },
          ),
          const SizedBox(height: 8),
          Text(
            'حجم الورق المحدد: $_paperLabel',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
