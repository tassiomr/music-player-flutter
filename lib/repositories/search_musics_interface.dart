import 'package:http/http.dart' as http;

abstract class ISearchResult {
  Future<http.Response>getMusics(String term);
}