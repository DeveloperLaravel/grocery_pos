class ProductFailure implements Exception {
  final String message;

  const ProductFailure(this.message);

  @override
  String toString() => message;
}