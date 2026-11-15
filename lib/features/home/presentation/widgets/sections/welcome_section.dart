
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            colors.primary,
            AppColors.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مرحباً بك 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'إدارة متجرك ومتابعة مبيعاتك ومخزونك من مكان واحد.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(20),
            ),
            child:  ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Image.asset(
    'assets/images/4.webp',
    width: 27,
    height: 27,
    fit: BoxFit.fitHeight,
    errorBuilder: (context, error, stackTrace) {
      return Icon(
        Icons.storefront_rounded,
        color: colors.primary,
        size: 27,
      );
    },
  ),
),
          ),
        ],
      ),
    );
  }
}
