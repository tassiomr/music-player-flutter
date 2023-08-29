class Music {
  final String artistName;
  final int trackId;
  final String trackName;
  final String folderUri;
  final String previewSong;
  final String collectionName;

  const Music({
    required this.artistName,
    required this.trackId,
    required this.trackName,
    required this.folderUri,
    required this.previewSong,
    required this.collectionName,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      artistName: json['artistName'],
      trackId: json['trackId'],
      trackName: json['trackName'],
      folderUri: json['artworkUrl100'],
      previewSong: json['previewUrl'],
      collectionName: json['collectionName'],
    );
  }

}
