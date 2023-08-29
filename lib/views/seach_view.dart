import 'package:flutter/material.dart';
import 'package:music_preview_app/components/loading.dart';
import 'package:music_preview_app/components/music_item.dart';
import 'package:music_preview_app/controllers/search_controller.dart';

import '../components/searching.dart';
import '../models/music.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Music> musics = [];
  bool isLoading = false;

  void getMusic(String value) async {
    try {
      SearchMusicController controller = SearchMusicController();
      setState(() {
        isLoading = true;
      });

      var result = await controller.getMusic(value);

      setState(() {
        isLoading = false;
        musics = result;
      });
    } catch (_) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (musics.isEmpty) {
      child = const Text('Nothing to see yet');
    } else {
      child = const SizedBox();
    }

    if (isLoading) {
      return const Loading();
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.1,
                0.5,
                0.7,
                0.9
              ],
              colors: [
                Colors.purple.shade100,
                Colors.red.shade100,
                Colors.green.shade100,
                Colors.orange.shade100.withOpacity(0.9),
              ])),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SearchingComponent(getMusic: getMusic,),
                  child,
                  for (var music in musics)
                    MusicItem(music: music)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
