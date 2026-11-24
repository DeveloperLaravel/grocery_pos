
class RecentSale {
  final int id;
  final String invoiceNumber;
  final double total;
  final double paidAmount;
  final String paymentMethod;
  final DateTime createdAt;

  const RecentSale({
    required this.id,
    required this.invoiceNumber,
    required this.total,
        required this.paidAmount,
    required this.paymentMethod,
    required this.createdAt,
  });
}