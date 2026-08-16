// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

/// HTTP client that attaches Google OAuth authorization headers
/// to every Google Drive request.
class GoogleAuthClient extends http.BaseClient {
  GoogleAuthClient(
    this._headers, {
    http.Client? inner,
  }) : _inner = inner ?? http.Client();

  final Map<String, String> _headers;
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}
