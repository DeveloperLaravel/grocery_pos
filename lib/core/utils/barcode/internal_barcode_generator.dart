
import 'dart:math';

/// مسؤول عن إنشاء والتحقق من الباركود.
class InternalBarcodeGenerator {
  InternalBarcodeGenerator._();

  static final Random _random = Random.secure();

  static const String internalPrefix = 'PRD';

  /// إنشاء باركود داخلي فريد عملياً.
  ///
  /// مثال:
  /// PRD-MF8X2K9-583921
  static String generate() {
    final timestamp = DateTime.now()
        .microsecondsSinceEpoch
        .toRadixString(36)
        .toUpperCase();

    final randomNumber = _random
        .nextInt(1000000)
        .toString()
        .padLeft(6, '0');

    return '$internalPrefix-$timestamp-$randomNumber';
  }

  /// التحقق من صحة الباركود حسب النوع.
  static bool isValid(String value, String type) {
    final code = value.trim();
    final normalizedType = type.trim().toUpperCase();

    if (normalizedType == 'NONE') {
      return code.isEmpty;
    }

    if (code.isEmpty) return false;

    switch (normalizedType) {
      case 'CODE128':
      case 'INTERNAL':
        return _isValidCode128(code);

      case 'EAN13':
        return _isValidEan(code, 13);

      case 'EAN8':
        return _isValidEan(code, 8);

      case 'UPC':
      case 'UPCA':
        return _isValidUpcA(code);

      default:
        return false;
    }
  }

  /// اكتشاف نوع الباركود تلقائياً.
  static String detectType(String value) {
    final code = value.trim();

    if (_isValidEan(code, 13)) return 'EAN13';

    if (_isValidEan(code, 8)) return 'EAN8';

    if (_isValidUpcA(code)) return 'UPC';

    return 'CODE128';
  }

  /// التحقق من الأحرف المقبولة في Code128.
  static bool _isValidCode128(String value) {
    return value.isNotEmpty &&
        value.codeUnits.every(
          (character) => character >= 32 && character <= 126,
        );
  }

  /// التحقق من EAN-13 و EAN-8.
  static bool _isValidEan(String value, int length) {
    if (value.length != length ||
        !RegExp(r'^\d+$').hasMatch(value)) {
      return false;
    }

    final digits = value.split('').map(int.parse).toList();

    final checkDigit = digits.removeLast();

    var sum = 0;

    for (var i = 0; i < digits.length; i++) {
      final weight = length == 13
          ? (i.isEven ? 1 : 3)
          : (i.isEven ? 3 : 1);

      sum += digits[i] * weight;
    }

    final expected = (10 - (sum % 10)) % 10;

    return checkDigit == expected;
  }

  /// التحقق من UPC-A.
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
