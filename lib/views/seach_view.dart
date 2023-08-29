import 'package:flutter/material.dart';
import 'package:music_preview_app/components/loading.dart';
import 'package:music_preview_app/components/music_item.dart';
import 'package:music_preview_app/controllers/search_controller.dart';

import '../models/music.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Music> musics = [];
  bool isLoading = false;

  void getMusic() async {
    try {
      SearchMusicController controller = SearchMusicController();
      setState(() {
        isLoading = true;
      });

      var result = await controller.getMusic("katy perry");

      setState(() {
        isLoading = false;
        musics = result;
      });
    } catch (eita, e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMusic();
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
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Search a music or artist",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Material(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.brown,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: getMusic,
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  )),
                            ],
                          ))),
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
