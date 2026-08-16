import 'package:freezed_annotation/freezed_annotation.dart';
part 'backup_event.freezed.dart';

@freezed
sealed class BackupEvent with _$BackupEvent {
  const factory BackupEvent.started() = BackupStarted;
  const factory BackupEvent.connectRequested() = BackupConnectRequested;
  const factory BackupEvent.disconnectRequested() = BackupDisconnectRequested;
  const factory BackupEvent.refreshRequested() = BackupRefreshRequested;
  const factory BackupEvent.createRequested() = BackupCreateRequested;
  const factory BackupEvent.restoreRequested(String id) = BackupRestoreRequested;
  const factory BackupEvent.deleteRequested(String id) = BackupDeleteRequested;
}
