import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  late final MobileScannerController _controller;

  bool _handled = false;
  bool _torchEnabled = false;

  @override
  void initState() {
    super.initState();

    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue?.trim();

      if (value == null || value.isEmpty) continue;

      _handled = true;

      Navigator.of(context).pop(value);
      return;
    }
  }

  Future<void> _toggleTorch() async {
    await _controller.toggleTorch();

    if (!mounted) return;

    setState(() {
      _torchEnabled = !_torchEnabled;
    });
  }

  Future<void> _switchCamera() async {
    await _controller.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'مسح الباركود',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'تبديل الكاميرا',
            onPressed: _switchCamera,
            icon: const Icon(Icons.flip_camera_ios_rounded),
          ),
          IconButton(
            tooltip: 'الإضاءة',
            onPressed: _toggleTorch,
            icon: Icon(
              _torchEnabled ? Icons.flash_on_rounded : Icons.flash_off_rounded,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
              errorBuilder: (context, error) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.no_photography_outlined,
                          color: Colors.white,
                          size: 55,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'تعذر تشغيل الكاميرا',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          error.errorDetails?.message ??
                              'تحقق من صلاحية استخدام الكاميرا',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 15),
                        FilledButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('رجوع'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // طبقة إرشادية فوق الكاميرا
          Positioned.fill(
            child: IgnorePointer(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 270,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: scheme.primary,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 65,
                            height: 3,
                            color: scheme.primary,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 65,
                            height: 3,
                            color: scheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'وجّه الكاميرا نحو باركود المنتج',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'سيتم إضافة المنتج إلى السلة تلقائياً',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
