import 'dart:math';

class InternalBarcodeGenerator {
  InternalBarcodeGenerator._();

  static final Random _random = Random.secure();

  /// إنشاء باركود داخلي خاص بالنظام، من نوع CODE128.
  static String generate() {
    final timestamp = DateTime.now()
        .microsecondsSinceEpoch
        .toRadixString(36)
        .toUpperCase();

    final randomNumber = _random.nextInt(1000000)
        .toString()
        .padLeft(6, '0');

    return 'PRD-$timestamp-$randomNumber';
  }

  /// التحقق بحسب نوع الباركود.
  static bool isValid(String value, String type) {
    final code = value.trim();

    if (code.isEmpty) return false;

    switch (type.toUpperCase()) {
      case 'CODE128':
      case 'INTERNAL':
        // Code128 يقبل الأحرف والأرقام والرموز.
        return true;

      case 'EAN13':
        return _isValidEan(code, 13);

      case 'EAN8':
        return _isValidEan(code, 8);

      case 'UPC':
      case 'UPCA':
        return _isValidUpcA(code);

      case 'NONE':
        return true;

      default:
        return false;
    }
  }

  /// تحديد النوع تلقائياً للباركود المقروء من الماسح.
  static String detectType(String value) {
    final code = value.trim();

    if (_isValidEan(code, 13)) return 'EAN13';
    if (_isValidEan(code, 8)) return 'EAN8';
    if (_isValidUpcA(code)) return 'UPC';

    return 'CODE128';
  }

  static bool _isValidEan(String value, int length) {
    if (value.length != length ||
        !RegExp(r'^\d+$').hasMatch(value)) {
      return false;
    }

    final digits = value.split('').map(int.parse).toList();
    final checkDigit = digits.removeLast();

    var sum = 0;

    for (var i = 0; i < digits.length; i++) {
      final positionFromRight = digits.length - i;

      final weight = positionFromRight.isEven ? 3 : 1;
      sum += digits[i] * weight;
    }

    final expected = (10 - (sum % 10)) % 10;

    return checkDigit == expected;
  }

  static bool _isValidUpcA(String value) {
    if (value.length != 12 ||
        !RegExp(r'^\d+$').hasMatch(value)) {
      return false;
    }

    final digits = value.split('').map(int.parse).toList();

    var oddSum = 0;
    var evenSum = 0;

    for (var i = 0; i < 11; i++) {
      if (i.isEven) {
        oddSum += digits[i];
      } else {
        evenSum += digits[i];
      }
    }

    final total = (oddSum * 3) + evenSum;
    final expected = (10 - (total % 10)) % 10;

    return digits.last == expected;
  }
}