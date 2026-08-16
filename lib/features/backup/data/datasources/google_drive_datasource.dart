import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/backup_file.dart';
import 'google_auth_client.dart';

@lazySingleton
class GoogleDriveDataSource {
  static const String driveAppDataScope =
      'https://www.googleapis.com/auth/drive.appdata';

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _initialized = false;

  /// google_sign_in 7.x initialization.
  Future<void> initialize() async {
    if (_initialized) return;

    await _googleSignIn.initialize();

    _initialized = true;
  }

  /// Opens the Google account chooser/login flow.
  ///
  /// google_sign_in 7.x no longer exposes currentUser in the old way,
  /// so we explicitly authenticate here.
  Future<GoogleSignInAccount> authenticate() async {
    await initialize();

    if (!_googleSignIn.supportsAuthenticate()) {
      throw StateError(
        'Google Sign-In authenticate() is not supported on this platform.',
      );
    }

    final GoogleSignInAccount account =
        await _googleSignIn.authenticate();

    await _ensureDriveAuthorization(account);

    return account;
  }

  /// Checks whether drive.appdata was already granted.
  /// If not, asks the user to grant it.
  Future<GoogleSignInClientAuthorization> _ensureDriveAuthorization(
    GoogleSignInAccount account,
  ) async {
    final authorizationClient = account.authorizationClient;

    GoogleSignInClientAuthorization? authorization =
        await authorizationClient.authorizationForScopes(
      const <String>[driveAppDataScope],
    );

    if (authorization != null) {
      return authorization;
    }

    // IMPORTANT:
    // authorizeScopes() can require user interaction, so call this from
    // an action started by the user (for example "Connect Google Drive").
    authorization = await authorizationClient.authorizeScopes(
      const <String>[driveAppDataScope],
    );

    return authorization;
  }

  /// Builds an authenticated Drive API client.
  ///
  /// authorizationHeaders() is used instead of reading token properties
  /// directly, which keeps this compatible with google_sign_in 7.x.
  Future<drive.DriveApi> _createDriveApi() async {
    final GoogleSignInAccount account = await authenticate();

    final Map<String, String>? headers =
        await account.authorizationClient.authorizationHeaders(
      const <String>[driveAppDataScope],
    );

    if (headers == null) {
      throw StateError(
        'Could not create Google Drive authorization headers.',
      );
    }

    final client = GoogleAuthClient(headers);
    return drive.DriveApi(client);
  }

  Future<String> signedInEmail() async {
    final account = await authenticate();
    return account.email;
  }

  Future<void> signOut() async {
    await initialize();
    await _googleSignIn.signOut();
  }

  Future<void> disconnect() async {
    await initialize();
    await _googleSignIn.disconnect();
  }

  /// Uploads backup ZIP into the hidden application-specific Drive folder.
  Future<BackupFile> uploadBackup(File localFile) async {
    if (!await localFile.exists()) {
      throw StateError(
        'Backup file does not exist: ${localFile.path}',
      );
    }

    final api = await _createDriveApi();

    final metadata = drive.File()
      ..name = p.basename(localFile.path)
      ..parents = const <String>['appDataFolder'];

    final media = drive.Media(
      localFile.openRead(),
      await localFile.length(),
    );

    final drive.File created = await api.files.create(
      metadata,
      uploadMedia: media,
      $fields: 'id,name,size,modifiedTime',
    );

    return _mapDriveFile(created);
  }

  /// Lists Grocery POS backups saved in appDataFolder.
  Future<List<BackupFile>> listBackups() async {
    final api = await _createDriveApi();

    final result = await api.files.list(
      spaces: 'appDataFolder',
      q: "trashed = false and name contains 'grocery_pos_backup_'",
      orderBy: 'modifiedTime desc',
      pageSize: 100,
      $fields: 'files(id,name,size,modifiedTime),nextPageToken',
    );

    return (result.files ?? const <drive.File>[])
        .map(_mapDriveFile)
        .where((file) => file.id.isNotEmpty)
        .toList(growable: false);
  }

  /// Downloads one Drive backup ZIP to the app temporary directory.
  Future<File> downloadBackup(String fileId) async {
    if (fileId.trim().isEmpty) {
      throw ArgumentError.value(
        fileId,
        'fileId',
        'Google Drive file id is empty.',
      );
    }

    final api = await _createDriveApi();

    final Object response = await api.files.get(
      fileId,
      downloadOptions: drive.DownloadOptions.fullMedia,
    );

    if (response is! drive.Media) {
      throw StateError(
        'Google Drive did not return backup file media.',
      );
    }

    final tempDirectory = await getTemporaryDirectory();

    final output = File(
      p.join(
        tempDirectory.path,
        'grocery_pos_restore_$fileId.zip',
      ),
    );

    final sink = output.openWrite();

    try {
      await response.stream.pipe(sink);
    } finally {
      await sink.close();
    }

    if (!await output.exists() || await output.length() == 0) {
      throw StateError(
        'Downloaded Google Drive backup is empty.',
      );
    }

    return output;
  }

  Future<void> deleteBackup(String fileId) async {
    if (fileId.trim().isEmpty) {
      throw ArgumentError.value(
        fileId,
        'fileId',
        'Google Drive file id is empty.',
      );
    }

    final api = await _createDriveApi();
    await api.files.delete(fileId);
  }

  BackupFile _mapDriveFile(drive.File file) {
    return BackupFile(
      id: file.id ?? '',
      name: file.name ?? 'backup.zip',
      modifiedTime: file.modifiedTime,
      sizeBytes: int.tryParse(file.size ?? ''),
    );
  }
}
