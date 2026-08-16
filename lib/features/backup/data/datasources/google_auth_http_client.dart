// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'google_auth_datasource.dart';

class GoogleAuthHttpClient extends http.BaseClient {
  final GoogleAuthDataSource auth;
  final http.Client _inner;

  GoogleAuthHttpClient(this.auth, {http.Client? inner})
      : _inner = inner ?? http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll(await auth.authorizationHeaders());
    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}
