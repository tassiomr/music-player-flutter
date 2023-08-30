part of 'search_musics_cubit.dart';

class SearchMusicState extends Equatable {
  const SearchMusicState(
      {this.repeat = Icons.repeat,
      this.favorite = Icons.favorite,
      this.playPause = Icons.pause,
      this.isLoading = false,
      required this.musics,
      this.music,
      this.audioPlayer});

  final AudioPlayer? audioPlayer;
  final bool isLoading;
  final Music? music;
  final List<Music> musics;
  final IconData favorite;
  final IconData playPause;
  final IconData repeat;

  @override
  List<Object?> get props =>
      [isLoading, music, musics, audioPlayer, favorite, playPause, repeat];

  SearchMusicState copyWith({
    IconData? favorite,
    IconData? repeat,
    IconData? playPause,
    bool? isLoading,
    Music? music,
    List<Music>? musics,
    AudioPlayer? audioPlayer,
  }) {
    var sm = SearchMusicState(
      repeat: repeat ?? this.repeat,
      favorite: favorite ?? this.favorite,
      playPause: playPause ?? this.playPause,
      isLoading: isLoading ?? this.isLoading,
      musics: musics ?? this.musics,
      music: music ?? this.music,
      audioPlayer: audioPlayer ?? this.audioPlayer,
    );

    return sm;
  }
}
