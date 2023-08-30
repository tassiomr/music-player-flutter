import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_preview_app/models/music.dart';
import 'package:music_preview_app/repositories/search_musics.dart';

part 'music_state.dart';
part 'music_event.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc({
    required SearchMusicImpl musicRepository,}) : _musicRepository = musicRepository, super(MusicState as MusicState) {
    on<_MusicChanged>(_onMusicChange);
  }

  final SearchMusicImpl _musicRepository;
  late final StreamSubscription<Music> _musicSubscription;

  void _onMusicChange (_MusicChanged event, Emitter<MusicState> emit) {
    emit(state);
  }

  @override
  Future<void> close() {
    _musicSubscription.cancel();
    return super.close();
  }
}
