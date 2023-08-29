import 'dart:convert';

import 'package:music_preview_app/models/music.dart';
import 'package:music_preview_app/models/result.dart';
import 'package:music_preview_app/repositories/search_musics.dart';

class SearchMusicController {

   final SearchMusicImpl _repository = SearchMusicImpl();

  Future<List<Music>> getMusic (String term) async {
    var result = await _repository.getMusics(term);
    var decodeResult = Result.fromJson(jsonDecode(result.body));

    print(decodeResult.resultCount);
    return decodeResult.results;
  }
}