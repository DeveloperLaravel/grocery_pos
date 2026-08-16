import 'package:flutter/material.dart';

/// عنصر تنقل داخل الواجهة الرئيسية.
///
/// هذا الكيان لا يعتمد على صفحات العرض نفسها، لذلك يبقى بسيطًا
/// ويمكن اختباره وإعادة استخدامه بسهولة.
class HomeDestination {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const HomeDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}
