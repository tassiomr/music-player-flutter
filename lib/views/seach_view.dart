import 'package:flutter/material.dart';
import 'package:music_preview_app/components/loading.dart';
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
      var result = await controller.getMusic("never really over");
      //
      setState(() {
        isLoading = false;
        musics = result;
      });


    } catch(_, e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget child;

    if(musics.isEmpty) {
      child = const Text('Nothing to see yet');
    } else {
      child = const Placeholder();
    }

    if(isLoading) {
      return  const Loading();
    }

    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: getMusic, child: const Text('procurar')),
          child
        ],
      ),
    );


  }
}
