import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@lazySingleton
class GoogleAuthDataSource {
  static const driveScope =
      'https://www.googleapis.com/auth/drive.appdata';

  static const windowsClientId =
      '1089929722395-p8v9ts8pqje4jqd3ihv0af2fpl6qqehi.apps.googleusercontent.com';

  static const scopes = <String>[driveScope];

  final GoogleSignIn _signIn = GoogleSignIn.instance;
  static const _storage = FlutterSecureStorage();

  static const _refreshKey = 'grocery_pos_drive_refresh_token';
  static final _authEndpoint =
      Uri.parse('https://accounts.google.com/o/oauth2/v2/auth');
  static final _tokenEndpoint =
      Uri.parse('https://oauth2.googleapis.com/token');

  bool _androidInitialized = false;
  GoogleSignInAccount? _androidAccount;

  String? _windowsAccessToken;
  DateTime? _windowsExpiresAt;

  Future<void> connect() async {
    if (Platform.isAndroid) return _connectAndroid();
    if (Platform.isWindows) return _connectWindows();
    throw UnsupportedError('Backup supports Android and Windows only.');
  }

  Future<void> disconnect() async {
    if (Platform.isAndroid) {
      await _initAndroid();
      _androidAccount = null;
      await _signIn.disconnect();
      return;
    }
    if (Platform.isWindows) {
      _windowsAccessToken = null;
      _windowsExpiresAt = null;
      await _storage.delete(key: _refreshKey);
      return;
    }
    throw UnsupportedError('Backup supports Android and Windows only.');
  }

  Future<bool> isConnected() async {
    if (Platform.isWindows) {
      final token = await _storage.read(key: _refreshKey);
      return token != null && token.isNotEmpty;
    }

    if (Platform.isAndroid) {
      await _initAndroid();
      if (_androidAccount != null) return true;

      final future = _signIn.attemptLightweightAuthentication();
      if (future == null) return false;

      try {
        _androidAccount = await future;
        if (_androidAccount == null) return false;

        final auth = await _androidAccount!
            .authorizationClient
            .authorizationForScopes(scopes);
        return auth != null;
      } catch (_) {
        _androidAccount = null;
        return false;
      }
    }

    return false;
  }

  Future<Map<String, String>> authorizationHeaders() async {
    if (Platform.isAndroid) return _androidHeaders();

    if (Platform.isWindows) {
      final token = await _validWindowsToken();
      return {'Authorization': 'Bearer $token'};
    }

    throw UnsupportedError('Backup supports Android and Windows only.');
  }

  Future<void> _initAndroid() async {
    if (_androidInitialized) return;
    await _signIn.initialize();
    _androidInitialized = true;
  }

  Future<void> _connectAndroid() async {
    await _initAndroid();

    if (!_signIn.supportsAuthenticate()) {
      throw StateError('Google Sign-In is not supported on this Android device.');
    }

    final account = await _signIn.authenticate(scopeHint: scopes);

    var auth = await account.authorizationClient.authorizationForScopes(scopes);
    auth ??= await account.authorizationClient.authorizeScopes(scopes);

    _androidAccount = account;
  }

  Future<GoogleSignInAccount> _androidUser() async {
    await _initAndroid();
    if (_androidAccount != null) return _androidAccount!;

    final future = _signIn.attemptLightweightAuthentication();
    if (future != null) {
      final account = await future;
      if (account != null) {
        _androidAccount = account;
        return account;
      }
    }

    throw StateError('Google Drive غير متصل. اضغط ربط Google Drive أولاً.');
  }

  Future<Map<String, String>> _androidHeaders() async {
    final account = await _androidUser();
    final headers =
        await account.authorizationClient.authorizationHeaders(scopes);

    if (headers == null) {
      throw StateError('صلاحية Google Drive انتهت. أعد ربط الحساب.');
    }
    return headers;
  }

  Future<void> _connectWindows() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final redirect = Uri.parse('http://127.0.0.1:${server.port}');

    final verifier = _random(64);
    final challenge = base64Url
        .encode(sha256.convert(ascii.encode(verifier)).bytes)
        .replaceAll('=', '');
    final state = _random(32);

