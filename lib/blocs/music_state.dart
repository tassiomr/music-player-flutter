part of 'music_bloc.dart';


final class MusicState extends Equatable {
  const MusicState._({
    required this.isLoading,
    required this.music,
    required this.musics,
  });

  final bool isLoading;
  final Music music;
  final List<Music> musics;


  @override
  List<Object> get props => [isLoading, music, musics];
}