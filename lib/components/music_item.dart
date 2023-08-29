import "package:flutter/material.dart";
import "package:music_preview_app/models/music.dart";

class MusicItem extends StatelessWidget {
  const MusicItem({
    super.key,
    required this.music
  });

  final Music music;

  Widget getCollectionName(String name) {
    if(name.isNotEmpty) {
      return Text(name);
    } else {
      return const SizedBox(width: 0, height: 0,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center( child: Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(music.folderUri),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${music.trackName} - ${music.artistName}"),
                getCollectionName(music.collectionName),
                Text(music.duration)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
