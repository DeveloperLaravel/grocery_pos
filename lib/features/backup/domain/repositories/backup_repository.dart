import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/backup_file.dart';

abstract interface class BackupRepository {
  TaskEither<Failure, Unit> connect();
  TaskEither<Failure, Unit> disconnect();
  TaskEither<Failure, bool> isConnected();
  TaskEither<Failure, List<BackupFile>> getBackups();
  TaskEither<Failure, BackupFile> createBackup();
  TaskEither<Failure, Unit> restoreBackup(String fileId);
  TaskEither<Failure, Unit> deleteBackup(String fileId);
}
