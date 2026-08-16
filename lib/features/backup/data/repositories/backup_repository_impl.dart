import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/backup_file.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/google_auth_datasource.dart';
import '../datasources/google_drive_datasource.dart';
import '../datasources/local_backup_datasource.dart';

@LazySingleton(as: BackupRepository)
class BackupRepositoryImpl implements BackupRepository {
  final GoogleAuthDataSource auth;
  final GoogleDriveDataSource drive;
  final LocalBackupDataSource local;
  final AppDatabase database;

  BackupRepositoryImpl(this.auth, this.drive, this.local, this.database);

  Failure _f(Object e) => Failure(e.toString());

  @override
  TaskEither<Failure, Unit> connect() => TaskEither.tryCatch(
        () async {
          await auth.connect();
          return unit;
        },
        (e, s) => _f(e),
      );

  @override
  TaskEither<Failure, Unit> disconnect() => TaskEither.tryCatch(
        () async {
          await auth.disconnect();
          return unit;
        },
        (e, s) => _f(e),
      );

  @override
  TaskEither<Failure, bool> isConnected() =>
      TaskEither.tryCatch(auth.isConnected, (e, s) => _f(e));

  @override
  TaskEither<Failure, List<BackupFile>> getBackups() =>
      TaskEither.tryCatch(drive.listBackups, (e, s) => _f(e));

  @override
  TaskEither<Failure, BackupFile> createBackup() => TaskEither.tryCatch(
        () async {
          await database.customStatement('PRAGMA wal_checkpoint(FULL);');
          final info = await PackageInfo.fromPlatform();
          final zip = await local.createArchive(
            schemaVersion: database.schemaVersion,
            appVersion: info.version,
          );
          try {
            return await drive.uploadBackup(zip);
          } finally {
            await local.deleteIfExists(zip);
          }
        },
        (e, s) => _f(e),
      );

  @override
  TaskEither<Failure, Unit> restoreBackup(String fileId) =>
      TaskEither.tryCatch(
        () async {
          final zip = await drive.downloadBackup(fileId);
          try {
            final extracted = await local.extract(zip);
            try {
              final raw = extracted.manifest['schemaVersion'];
              final version =
                  raw is int ? raw : int.tryParse(raw?.toString() ?? '');

              if (version == null) {
                throw const FormatException('Missing schemaVersion.');
              }
              if (version > database.schemaVersion) {
                throw StateError(
                  'Backup database is newer than this app '
                  '($version > ${database.schemaVersion}).',
                );
              }

              await local.createSafetyCopy();
              await database.close();
              await local.replaceDatabase(extracted.database);
              return unit;
            } finally {
              await local.deleteIfExists(extracted.database);
            }
          } finally {
            await local.deleteIfExists(zip);
          }
        },
        (e, s) => _f(e),
      );

  @override
  TaskEither<Failure, Unit> deleteBackup(String fileId) =>
      TaskEither.tryCatch(
        () async {
          await drive.deleteBackup(fileId);
          return unit;
        },
        (e, s) => _f(e),
      );
}