    final url = _authEndpoint.replace(queryParameters: {
      'client_id': windowsClientId,
      'redirect_uri': redirect.toString(),
      'response_type': 'code',
      'scope': scopes.join(' '),
      'code_challenge': challenge,
      'code_challenge_method': 'S256',
      'state': state,
      'access_type': 'offline',
      'prompt': 'consent',
    });

    final opened =
        await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!opened) {
      await server.close(force: true);
      throw StateError('تعذر فتح متصفح Google.');
    }

    try {
      final request = await server.first.timeout(const Duration(minutes: 5));
      final q = request.uri.queryParameters;

      if (q['state'] != state) {
        await _browserReply(request, false, 'Security validation failed.');
        throw StateError('OAuth state mismatch.');
      }

      if (q['error'] != null) {
        await _browserReply(request, false, 'Google authorization denied.');
        throw StateError('Google OAuth: ${q['error']}');
      }

      final code = q['code'];
      if (code == null || code.isEmpty) {
        await _browserReply(request, false, 'Authorization code missing.');
        throw StateError('Google did not return an authorization code.');
      }

      await _exchangeWindowsCode(code, redirect, verifier);
      await _browserReply(
        request,
        true,
        'Google Drive connected. Return to Grocery POS.',
      );
    } finally {
      await server.close(force: true);
    }
  }

  Future<void> _exchangeWindowsCode(
    String code,
    Uri redirect,
    String verifier,
  ) async {
    final response = await http.post(
      _tokenEndpoint,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': windowsClientId,
        'code': code,
        'code_verifier': verifier,
        'grant_type': 'authorization_code',
        'redirect_uri': redirect.toString(),
      },
    );

    final json = _tokenJson(response);
    final access = json['access_token'] as String?;
    final refresh = json['refresh_token'] as String?;
    final expires = int.tryParse('${json['expires_in'] ?? 3600}') ?? 3600;

    if (access == null || access.isEmpty) {
      throw StateError('Google returned no access token.');
    }

    _windowsAccessToken = access;
    _windowsExpiresAt = DateTime.now().add(Duration(seconds: expires));

    if (refresh != null && refresh.isNotEmpty) {
      await _storage.write(key: _refreshKey, value: refresh);
    }

    final stored = await _storage.read(key: _refreshKey);
    if (stored == null || stored.isEmpty) {
      throw StateError('Google returned no refresh token.');
    }
  }

  Future<String> _validWindowsToken() async {
    if (_windowsAccessToken != null &&
        _windowsExpiresAt != null &&
        DateTime.now().isBefore(
          _windowsExpiresAt!.subtract(const Duration(minutes: 1)),
        )) {
      return _windowsAccessToken!;
    }

    final refresh = await _storage.read(key: _refreshKey);
    if (refresh == null || refresh.isEmpty) {
      throw StateError('Google Drive غير متصل.');
    }

    final response = await http.post(
      _tokenEndpoint,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': windowsClientId,
        'refresh_token': refresh,
        'grant_type': 'refresh_token',
      },
    );

    final json = _tokenJson(response);
    final access = json['access_token'] as String?;
    final expires = int.tryParse('${json['expires_in'] ?? 3600}') ?? 3600;

    if (access == null || access.isEmpty) {
      throw StateError('Could not refresh Google access token.');
    }

    _windowsAccessToken = access;
    _windowsExpiresAt = DateTime.now().add(Duration(seconds: expires));
    return access;
  }

  Map<String, dynamic> _tokenJson(http.Response response) {
    final decoded = jsonDecode(response.body);
    final data = decoded is Map<String, dynamic>
        ? decoded
        : <String, dynamic>{};

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError(
        'Google OAuth failed (${response.statusCode}): '
        '${data['error_description'] ?? data['error'] ?? response.body}',
      );
    }
    return data;
  }

  Future<void> _browserReply(
    HttpRequest request,
    bool success,
    String message,
  ) async {
    request.response.headers.contentType = ContentType.html;
    request.response.write(
      '<!doctype html><html><head><meta charset="utf-8">'
      '<title>Grocery POS</title></head><body style="font-family:Segoe UI;padding:40px">'
      '<h2>${success ? 'Connected' : 'Error'}</h2><p>$message</p>'
      '<p>You can close this window.</p></body></html>',
    );
    await request.response.close();
  }

  String _random(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final rnd = Random.secure();
    return List.generate(
      length,
      (_) => chars[rnd.nextInt(chars.length)],
    ).join();
  }
}
