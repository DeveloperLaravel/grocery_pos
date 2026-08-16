import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import 'bloc/backup_bloc.dart';
import 'bloc/backup_event.dart';
import 'bloc/backup_state.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BackupBloc>()
        ..add(const BackupEvent.started()),
      child: const _BackupView(),
    );
  }
}

class _BackupView extends StatelessWidget {
  const _BackupView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النسخ الاحتياطي'),
      ),
      body: BlocConsumer<BackupBloc, BackupState>(
        listenWhen: (previous, current) =>
            previous.message != current.message ||
            previous.error != current.error ||
            previous.restartRequired != current.restartRequired,
        listener: (context, state) {
          final text = state.error ?? state.message;

          if (text != null && text.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(text)),
              );
          }

          if (state.restartRequired) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('إعادة تشغيل مطلوبة'),
                  content: const Text(
                    'تم استبدال قاعدة البيانات بنجاح. '
                    'أغلق التطبيق وافتحه من جديد قبل تنفيذ أي عملية بيع أو تعديل مخزون.',
                  ),
                  actions: [
                    FilledButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('حسناً'),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<BackupBloc>();

          return Column(
            children: [
              if (state.loading) const LinearProgressIndicator(),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(
                              state.email == null
                                  ? Icons.cloud_off
                                  : Icons.cloud_done,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.email == null
                                    ? 'Google Drive غير متصل'
                                    : 'متصل: ${state.email}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            FilledButton.icon(
                              onPressed: state.loading
                                  ? null
                                  : () => bloc.add(
                                        const BackupEvent
                                            .signInRequested(),
                                      ),
                              icon: const Icon(Icons.login),
                              label:
                                  const Text('اتصال Google'),
                            ),
                            FilledButton.icon(
                              onPressed: state.loading
                                  ? null
                                  : () => bloc.add(
                                        const BackupEvent
                                            .createRequested(),
                                      ),
                              icon:
                                  const Icon(Icons.cloud_upload),
                              label:
                                  const Text('نسخ احتياطي الآن'),
                            ),
                            OutlinedButton.icon(
                              onPressed: state.loading
                                  ? null
                                  : () => bloc.add(
                                        const BackupEvent
                                            .refreshRequested(),
                                      ),
                              icon: const Icon(Icons.refresh),
                              label: const Text('تحديث'),
                            ),
                            if (state.email != null)
                              OutlinedButton.icon(
                                onPressed: state.loading
                                    ? null
                                    : () => bloc.add(
                                          const BackupEvent
                                              .signOutRequested(),
                                        ),
                                icon: const Icon(Icons.logout),
                                label:
                                    const Text('تسجيل الخروج'),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: state.backups.isEmpty
                    ? const Center(
                        child:
                            Text('لا توجد نسخ احتياطية'),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          16,
                          0,
                          16,
                          16,
                        ),
                        itemCount: state.backups.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final backup =
                              state.backups[index];

                          final date =
                              backup.modifiedTime == null
                                  ? 'بدون تاريخ'
                                  : DateFormat(
                                      'yyyy-MM-dd HH:mm',
                                    ).format(
                                      backup.modifiedTime!
                                          .toLocal(),
                                    );

                          final size = backup.sizeBytes == null
                              ? ''
                              : _formatBytes(
                                  backup.sizeBytes!,
                                );

                          return ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.backup),
                            ),
                            title: Text(backup.name),
                            subtitle: Text(
                              size.isEmpty
                                  ? date
                                  : '$date • $size',
                            ),
                            trailing:
                                PopupMenuButton<String>(
                              onSelected: (value) async {
                                if (value == 'restore') {
                                  final confirmed =
                                      await _confirmRestore(
                                    context,
                                  );

                                  if (confirmed &&
                                      context.mounted) {
                                    bloc.add(
                                      BackupEvent
                                          .restoreRequested(
                                        backup.id,
                                      ),
                                    );
                                  }
                                }

                                if (value == 'delete') {
                                  final confirmed =
                                      await _confirmDelete(
                                    // ignore: use_build_context_synchronously
                                    context,
                                  );

                                  if (confirmed &&
                                      context.mounted) {
                                    bloc.add(
                                      BackupEvent
                                          .deleteRequested(
                                        backup.id,
                                      ),
                                    );
                                  }
                                }
                              },
                              itemBuilder: (_) => const [
                                PopupMenuItem(
                                  value: 'restore',
                                  child: Row(
                                    children: [
                                      Icon(Icons.restore),
                                      SizedBox(width: 8),
                                      Text('استعادة'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_outline),
                                      SizedBox(width: 8),
                                      Text('حذف'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Future<bool> _confirmRestore(
    BuildContext context,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('استعادة النسخة؟'),
              content: const Text(
                'سيتم حفظ نسخة أمان محلية من البيانات الحالية، '
                'ثم استبدال قاعدة البيانات بالنسخة المختارة. '
                'بعد النجاح يجب إعادة تشغيل التطبيق.',
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context, false),
                  child: const Text('إلغاء'),
                ),
                FilledButton(
                  onPressed: () =>
                      Navigator.pop(context, true),
                  child: const Text('استعادة'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static Future<bool> _confirmDelete(
    BuildContext context,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('حذف النسخة؟'),
              content: const Text(
                'سيتم حذف النسخة نهائياً من مساحة التطبيق في Google Drive.',
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context, false),
                  child: const Text('إلغاء'),
                ),
                FilledButton(
                  onPressed: () =>
                      Navigator.pop(context, true),
                  child: const Text('حذف'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';

    final kb = bytes / 1024;
    if (kb < 1024) {
      return '${kb.toStringAsFixed(1)} KB';
    }

    final mb = kb / 1024;
    return '${mb.toStringAsFixed(1)} MB';
  }
}
