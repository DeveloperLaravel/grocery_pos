extension StringX on String {
  String get normalizedSearch => trim().toLowerCase();

  bool get isValidBarcode {
    final value = trim();
    if (value.isEmpty) return false;
    return RegExp(r'^[A-Za-z0-9._-]{3,100}$').hasMatch(value);
  }
}
