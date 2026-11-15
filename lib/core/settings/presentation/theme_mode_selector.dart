import 'package:flutter/material.dart';

import '../app_settings_controller.dart';


class ThemeModeSelector extends StatelessWidget {
  final AppSettingsController controller;

  const ThemeModeSelector({
    super.key,
    required this.controller,
  });

  String _themeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'حسب إعدادات الجهاز';

      case ThemeMode.light:
        return 'الوضع الفاتح';

      case ThemeMode.dark:
        return 'الوضع الداكن';
    }
  }

  IconData _themeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.settings_brightness_rounded;

      case ThemeMode.light:
        return Icons.light_mode_rounded;

      case ThemeMode.dark:
        return Icons.dark_mode_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.palette_outlined),
                    SizedBox(width: 10),
                    Text(
                      'مظهر التطبيق',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  'اختر المظهر المناسب لاستخدام التطبيق.',
                  style: TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 16),

                ...ThemeMode.values.map((mode) {
                  final selected = controller.themeMode == mode;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => controller.setThemeMode(mode),
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(14),
                        decoration: BoxDecoration(
                          color: selected
                              ? Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(_themeIcon(mode)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                _themeName(mode),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (selected)
                              Icon(
                                Icons.check_circle_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}