import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

class XeduleAuthenticatedHttpClient extends http.BaseClient {
  XeduleAuthenticatedHttpClient({required this.authCookies});

  final List<Cookie> authCookies;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    print(authCookies.map((c) => '${c.name}=${c.value}').join('; '));

    request.headers.addAll({
      'Cookie': authCookies.map((c) => '${c.name}=${c.value}').join('; '),
    });
    return request.send();
  }
}