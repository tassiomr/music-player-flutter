import 'package:http/http.dart' as http;

class Network {
  Future<http.Response> getData (String uri) async {
    return await http.get(Uri.parse(uri));
  }
}
