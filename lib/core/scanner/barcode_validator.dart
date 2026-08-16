class BarcodeValidator {
  const BarcodeValidator._();

  static String? normalize(String? rawValue) {
    final value = rawValue?.trim();
    if (value == null || value.isEmpty) return null;
    if (value.length > 100) return null;
    return value;
  }
}
