
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

  bool _isScanned = false;
  bool _isFlashOn = false;
  bool _isCameraReady = false;

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

  Future<void> _onBarcodeDetected(
    BarcodeCapture capture,
  ) async {
    if (_isScanned) return;

    final barcode = capture.barcodes
        .map((item) => item.rawValue)
        .whereType<String>()
        .map((value) => value.trim())
        .firstWhere(
          (value) => value.isNotEmpty,
          orElse: () => '',
        );

    if (barcode.isEmpty) return;

    // منع تكرار القراءة.
    _isScanned = true;

    try {
      await _controller.stop();
    } catch (_) {
      // لا نمنع إرجاع الباركود إذا تعذر إيقاف الكاميرا.
    }

    if (!mounted) return;

    Navigator.of(context).pop<String>(barcode);
  }

  Future<void> _toggleFlash() async {
    try {
      await _controller.toggleTorch();

      if (!mounted) return;

      setState(() {
        _isFlashOn = !_isFlashOn;
      });
    } catch (_) {
      if (!mounted) return;

      _showMessage('تعذر تشغيل الفلاش');
    }
  }

  Future<void> _switchCamera() async {
    try {
      await _controller.switchCamera();
    } catch (_) {
      if (!mounted) return;

      _showMessage('تعذر تبديل الكاميرا');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        title: const Text(
          'مسح الباركود',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'الفلاش',
            onPressed: _toggleFlash,
            icon: Icon(
              _isFlashOn
                  ? Icons.flash_on_rounded
                  : Icons.flash_off_rounded,
            ),
          ),
          IconButton(
            tooltip: 'تبديل الكاميرا',
            onPressed: _switchCamera,
            icon: const Icon(
              Icons.cameraswitch_rounded,
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          // عرض الكاميرا.
         MobileScanner(
  controller: _controller,
  onDetect: _onBarcodeDetected,
),

          // واجهة إطار المسح.
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),

                const Text(
                  'وجّه الكاميرا نحو الباركود',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  width: 290,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: scheme.primary,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Stack(
                    children: [
                      _buildCorner(
                        top: 0,
                        left: 0,
                      ),
                      _buildCorner(
                        top: 0,
                        right: 0,
                      ),
                      _buildCorner(
                        bottom: 0,
                        left: 0,
                      ),
                      _buildCorner(
                        bottom: 0,
                        right: 0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'ضع الباركود داخل الإطار وسيتم قراءته تلقائياً',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),

                const Spacer(),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.black.withValues(
                    alpha: 0.65,
                  ),
                  child: Text(
                    _isCameraReady
                        ? 'الكاميرا جاهزة للمسح'
                        : 'جاري تشغيل الكاميرا...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorner({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: SizedBox(
        width: 25,
        height: 25,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: top != null
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : BorderSide.none,
              bottom: bottom != null
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : BorderSide.none,
              left: left != null
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : BorderSide.none,
              right: right != null
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCameraError(
    BuildContext context,
    MobileScannerException error,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 55,
            ),

            const SizedBox(height: 16),

            const Text(
              'تعذر تشغيل الكاميرا',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              error.errorCode.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('رجوع'),
            ),
          ],
        ),
      ),
    );
  }
}
