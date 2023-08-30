import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_preview_app/models/result.dart';
import 'package:music_preview_app/repositories/search_musics.dart';
import '../models/music.dart';

part 'search_musics_state.dart';

class SearchMusicsCubit extends Cubit<SearchMusicState> {
  SearchMusicsCubit(this._musicRepository)
      : super(SearchMusicState(musics: List<Music>.empty()));
  final SearchMusicImpl _musicRepository;

  void selectMusic(Music music) {
    if (state.audioPlayer != null) {
      state.audioPlayer?.dispose();
    }

    var audioPlayer = AudioPlayer();
    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(music.previewSong)),
    ]));

    audioPlayer.play();

    emit(state.copyWith(
      playPause: Icons.pause,
      audioPlayer: audioPlayer,
      music: music,
    ));
  }

  Future<void> requestMusics(String term) async {
    var result = await _musicRepository.getMusics(term);

    emit(state.copyWith(isLoading: false));

    var decoded = Result.fromJson(jsonDecode(result.body));

    emit(state.copyWith(isLoading: false, musics: decoded.results));
  }

  void setFavorite(Music music) {
    IconData icon;
    if (state.favorite == Icons.favorite_outline) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_outline;
    }

    emit(state.copyWith(favorite: icon));
  }

  void actionPlayPause() {
    IconData icon;
    if (state.audioPlayer!.playing) {
      icon = Icons.play_arrow;
      emit(state.copyWith(playPause: icon));
      state.audioPlayer!.pause();
    } else {
      icon = Icons.pause;
      emit(state.copyWith(playPause: icon));
      state.audioPlayer!.play();
    }
  }
}
