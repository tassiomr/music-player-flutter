import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_preview_app/models/result.dart';
import 'package:music_preview_app/repositories/search_musics.dart';
import '../models/music.dart';

part 'search_musics_state.dart';

class SearchMusicsCubit extends Cubit<SearchMusicState> {
  SearchMusicsCubit(this._musicRepository)
      : super(SearchMusicState(
            isLoading: false, musics: List<Music>.empty(), music: null));
  final SearchMusicImpl _musicRepository;

  void selectMusic(Music music) {
    emit(state.copyWith(
        isLoading: state.isLoading,
        music: music,
        musics: state.musics));
  }

  Future<void> requestMusics(String term) async {
    var result = await _musicRepository.getMusics(term);

    emit(state.copyWith(
        isLoading: true, music: state.music, musics: state.musics));
    var decoded = Result.fromJson(jsonDecode(result.body));
    emit(state.copyWith(
        isLoading: false, musics: decoded.results, music: state.music));
  }
}
