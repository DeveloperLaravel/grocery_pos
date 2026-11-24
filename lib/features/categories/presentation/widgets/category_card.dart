import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../../../core/theme/app_colors.dart';
import 'category_status_badge.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleStatus;
  final VoidCallback? onOpenChildren;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
    this.onOpenChildren,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.primary,
                    size: 23,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  tooltip: 'خيارات التصنيف',
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: theme.hintColor,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        onEdit();
                        break;
                      case 'toggle':
                        onToggleStatus();
                        break;
                      case 'delete':
                        onDelete();
                        break;
                    }
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: _MenuItem(
                        icon: Icons.edit_outlined,
                        title: 'تعديل',
                      ),
                    ),
                    PopupMenuItem(
                      value: 'toggle',
                      child: _MenuItem(
                        icon: category.isActive
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        title: category.isActive
                            ? 'تعطيل التصنيف'
                            : 'تفعيل التصنيف',
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      value: 'delete',
                      child: _MenuItem(
                        icon: Icons.delete_outline_rounded,
                        title: 'حذف',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              category.description?.trim().isNotEmpty == true
                  ? category.description!
                  : 'لا يوجد وصف لهذا التصنيف',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.hintColor,
                height: 1.5,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 18),
            Divider(
              color: theme.dividerColor.withValues(alpha: 0.35),
              height: 1,
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                CategoryStatusBadge(isActive: category.isActive),
                const Spacer(),
                if (onOpenChildren != null)
                  TextButton.icon(
                    onPressed: onOpenChildren,
                    icon: const Icon(
                      Icons.account_tree_outlined,
                      size: 16,
                    ),
                    label: const Text('الفرعية'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Icon(icon, size: 19, color: effectiveColor),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(color: effectiveColor),
        ),
      ],
    );
  }
}