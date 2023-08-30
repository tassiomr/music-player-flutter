part of 'music_bloc.dart';

sealed class MusicEvent {
  const MusicEvent();
}

final class _ListMusicRequest extends MusicEvent {
  const _ListMusicRequest(this.musics);

  final List<Music> musics;
}

final class _MusicChanged extends MusicEvent {
  const _MusicChanged(this.music);

  final Music music;
}

