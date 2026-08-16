import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:archive/archive_io.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@lazySingleton
class LocalBackupDataSource {
  /// IMPORTANT:
  /// Change this if your Drift database uses another file name.
  static const String databaseFileName = 'grocery_pos.sqlite';

  static const String manifestFileName = 'manifest.json';

  Future<File> getDatabaseFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File(
      p.join(
        directory.path,
        databaseFileName,
      ),
    );
  }

  Future<File> createBackupArchive({
    required int schemaVersion,
    required String appVersion,
  }) async {
    final database = await getDatabaseFile();

    if (!await database.exists()) {
      throw StateError(
        'SQLite database not found: ${database.path}',
      );
    }

    final databaseBytes = await database.readAsBytes();

    if (databaseBytes.isEmpty) {
      throw StateError(
        'SQLite database is empty: ${database.path}',
      );
    }

    final manifest = <String, dynamic>{
      'type': 'grocery_pos_backup',
      'schemaVersion': schemaVersion,
      'appVersion': appVersion,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'databaseFile': databaseFileName,
      'databaseSize': databaseBytes.length,
    };

    final manifestBytes = utf8.encode(
      jsonEncode(manifest),
    );

    final archive = Archive()
      ..addFile(
        ArchiveFile(
          databaseFileName,
          databaseBytes.length,
          databaseBytes,
        ),
      )
      ..addFile(
        ArchiveFile(
          manifestFileName,
          manifestBytes.length,
          manifestBytes,
        ),
      );

    final zipBytes = ZipEncoder().encode(archive);

    // ignore: unnecessary_null_comparison
    if (zipBytes == null || zipBytes.isEmpty) {
      throw StateError(
        'Could not create backup ZIP.',
      );
    }

    final tempDirectory = await getTemporaryDirectory();

    final timestamp = DateTime.now()
        .toUtc()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-');

    final output = File(
      p.join(
        tempDirectory.path,
        'grocery_pos_backup_$timestamp.zip',
      ),
    );

    await output.writeAsBytes(
      zipBytes,
      flush: true,
    );

    return output;
  }

  Future<BackupExtractResult> extractAndValidateBackup(
    File zipFile,
  ) async {
    if (!await zipFile.exists()) {
      throw StateError(
        'Backup ZIP not found: ${zipFile.path}',
      );
    }

    final zipBytes = await zipFile.readAsBytes();

    if (zipBytes.isEmpty) {
      throw const FormatException(
        'Backup ZIP is empty.',
      );
    }

    final archive = ZipDecoder().decodeBytes(
      zipBytes,
      verify: true,
    );

    ArchiveFile? databaseEntry;
    ArchiveFile? manifestEntry;

    for (final entry in archive.files) {
      if (!entry.isFile) continue;

      final fileName = p.basename(entry.name);

      if (fileName == databaseFileName) {
        databaseEntry = entry;
      }

      if (fileName == manifestFileName) {
        manifestEntry = entry;
      }
    }

    if (databaseEntry == null) {
      throw const FormatException(
        'Backup does not contain grocery_pos.sqlite.',
      );
    }

    if (manifestEntry == null) {
      throw const FormatException(
        'Backup does not contain manifest.json.',
      );
    }

    final manifestContent =
        manifestEntry.content as List<int>;

    final decodedManifest = jsonDecode(
      utf8.decode(manifestContent),
    );

    if (decodedManifest is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid backup manifest.',
      );
    }

    if (decodedManifest['type'] !=
        'grocery_pos_backup') {
      throw const FormatException(
        'This file is not a Grocery POS backup.',
      );
    }

    final databaseBytes =
        databaseEntry.content as List<int>;

    if (databaseBytes.length < 100) {
      throw const FormatException(
        'Backup database is invalid or too small.',
      );
    }

    final temporaryDirectory =
        await getTemporaryDirectory();

    final extractedDatabase = File(
      p.join(
        temporaryDirectory.path,
        'restore_${DateTime.now().millisecondsSinceEpoch}_$databaseFileName',
      ),
    );

    await extractedDatabase.writeAsBytes(
      databaseBytes,
      flush: true,
    );

    return BackupExtractResult(
      database: extractedDatabase,
      manifest: decodedManifest,
    );
  }

  /// Creates a local safety copy before replacing the current database.
  Future<File?> createSafetyCopy() async {
    final database = await getDatabaseFile();

    if (!await database.exists()) {
      return null;
    }

    final directory =
        await getApplicationDocumentsDirectory();

    final timestamp = DateTime.now()
        .toUtc()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-');

    final safetyCopy = File(
      p.join(
        directory.path,
        'grocery_pos_before_restore_$timestamp.sqlite',
      ),
    );

    await database.copy(safetyCopy.path);

    return safetyCopy;
  }

  /// Replaces the current SQLite file.
  ///
  /// AppDatabase must be closed BEFORE calling this.
  Future<void> replaceDatabase(
    File restoredDatabase,
  ) async {
    if (!await restoredDatabase.exists()) {
      throw StateError(
        'Restored SQLite file does not exist.',
      );
    }

    final target = await getDatabaseFile();

    if (!await target.parent.exists()) {
      await target.parent.create(
        recursive: true,
      );
    }

    await restoredDatabase.copy(target.path);

    if (!await target.exists() ||
        await target.length() == 0) {
      throw StateError(
        'Could not replace SQLite database.',
      );
    }
  }

  Future<void> deleteTemporaryFile(
    File? file,
  ) async {
    if (file == null) return;

    if (await file.exists()) {
      await file.delete();
    }
  }
}

class BackupExtractResult {
  const BackupExtractResult({
    required this.database,
    required this.manifest,
  });

  final File database;
  final Map<String, dynamic> manifest;
}
