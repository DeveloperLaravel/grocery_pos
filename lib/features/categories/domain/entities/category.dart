
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;

  final String name;
  final String? description;

  final int? parentId;

  final String? imagePath;

  final bool isActive;

  final int sortOrder;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Category({
    this.id,
    required this.name,
    this.description,
    this.parentId,
    this.imagePath,
    this.isActive = true,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        parentId,
        imagePath,
        isActive,
        sortOrder,
        createdAt,
        updatedAt,
      ];

  Category copyWith({
    int? id,
    String? name,
    String? description,
    int? parentId,
    String? imagePath,
    bool? isActive,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
      imagePath: imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
