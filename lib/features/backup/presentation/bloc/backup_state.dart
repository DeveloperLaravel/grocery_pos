import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/backup_file.dart';
part 'backup_state.freezed.dart';

@freezed
abstract class BackupState with _$BackupState {
  const factory BackupState({
    @Default(false) bool loading,
    @Default(false) bool connected,
    @Default(<BackupFile>[]) List<BackupFile> backups,
    String? message,
    String? error,
    @Default(false) bool restartRequired,
  }) = _BackupState;
}
