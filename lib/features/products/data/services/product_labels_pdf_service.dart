
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/utils/barcode/internal_barcode_generator.dart';
import '../../domain/entities/product.dart';

/// خدمة إنشاء ملصقات المنتجات بصيغة PDF.
class ProductLabelsPdfService {
  ProductLabelsPdfService._();

  static const int columns = 3;
  static const int rows = 8;

  static const int labelsPerPage = columns * rows;

  static const String regularFontPath =
      'assets/fonts/NotoNaskhArabic-Regular.ttf';

  static const String boldFontPath =
      'assets/fonts/NotoNaskhArabic-Bold.ttf';

  /// إنشاء ملف PDF لملصقات المنتجات.
  ///
  /// copies:
  /// عدد النسخ لكل منتج.
  ///
  /// showPrice:
  /// إظهار سعر البيع أو إخفاؤه.
  static Future<Uint8List> generate({
    required List<Product> products,
    required int copies,
    bool showPrice = true,
  }) async {
    if (products.isEmpty) {
      throw ArgumentError('لا توجد منتجات للطباعة');
    }

    if (copies < 1) {
      throw ArgumentError('عدد النسخ يجب أن يكون أكبر من صفر');
    }

    // تحميل الخطوط العربية.
    final regularFontData =
        await rootBundle.load(regularFontPath);

    final boldFontData =
        await rootBundle.load(boldFontPath);

    final regularFont = pw.Font.ttf(regularFontData);

    final boldFont = pw.Font.ttf(boldFontData);

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: regularFont,
        bold: boldFont,
      ),
    );

    // تجهيز الملصقات وتكرار كل منتج.
    final labels = <Product>[];

    for (final product in products) {
      final barcode = product.barcode?.trim() ?? '';

      if (barcode.isEmpty) {
        continue;
      }

      for (var i = 0; i < copies; i++) {
        labels.add(product);
      }
    }

    if (labels.isEmpty) {
      throw ArgumentError(
        'المنتجات المحددة لا تحتوي على باركود',
      );
    }

    // تقسيم الملصقات على صفحات A4.
    for (
      var start = 0;
      start < labels.length;
      start += labelsPerPage
    ) {
      final pageLabels = labels
          .skip(start)
          .take(labelsPerPage)
          .toList();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(8),
          textDirection: pw.TextDirection.rtl,
          build: (context) {
            return pw.GridView(
              crossAxisCount: columns,
              childAspectRatio: 1.75,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: pageLabels.map((product) {
                return _buildLabel(
                  product,
                  showPrice: showPrice,
                );
              }).toList(),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  /// بناء ملصق منتج واحد.
  static pw.Widget _buildLabel(
    Product product, {
    required bool showPrice,
  }) {
    final barcode = product.barcode!.trim();

    final barcodeType =
        InternalBarcodeGenerator.detectType(barcode);

    final barcodeFormat = _getBarcodeFormat(barcodeType);

    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 4,
      ),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          color: PdfColors.grey600,
          width: 0.5,
        ),
        borderRadius: pw.BorderRadius.circular(2),
      ),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            product.name,
            maxLines: 1,
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 3),

          pw.Expanded(
            child: pw.BarcodeWidget(
              barcode: barcodeFormat,
              data: barcode,
              drawText: false,
              width: double.infinity,
              height: 35,
              margin: const pw.EdgeInsets.symmetric(
                horizontal: 5,
              ),
            ),
          ),

          pw.SizedBox(height: 2),

          pw.Text(
            barcode,
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(
              fontSize: 8,
            ),
          ),

          if (showPrice) ...[
            pw.SizedBox(height: 2),

            pw.Text(
              'السعر: ${product.salePrice.toStringAsFixed(2)}',
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// تحويل نوع الباركود إلى تنسيق مكتبة PDF.
  static pw.Barcode _getBarcodeFormat(String type) {
    switch (type) {
      case 'EAN13':
        return pw.Barcode.ean13();

      case 'EAN8':
        return pw.Barcode.ean8();

      case 'UPC':
        return pw.Barcode.upcA();

      case 'CODE128':
      default:
        return pw.Barcode.code128();
    }
  }
}
