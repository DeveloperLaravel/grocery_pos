import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CategoryEmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  final bool isSearching;

  const CategoryEmptyState({
    super.key,
    required this.onAdd,
    this.isSearching = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.09),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.category_outlined,
                size: 42,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isSearching ? 'لا توجد نتائج' : 'لا توجد تصنيفات بعد',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isSearching
                  ? 'جرّب البحث باستخدام اسم مختلف'
                  : 'ابدأ بتنظيم منتجاتك من خلال إضافة أول تصنيف',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
            if (!isSearching) ...[
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_rounded),
                label: const Text('إضافة أول تصنيف'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}