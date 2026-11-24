
class ProductImage {
  final int id;
  final int productId;

  final String imagePath;
  final String? imageName;

  final bool isPrimary;
  final int sortOrder;

  final DateTime createdAt;

  const ProductImage({
    required this.id,
    required this.productId,
    required this.imagePath,
    this.imageName,
    required this.isPrimary,
    required this.sortOrder,
    required this.createdAt,
  });
}
