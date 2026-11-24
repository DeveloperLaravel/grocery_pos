import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<Category> onEdit;
  final ValueChanged<Category> onDelete;
  final ValueChanged<Category> onToggleStatus;
  final ValueChanged<Category>? onOpenChildren;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
    this.onOpenChildren,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final crossAxisCount = width >= 1200
            ? 4
            : width >= 850
                ? 3
                : width >= 560
                    ? 2
                    : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 220,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return CategoryCard(
              category: category,
              onEdit: () => onEdit(category),
              onDelete: () => onDelete(category),
              onToggleStatus: () => onToggleStatus(category),
              onOpenChildren: onOpenChildren == null
                  ? null
                  : () => onOpenChildren!(category),
            );
          },
        );
      },
    );
  }
}