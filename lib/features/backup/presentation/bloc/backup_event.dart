import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_event.freezed.dart';

@freezed
sealed class BackupEvent with _$BackupEvent {
  const factory BackupEvent.started() = BackupStarted;
  const factory BackupEvent.signInRequested() = BackupSignInRequested;
  const factory BackupEvent.signOutRequested() = BackupSignOutRequested;
  const factory BackupEvent.createRequested() = BackupCreateRequested;
  const factory BackupEvent.restoreRequested(String fileId) =
      BackupRestoreRequested;
  const factory BackupEvent.deleteRequested(String fileId) =
      BackupDeleteRequested;
  const factory BackupEvent.refreshRequested() = BackupRefreshRequested;
}
