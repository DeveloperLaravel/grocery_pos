import 'dart:io';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../features/pos/domain/sale_receipt.dart';
import '../config/app_config.dart';
import '../error/failure.dart';

abstract interface class PrinterGateway {
  Future<void> printReceipt(
    SaleReceipt receipt, {
    required String host,
    int port = AppConfig.defaultPrinterPort,
  });
}

@LazySingleton(as: PrinterGateway)
class PrinterService implements PrinterGateway {
  @override
  Future<void> printReceipt(
    SaleReceipt receipt, {
    required String host,
    int port = AppConfig.defaultPrinterPort,
  }) async {
    Socket? socket;

    try {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm80, profile);
      final bytes = <int>[];

      bytes.addAll(
        generator.text(
          AppConfig.appName,
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
      );
      bytes.addAll(
        generator.text(
          receipt.invoiceNumber,
          styles: const PosStyles(align: PosAlign.center),
        ),
      );
      bytes.addAll(
        generator.text(
          DateFormat('yyyy-MM-dd HH:mm').format(receipt.date),
          styles: const PosStyles(align: PosAlign.center),
        ),
      );
      bytes.addAll(generator.hr());

      for (final item in receipt.items) {
        bytes.addAll(
          generator.row([
            PosColumn(text: item.product.name, width: 6),
            PosColumn(
              text: item.quantity.toString(),
              width: 2,
              styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: item.total.toStringAsFixed(2),
              width: 4,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]),
        );
      }

      bytes.addAll(generator.hr());
      bytes.addAll(
        generator.text(
          'TOTAL: ${receipt.total.toStringAsFixed(2)} ${AppConfig.currencyCode}',
          styles: const PosStyles(
            align: PosAlign.right,
            bold: true,
          ),
        ),
      );
      bytes.addAll(
        generator.text(
          'PAID: ${receipt.paid.toStringAsFixed(2)}   '
          'CHANGE: ${receipt.change.toStringAsFixed(2)}',
        ),
      );
      bytes.addAll(generator.feed(2));
      bytes.addAll(generator.cut());

      socket = await Socket.connect(
        host,
        port,
        timeout: AppConfig.printerConnectionTimeout,
      );
      socket.add(bytes);
      await socket.flush();
    } catch (error, stackTrace) {
      throw PrinterFailure(
        'تعذر الاتصال بالطابعة أو طباعة الفاتورة',
        error,
        stackTrace,
      );
    } finally {
      await socket?.close();
    }
  }
}
