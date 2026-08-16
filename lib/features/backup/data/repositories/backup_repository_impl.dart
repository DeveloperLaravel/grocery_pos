import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/backup_file.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/google_drive_datasource.dart';
import '../datasources/local_backup_datasource.dart';

@LazySingleton(as: BackupRepository)
class BackupRepositoryImpl implements BackupRepository {
  final GoogleDriveDataSource drive;
  final LocalBackupDataSource local;
  final AppDatabase database;

  BackupRepositoryImpl(
    this.drive,
    this.local,
    this.database,
  );

  Failure _failure(Object error) => Failure(error.toString());

  @override
  TaskEither<Failure, String> signIn() {
    return TaskEither.tryCatch(
      drive.signedInEmail,
      (error, stackTrace) => _failure(error),
    );
  }

  @override
  TaskEither<Failure, Unit> signOut() {
    return TaskEither.tryCatch(
      () async {
        await drive.signOut();
        return unit;
      },
      (error, stackTrace) => _failure(error),
    );
  }

  @override
  TaskEither<Failure, List<BackupFile>> getBackups() {
    return TaskEither.tryCatch(
      drive.listBackups,
      (error, stackTrace) => _failure(error),
    );
  }

  @override
  TaskEither<Failure, BackupFile> createBackup() {
    return TaskEither.tryCatch(
      () async {
        // Ensures WAL content is flushed to the main SQLite file.
        await database.customStatement('PRAGMA wal_checkpoint(FULL);');

        final package = await PackageInfo.fromPlatform();

        final archive = await local.createBackupArchive(
          schemaVersion: database.schemaVersion,
          appVersion: package.version,
        );

        try {
          return await drive.uploadBackup(archive);
        } finally {
          if (await archive.exists()) {
            await archive.delete();
          }
        }
      },
      (error, stackTrace) => _failure(error),
    );
  }

  @override
  TaskEither<Failure, Unit> restoreBackup(String fileId) {
    return TaskEither.tryCatch(
      () async {
        final zip = await drive.downloadBackup(fileId);

        try {
          final extracted = await local.extractAndValidateBackup(zip);

          final backupSchemaVersion =
              extracted.manifest['schemaVersion'] as int?;

          if (backupSchemaVersion == null) {
            throw const FormatException(
              'Backup schemaVersion is missing',
            );
          }

          if (backupSchemaVersion > database.schemaVersion) {
            throw StateError(
              'This backup was created by a newer database version '
              '($backupSchemaVersion > ${database.schemaVersion}).',
            );
          }

          await local.createSafetyCopy();

          // IMPORTANT:
          // All services using this AppDatabase instance become invalid
          // after this point. The app must be restarted immediately.
          await database.close();

          await local.replaceDatabase(extracted.database);

          if (await extracted.database.exists()) {
            await extracted.database.delete();
          }

          return unit;
        } finally {
          if (await zip.exists()) {
            await zip.delete();
          }
        }
      },
      (error, stackTrace) => _failure(error),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteBackup(String fileId) {
    return TaskEither.tryCatch(
      () async {
        await drive.deleteBackup(fileId);
        return unit;
      },
      (error, stackTrace) => _failure(error),
    );
  }
}
