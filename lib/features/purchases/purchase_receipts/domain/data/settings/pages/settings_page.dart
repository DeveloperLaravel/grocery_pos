
import 'package:flutter/material.dart';

import '../../../../../../../app/di/injection.dart';
import '../../../../../../../../core/settings/app_settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = getIt<AppSettingsController>();

    return ListenableBuilder(
      listenable: settings,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('الإعدادات'),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'استعادة الإعدادات الافتراضية',
                icon: const Icon(Icons.restart_alt),
                onPressed: () => _resetSettings(context, settings),
              ),
            ],
          ),

          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Appearance
              _buildSectionTitle(
                'المظهر',
                Icons.palette_outlined,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.brightness_6_outlined),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'مظهر التطبيق',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          DropdownButton<ThemeMode>(
                            value: settings.themeMode,
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(
                                value: ThemeMode.system,
                                child: Text('تلقائي'),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.light,
                                child: Text('فاتح'),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.dark,
                                child: Text('داكن'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                settings.setThemeMode(value);
                              }
                            },
                          ),
                        ],
                      ),

                      const Divider(),

                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        secondary: const Icon(
                          Icons.density_small,
                        ),
                        title: const Text('الوضع المضغوط'),
                        subtitle: const Text(
                          'تقليل المسافات داخل واجهات التطبيق',
                        ),
                        value: settings.compactMode,
                        onChanged: settings.setCompactMode,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Sales Settings
              _buildSectionTitle(
                'إعدادات المبيعات',
                Icons.point_of_sale_outlined,
              ),

              Card(
                child: SwitchListTile(
                  contentPadding: const EdgeInsets.all(16),
                  secondary: const Icon(
                    Icons.fact_check_outlined,
                  ),
                  title: const Text('تأكيد عملية البيع'),
                  subtitle: const Text(
                    'عرض رسالة تأكيد قبل إتمام عملية البيع',
                  ),
                  value: settings.confirmBeforeSale,
                  onChanged: settings.setConfirmBeforeSale,
                ),
              ),

              const SizedBox(height: 24),

              // Application Information
              _buildSectionTitle(
                'حول التطبيق',
                Icons.info_outline,
              ),

              Card(
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.shopping_basket_outlined),
                      title: Text('Grocery POS'),
                      subtitle: Text('نظام إدارة نقاط البيع'),
                    ),
                    const Divider(height: 1),
                    const ListTile(
                      leading: Icon(Icons.code),
                      title: Text('إصدار التطبيق'),
                      subtitle: Text('1.0.0'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _resetSettings(context, settings),
                  icon: const Icon(Icons.restore),
                  label: const Text(
                    'استعادة الإعدادات الافتراضية',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _resetSettings(
    BuildContext context,
    AppSettingsController settings,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('استعادة الإعدادات'),
          content: const Text(
            'هل تريد استعادة جميع الإعدادات إلى قيمها الافتراضية؟',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('استعادة'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    try {
      await settings.resetDefaults();

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تمت استعادة الإعدادات بنجاح'),
        ),
      );
    } catch (_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تعذر حفظ الإعدادات'),
        ),
      );
    }
  }
}
