
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ProductBarcodeScannerPage extends StatefulWidget {
  const ProductBarcodeScannerPage({super.key});

  @override
  State<ProductBarcodeScannerPage> createState() =>
      _ProductBarcodeScannerPageState();
}

class _ProductBarcodeScannerPageState
    extends State<ProductBarcodeScannerPage> {
  late final MobileScannerController _controller;

  bool _detected = false;

  @override
  void initState() {
    super.initState();

    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      formats: const [
        BarcodeFormat.ean13,
        BarcodeFormat.ean8,
        BarcodeFormat.upcA,
        BarcodeFormat.upcE,
        BarcodeFormat.code128,
        BarcodeFormat.code39,
        BarcodeFormat.code93,
        BarcodeFormat.codabar,
        BarcodeFormat.itf,
        BarcodeFormat.qrCode,
      ],
    );
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_detected || capture.barcodes.isEmpty) return;

    final barcode = capture.barcodes
        .firstWhere(
          (item) => item.rawValue != null &&
              item.rawValue!.trim().isNotEmpty,
          orElse: () => capture.barcodes.first,
        )
        .rawValue
        ?.trim();

    if (barcode == null || barcode.isEmpty) return;

    _detected = true;

    await _controller.stop();

    if (!mounted) return;

    Navigator.of(context).pop(barcode);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('مسح باركود المنتج'),
          actions: [
            IconButton(
              tooltip: 'الفلاش',
              onPressed: () => _controller.toggleTorch(),
              icon: const Icon(Icons.flash_on_rounded),
            ),
            IconButton(
              tooltip: 'تبديل الكاميرا',
              onPressed: () => _controller.switchCamera(),
              icon: const Icon(Icons.cameraswitch_rounded),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),

            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width =
                      (constraints.maxWidth * .78).clamp(220.0, 360.0);

                  return Container(
                    width: width,
                    height: width * .48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              bottom: 35,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'وجّه كاميرا الهاتف نحو باركود المنتج داخل الإطار',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
