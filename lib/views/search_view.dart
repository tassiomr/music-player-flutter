import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/components/bottom_music_sheet.dart';
import 'package:music_preview_app/components/loading.dart';
import 'package:music_preview_app/components/music_item.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/repositories/search_musics.dart';

import '../components/searching.dart';

// class SearchViewProvider extends StatelessWidget {
//   const SearchViewProvider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => SearchMusicsCubit(context.read<SearchMusicImpl>()),
//       child: const SearchView(),
//     );
//   }
// }

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child;
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(
        builder: (context, state) {
      if (state.isLoading!) {
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
              Column(
                children: [
                  SearchingComponent(
                    getMusic: context.read<SearchMusicsCubit>().requestMusics,
                  ),
                  for (var music in state.musics!)
                    MusicItem(
                      music: music,
                      action: context.read<SearchMusicsCubit>().selectMusic,
                    )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}