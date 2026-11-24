class BrandValidationException implements Exception {
  final String message;

  const BrandValidationException(this.message);

  @override
  String toString() => message;
}