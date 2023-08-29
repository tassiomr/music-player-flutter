import 'package:http/http.dart' as http;
import 'package:music_preview_app/repositories/search_musics_interface.dart';

import '../services/network.dart';

class SearchMusicImpl extends ISearchResult {
  @override
  Future<http.Response> getMusics(String term) async {
    return await Network().getData("https://itunes.apple.com/search?term=$term&limit=10&entity=song");
  }
}