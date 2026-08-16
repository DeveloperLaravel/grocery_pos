import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});
  @override State<BarcodePage> createState() => _BarcodePageState();
}
class _BarcodePageState extends State<BarcodePage> {
  bool done = false;
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('مسح الباركود')),
    body: MobileScanner(onDetect: (capture) {
      if (done) return;
      final value = capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue;
      if (value != null) { done = true; Navigator.pop(context, value); }
    }),
  );
}
