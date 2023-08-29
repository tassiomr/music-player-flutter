import 'package:http/http.dart' as http;
import 'package:music_preview_app/models/music.dart';
import 'package:music_preview_app/repositories/search_musics.dart';
import 'package:music_preview_app/services/network.dart';

class SearchController {
   final SearchMusicImpl _repository = SearchMusicImpl();

  List getMusic (String term) {
    var result = _repository.getMusics(term);
    return [];
  }
}