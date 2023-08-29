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
    } catch (_, e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMusic("Katy Perry");
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (musics.isEmpty) {
      child = const Text('Nothing to see yet');
    } else {
      child = ListView(
        children: [for (var music in musics) MusicItem(music: music)],
      );
    }

    if (isLoading) {
      return const Loading();
    }

    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SearchingComponent(getMusic: getMusic,),
                  for (var music in musics) MusicItem(music: music)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
