// ignore: implementation_imports
import 'package:fpdart/src/task_either.dart';
// ignore: implementation_imports
import 'package:fpdart/src/unit.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/backup/domain/entities/backup_file.dart';
import 'package:injectable/injectable.dart';
import '../repositories/backup_repository.dart';

@injectable
class ConnectGoogleDrive {
  final BackupRepository repository;
  ConnectGoogleDrive(this.repository);
  TaskEither<Failure, Unit> call() => repository.connect();
}

@injectable
class DisconnectGoogleDrive {
  final BackupRepository repository;
  DisconnectGoogleDrive(this.repository);
  // ignore: always_declare_return_types
  TaskEither<Failure, Unit> call() => repository.disconnect();
}

@injectable
class IsGoogleDriveConnected {
  final BackupRepository repository;
  IsGoogleDriveConnected(this.repository);
  // ignore: always_declare_return_types
  TaskEither<Failure, bool> call() => repository.isConnected();
}

@injectable
class GetBackups {
  final BackupRepository repository;
  GetBackups(this.repository);
  TaskEither<Failure, List<BackupFile>> call() => repository.getBackups();
}

@injectable
class CreateBackup {
  final BackupRepository repository;
  CreateBackup(this.repository);
  TaskEither<Failure, BackupFile> call() => repository.createBackup();
}

@injectable
class RestoreBackup {
  final BackupRepository repository;
  RestoreBackup(this.repository);
  TaskEither<Failure, Unit> call(String id) => repository.restoreBackup(id);
}

@injectable
class DeleteBackup {
  final BackupRepository repository;
  DeleteBackup(this.repository);
  TaskEither<Failure, Unit> call(String id) => repository.deleteBackup(id);
}
