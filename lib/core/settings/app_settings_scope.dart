
import 'package:flutter/material.dart';

import 'app_settings_controller.dart';

class AppSettingsScope
    extends InheritedNotifier<AppSettingsController> {
  const AppSettingsScope({
    super.key,
    required AppSettingsController controller,
    required super.child,
  }) : super(notifier: controller);

  /// الحصول على Controller مع الاشتراك في التغييرات.
  static AppSettingsController of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AppSettingsScope>();

    assert(
      scope != null,
      'AppSettingsScope is missing. '
      'Wrap your application with AppSettingsScope.',
    );

    return scope!.notifier!;
  }

  /// الحصول على Controller دون الاشتراك في التغييرات.
  static AppSettingsController read(BuildContext context) {
    final scope = context
        .getInheritedWidgetOfExactType<AppSettingsScope>();

    assert(
      scope != null,
      'AppSettingsScope is missing. '
      'Wrap your application with AppSettingsScope.',
    );

    return scope!.notifier!;
  }

  @override
  bool updateShouldNotify(
    covariant InheritedNotifier<AppSettingsController> oldWidget,
  ) {
    return notifier != oldWidget.notifier;
  }
}
