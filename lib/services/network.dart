import 'package:http/http.dart' as http;

class Network {
  Future<http.Response> getData (String uri) async {
    return http.get(Uri.parse(uri));
  }
}
