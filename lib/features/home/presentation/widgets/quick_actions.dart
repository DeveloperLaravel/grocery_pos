
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onNewSale;
  final VoidCallback onProducts;
  final VoidCallback onInventory;
  final VoidCallback onReports;

  const QuickActions({
    super.key,
    required this.onNewSale,
    required this.onProducts,
    required this.onInventory,
    required this.onReports,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(
        title: 'بيع جديد',
        icon: Icons.point_of_sale_rounded,
        color: const Color(0xFF156B4B),
        onTap: onNewSale,
      ),
      _ActionItem(
        title: 'المنتجات',
        icon: Icons.inventory_2_outlined,
        color: const Color(0xFF2878C7),
        onTap: onProducts,
      ),
      _ActionItem(
        title: 'المخزون',
        icon: Icons.warehouse_outlined,
        color: const Color(0xFFD18B27),
        onTap: onInventory,
      ),
      _ActionItem(
        title: 'التقارير',
        icon: Icons.bar_chart_rounded,
        color: const Color(0xFF8656B6),
        onTap: onReports,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final action = actions[index];

        return InkWell(
          onTap: action.onTap,
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                width: 57,
                height: 57,
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  action.icon,
                  color: action.color,
                  size: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                action.title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionItem {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
