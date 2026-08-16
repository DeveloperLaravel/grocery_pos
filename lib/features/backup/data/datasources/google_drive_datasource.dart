import 'dart:io';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/backup_file.dart';
import 'google_auth_datasource.dart';
import 'google_auth_http_client.dart';

@lazySingleton
class GoogleDriveDataSource {
  final GoogleAuthDataSource auth;

  GoogleDriveDataSource(this.auth);

  /// ينشئ HTTP Client و DriveApi،
  /// ثم يغلق الـ Client بشكل صحيح بعد انتهاء العملية.
  Future<T> _withApi<T>(
    Future<T> Function(drive.DriveApi api) action,
  ) async {
    if (!await auth.isConnected()) {
      throw StateError(
        'Google Drive غير متصل. قم بربط الحساب أولاً.',
      );
    }

    final client = GoogleAuthHttpClient(auth);
    final api = drive.DriveApi(client);

    try {
      return await action(api);
    } finally {
      client.close();
    }
  }

  /// رفع Backup إلى Google Drive appDataFolder
  Future<BackupFile> uploadBackup(
    File localFile,
  ) {
    return _withApi((api) async {
      if (!await localFile.exists()) {
        throw StateError(
          'ملف النسخة الاحتياطية غير موجود: ${localFile.path}',
        );
      }

      final length = await localFile.length();

      if (length <= 0) {
        throw StateError(
          'ملف النسخة الاحتياطية فارغ.',
        );
      }

      final metadata = drive.File()
        ..name = p.basename(localFile.path)
        ..parents = const <String>[
          'appDataFolder',
        ];

      final media = drive.Media(
        localFile.openRead(),
        length,
      );

      final uploaded = await api.files.create(
        metadata,
        uploadMedia: media,
        $fields: 'id,name,size,modifiedTime',
      );

      if (uploaded.id == null ||
          uploaded.id!.isEmpty) {
        throw StateError(
          'تم الرفع ولكن Google Drive لم يرجع File ID.',
        );
      }

      return _mapFile(uploaded);
    });
  }

  /// جلب قائمة النسخ الاحتياطية
  Future<List<BackupFile>> listBackups() {
    return _withApi((api) async {
      final backups = <BackupFile>[];

      String? pageToken;

      do {
        final result = await api.files.list(
          spaces: 'appDataFolder',
          // ignore: prefer_single_quotes
          q: "trashed = false "
              "and name contains 'grocery_pos_backup_'",
          orderBy: 'modifiedTime desc',
          pageSize: 100,
          pageToken: pageToken,
          $fields:
              'nextPageToken,files(id,name,size,modifiedTime)',
        );

        final files =
            result.files ?? const <drive.File>[];

        backups.addAll(
          files
              .where(
                (file) =>
                    file.id != null &&
                    file.id!.isNotEmpty,
              )
              .map(_mapFile),
        );

        pageToken = result.nextPageToken;
      } while (
          pageToken != null && pageToken.isNotEmpty);

      return backups;
    });
  }

  /// تنزيل Backup من Google Drive
  Future<File> downloadBackup(
    String fileId,
  ) {
    return _withApi((api) async {
      if (fileId.trim().isEmpty) {
        throw ArgumentError(
          'Google Drive File ID فارغ.',
        );
      }

      final response = await api.files.get(
        fileId,
        downloadOptions:
            drive.DownloadOptions.fullMedia,
      );

      if (response is! drive.Media) {
        throw StateError(
          'Google Drive لم يرجع بيانات الملف.',
        );
      }

      final tempDirectory =
          await getTemporaryDirectory();

      final outputFile = File(
        p.join(
          tempDirectory.path,
          'grocery_pos_restore_'
          '${DateTime.now().millisecondsSinceEpoch}.zip',
        ),
      );

      final sink = outputFile.openWrite();

      try {
        await response.stream.pipe(sink);
      } finally {
        await sink.close();
      }

      if (!await outputFile.exists()) {
        throw StateError(
          'فشل إنشاء ملف النسخة بعد التنزيل.',
        );
      }

      final length =
          await outputFile.length();

      if (length <= 0) {
        await outputFile.delete();

        throw StateError(
          'النسخة التي تم تنزيلها فارغة.',
        );
      }

      return outputFile;
    });
  }

  /// حذف Backup من Google Drive
  ///
  /// ملاحظة:
  /// ملفات appDataFolder يتم حذفها نهائياً.
  Future<void> deleteBackup(
    String fileId,
  ) {
    return _withApi((api) async {
      if (fileId.trim().isEmpty) {
        throw ArgumentError(
          'Google Drive File ID فارغ.',
        );
      }

      await api.files.delete(
        fileId,
      );
    });
  }

  /// التحقق من وجود Backup
Future<bool> backupExists(String fileId) {
  return _withApi((api) async {
    if (fileId.trim().isEmpty) {
      return false;
    }

    try {
      final file = await api.files.get(
        fileId,
        $fields: 'id',
      );

      if (file is! drive.File) {
        return false;
      }

      return file.id?.isNotEmpty == true;
    } catch (_) {
      return false;
    }
  });
}

  /// تحويل Google Drive File إلى Entity
  BackupFile _mapFile(
    drive.File file,
  ) {
    return BackupFile(
      id: file.id ?? '',
      name:
          file.name ?? 'grocery_pos_backup.zip',
      modifiedTime: file.modifiedTime,
      sizeBytes: _parseSize(
        file.size,
      ),
    );
  }

  int? _parseSize(
    String? value,
  ) {
    if (value == null ||
        value.isEmpty) {
      return null;
    }

    return int.tryParse(value);
  }
}