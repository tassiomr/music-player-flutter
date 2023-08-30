import 'package:flutter/material.dart';

import '../models/music.dart';

class ArtWorkMusic extends StatelessWidget {
  final Music music;
  const ArtWorkMusic({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      decoration: TextDecoration.none,
    );

    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
          child: Image.network(
        music.folderUri,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      )),
      const SizedBox(
        height: 25,
      ),
      Text(
        music.trackName,
        style: style,
      ),
      Text(
        music.artistName,
        style: style,
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}
