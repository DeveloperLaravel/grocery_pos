import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:archive/archive_io.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@lazySingleton
class LocalBackupDataSource {
  static const databaseName = 'grocery_pos';
  static const databaseFileName = '$databaseName.sqlite';
  static const manifestFileName = 'manifest.json';

  Future<File> databaseFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, databaseFileName));
  }

  Future<File> createArchive({
    required int schemaVersion,
    required String appVersion,
  }) async {
    final db = await databaseFile();
    if (!await db.exists()) {
      throw StateError('Database not found: ${db.path}');
    }

    final bytes = await db.readAsBytes();
    final manifest = utf8.encode(jsonEncode({
      'type': 'grocery_pos_backup',
      'formatVersion': 1,
      'schemaVersion': schemaVersion,
      'appVersion': appVersion,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'databaseFile': databaseFileName,
      'sourcePlatform': Platform.operatingSystem,
      'databaseSize': bytes.length,
    }));

    final archive = Archive()
      ..addFile(ArchiveFile(databaseFileName, bytes.length, bytes))
      ..addFile(ArchiveFile(manifestFileName, manifest.length, manifest));

    final zip = ZipEncoder().encode(archive);
    // ignore: unnecessary_null_comparison
    if (zip == null) throw StateError('Could not create backup ZIP.');

    final temp = await getTemporaryDirectory();
    final stamp = DateTime.now()
        .toUtc()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-');

    final output = File(p.join(temp.path, 'grocery_pos_backup_$stamp.zip'));
    await output.writeAsBytes(zip, flush: true);
    return output;
  }

  Future<BackupExtractResult> extract(File zip) async {
    final archive =
        ZipDecoder().decodeBytes(await zip.readAsBytes(), verify: true);

    ArchiveFile? dbEntry;
    ArchiveFile? manifestEntry;

    for (final entry in archive.files) {
      if (!entry.isFile) continue;
      final name = p.basename(entry.name);
      if (name == databaseFileName) dbEntry = entry;
      if (name == manifestFileName) manifestEntry = entry;
    }

    if (dbEntry == null || manifestEntry == null) {
      throw const FormatException('Invalid Grocery POS backup.');
    }

    final manifest = jsonDecode(
      utf8.decode(manifestEntry.content as List<int>),
    ) as Map<String, dynamic>;

    if (manifest['type'] != 'grocery_pos_backup') {
      throw const FormatException('Invalid backup type.');
    }

    final temp = await getTemporaryDirectory();
    final out = File(
      p.join(temp.path, 'restored_${DateTime.now().millisecondsSinceEpoch}.sqlite'),
    );
    await out.writeAsBytes(dbEntry.content as List<int>, flush: true);

    return BackupExtractResult(database: out, manifest: manifest);
  }

  Future<File?> createSafetyCopy() async {
    final db = await databaseFile();
    if (!await db.exists()) return null;

    final dir = await getApplicationDocumentsDirectory();
    final stamp = DateTime.now()
        .toUtc()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-');

    return db.copy(
      p.join(dir.path, 'grocery_pos_before_restore_$stamp.sqlite'),
    );
  }

  Future<void> replaceDatabase(File restored) async {
    final target = await databaseFile();
    await restored.copy(target.path);
  }

  Future<void> deleteIfExists(File? file) async {
    if (file != null && await file.exists()) await file.delete();
  }
}

class BackupExtractResult {
  final File database;
  final Map<String, dynamic> manifest;

  const BackupExtractResult({
    required this.database,
    required this.manifest,
  });
}
