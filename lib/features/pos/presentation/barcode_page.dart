import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() =>
      _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  final MobileScannerController controller =
      MobileScannerController();

  bool done = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(
    BarcodeCapture capture,
  ) async {
    if (done) return;

    if (capture.barcodes.isEmpty) {
      return;
    }

    final value =
        capture.barcodes.first.rawValue?.trim();

    if (value == null || value.isEmpty) {
      return;
    }

    done = true;

    await controller.stop();

    if (!mounted) return;

    Navigator.pop(context, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('مسح الباركود'),
        actions: [
          IconButton(
            tooltip: 'الفلاش',
            onPressed: () {
              controller.toggleTorch();
            },
            icon: const Icon(Icons.flash_on),
          ),

          IconButton(
            tooltip: 'تبديل الكاميرا',
            onPressed: () {
              controller.switchCamera();
            },
            icon: const Icon(Icons.cameraswitch),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
          ),

          Center(
            child: Container(
              width: 320,
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius:
                    BorderRadius.circular(16),
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 35,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color:
                    Colors.black.withValues(alpha: 0.65),
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: const Text(
                'ضع باركود المنتج داخل الإطار',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}