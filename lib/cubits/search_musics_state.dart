part of 'search_musics_cubit.dart';

class SearchMusicState extends Equatable {
  SearchMusicState({
    this.isLoading,
    this.musics,
    this.music,
  });

  bool? isLoading;
  final Music? music;
  List<Music>? musics;

  @override
  List<Object?> get props => [isLoading, music, musics];

  SearchMusicState copyWith({
    bool? isLoading,
    Music? music,
    List<Music>? musics,
  }) {
    return SearchMusicState(
        isLoading: isLoading, music: music, musics: musics);
  }
}
