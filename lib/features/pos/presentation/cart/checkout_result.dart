class CheckoutResult {
  final double paid;
  final String method;

  const CheckoutResult({
    required this.paid,
    required this.method,
  });

  double changeFor(double total) {
    final change = paid - total;
    return change > 0 ? change : 0;
  }

  bool get isValid => paid >= 0 && method.isNotEmpty;
}
