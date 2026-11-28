
class Category {
  final int id;
  final String name;
  final String? description;
  final int? parentId;
  final String? imagePath;
  final bool isActive;
  final int sortOrder;

  const Category({
    required this.id,
    required this.name,
    this.description,
    this.parentId,
    this.imagePath,
    required this.isActive,
    required this.sortOrder,
  });
}
