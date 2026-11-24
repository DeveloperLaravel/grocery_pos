
import 'package:flutter/material.dart';

class BarcodeScannerOverlay extends StatelessWidget {
  const BarcodeScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 290,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.greenAccent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Colors.greenAccent,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
