import "package:flutter/material.dart";
import "package:music_preview_app/helpers/text_tool.dart";
import "package:music_preview_app/models/music.dart";
import 'package:music_preview_app/helpers/responsive_layout.dart';

import "package:music_preview_app/views/music_player.dart";

class MusicItem extends StatelessWidget {
  const MusicItem({
    super.key,
    required this.music
  });

  final Music music;

  Widget getCollectionName(String name) {
    if(name.isNotEmpty) {
      return Text(TextTool.breakLine(name));
    } else {
      return const SizedBox(width: 0, height: 0,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) =>  MusicPlayer(music: music)));
      },
      child: SizedBox(
        width: ResponsiveLayout.getWidth(context),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(music.folderUri,
                    )),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(TextTool.breakLine(music.trackName.toUpperCase()),),
                    Text(TextTool.breakLine(music.artistName),),
                    getCollectionName(music.collectionName),
                    Text(music.duration)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
