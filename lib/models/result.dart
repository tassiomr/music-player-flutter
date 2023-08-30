import 'package:equatable/equatable.dart';

import 'music.dart';

class Result extends Equatable{
  final int resultCount;
  final List<Music> results;

  const Result({
    required this.resultCount,
    required this.results,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    List<Music> musics = [];

    List<dynamic> decodedList = json['results'];
    
    int i = 0;
    for(var dynamicItem in decodedList) {
      musics.insert(i, Music.fromJson(dynamicItem));
      i++;
    }

    return Result(
        resultCount: json['resultCount'],
        results: musics
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [resultCount, results];
}