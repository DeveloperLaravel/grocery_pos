
import 'package:flutter/material.dart';

import '../core/database/di/injection.dart';
import '../core/router/app_route.dart';
import '../core/settings/app_settings_controller.dart';
import '../core/settings/app_settings_scope.dart';
import '../core/theme/app_theme.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = getIt<AppSettingsController>();

    return ListenableBuilder(
      listenable: settings,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Grocery POS',

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: settings.themeMode,

          routerConfig: AppRouter.router,

          builder: (context, child) {
            return AppSettingsScope(
              controller: settings,
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
