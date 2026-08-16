import 'dart:io';
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
      create: (_) => getIt<BackupBloc>()..add(const BackupEvent.started()),
      child: const _BackupView(),
    );
  }
}

class _BackupView extends StatelessWidget {
  const _BackupView();

  @override
  Widget build(BuildContext context) {
    final platform = Platform.isWindows ? 'Windows' : 'Android';

    return Scaffold(
      appBar: AppBar(title: Text('Google Drive Backup • $platform')),
      body: BlocConsumer<BackupBloc, BackupState>(
        listener: (context, state) {
          final text = state.error ?? state.message;
          if (text != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(text)));
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
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (!state.connected)
                          FilledButton.icon(
                            onPressed: state.loading
                                ? null
                                : () => bloc.add(
                                      const BackupEvent.connectRequested(),
                                    ),
                            icon: const Icon(Icons.login),
                            label: const Text('ربط Google Drive'),
                          ),
                        if (state.connected)
                          FilledButton.icon(
                            onPressed: state.loading
                                ? null
                                : () => bloc.add(
                                      const BackupEvent.createRequested(),
                                    ),
                            icon: const Icon(Icons.cloud_upload),
                            label: const Text('نسخ احتياطي الآن'),
                          ),
                        if (state.connected)
                          OutlinedButton.icon(
                            onPressed: state.loading
                                ? null
                                : () => bloc.add(
                                      const BackupEvent.refreshRequested(),
                                    ),
                            icon: const Icon(Icons.refresh),
                            label: const Text('تحديث'),
                          ),
                        if (state.connected)
                          OutlinedButton.icon(
                            onPressed: state.loading
                                ? null
                                : () => bloc.add(
                                      const BackupEvent.disconnectRequested(),
                                    ),
                            icon: const Icon(Icons.logout),
                            label: const Text('فصل'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: state.backups.isEmpty
                    ? Center(
                        child: Text(
                          state.connected
                              ? 'لا توجد نسخ احتياطية.'
                              : 'اربط Google Drive أولاً.',
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.backups.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, i) {
                          final b = state.backups[i];
                          final date = b.modifiedTime == null
                              ? ''
                              : DateFormat('yyyy-MM-dd HH:mm')
                                  .format(b.modifiedTime!.toLocal());

                          return ListTile(
                            leading: const Icon(Icons.backup),
                            title: Text(b.name),
                            subtitle: Text(date),
                            trailing: PopupMenuButton<String>(
                              onSelected: (value) async {
                                if (value == 'restore') {
                                  final ok = await _confirm(
                                    context,
                                    'استعادة النسخة؟',
                                    'سيتم استبدال قاعدة البيانات. بعد النجاح أعد تشغيل التطبيق.',
                                  );
                                  if (ok && context.mounted) {
                                    bloc.add(
                                      BackupEvent.restoreRequested(b.id),
                                    );
                                  }
                                } else if (value == 'delete') {
                                  final ok = await _confirm(
                                    context,
                                    'حذف النسخة؟',
                                    'سيتم حذف النسخة نهائياً من Google Drive.',
                                  );
                                  if (ok && context.mounted) {
                                    bloc.add(
                                      BackupEvent.deleteRequested(b.id),
                                    );
                                  }
                                }
                              },
                              itemBuilder: (_) => const [
                                PopupMenuItem(
                                  value: 'restore',
                                  child: Text('استعادة'),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('حذف'),
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

  static Future<bool> _confirm(
    BuildContext context,
    String title,
    String body,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('إلغاء'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('موافق'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
