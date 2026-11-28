
class Brand {
  final int id;
  final String name;
  final String? description;
  final String? imagePath;
  final bool isActive;

  const Brand({
    required this.id,
    required this.name,
    this.description,
    this.imagePath,
    required this.isActive,
  });
}
