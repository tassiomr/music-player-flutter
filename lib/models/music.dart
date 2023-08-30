import 'package:equatable/equatable.dart';

class Music extends Equatable {
  final String artistName;
  final int trackId;
  final String trackName;
  final String cover;
  final String previewSong;
  final String collectionName;
  final String duration;
  const Music({
    required this.artistName,
    required this.trackId,
    required this.trackName,
    required this.cover,
    required this.previewSong,
    required this.collectionName,
    required this.duration,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
        artistName: json['artistName'] ?? "",
        trackId: json['trackId'] ?? "",
        trackName: json['trackName'] ?? "",
        cover: json['artworkUrl100'] ?? "",
        previewSong: json['previewUrl'] ?? "",
        collectionName: json['collectionName'] ?? "",
        duration: Music.parseMillisToTime(json['trackTimeMillis'] ?? 0));
  }

  static String parseMillisToTime(int millis) {
    int totalSeconds = (millis / 1000).round();
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        artistName,
        trackName,
        trackId,
        cover,
        previewSong,
        collectionName,
        duration
      ];
}
