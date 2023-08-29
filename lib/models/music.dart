class Music {
  final String artistName;
  final int trackId;
  final String trackName;
  final String folderUri;
  final String previewSong;
  final String collectionName;
  final String duration;
  const Music({
    required this.artistName,
    required this.trackId,
    required this.trackName,
    required this.folderUri,
    required this.previewSong,
    required this.collectionName,
    required this.duration,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      artistName: json['artistName']??"",
      trackId: json['trackId']??"",
      trackName: json['trackName']??"",
      folderUri: json['artworkUrl100']??"",
      previewSong: json['previewUrl']??"",
      collectionName: json['collectionName']??"",
      duration: Music.parseMillisToTime(json['trackTimeMillis']??0)
    );
  }

  static String parseMillisToTime (int millis) {
    int totalSeconds = (millis / 1000).round();
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

}
