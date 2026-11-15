
import 'package:flutter/material.dart';

import '../../../../../core/settings/app_settings_scope.dart';
import 'header_icon_button.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AppSettingsScope.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final isDark =
            Theme.of(context).brightness == Brightness.dark;

        return HeaderIconButton(
          icon: isDark
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          tooltip: isDark
              ? 'الوضع الفاتح'
              : 'الوضع الداكن',
          onTap: () {
            controller.setThemeMode(
              isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
        );
      },
    );
  }
}
