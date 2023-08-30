import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/components/bottom_music_sheet.dart';
import 'package:music_preview_app/components/loading.dart';
import 'package:music_preview_app/components/music_item.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/helpers/responsive_layout.dart';

import '../components/searching.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child;
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(
        builder: (context, state) {
      var actions = context.read<SearchMusicsCubit>();
      if (state.isLoading!) {
        return const Loading();
      }

      return SizedBox(
        width: ResponsiveLayout.getWidth(context),
        child: Container(
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
          child: Column(
            children: [
              SearchingComponent(
                getMusic: actions.requestMusics,
              ),
              Expanded(
                child: SizedBox(
                  width: ResponsiveLayout.getWidth(context),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.musics.length,
                    separatorBuilder: (_, __) => const SizedBox(),
                    itemBuilder: (context, int index) {
                      return MusicItem(
                          music: state.musics[index], action: actions.selectMusic);
                    },
                  ),
                ),
              ),
              SizedBox(width: ResponsiveLayout.getAHundredPercentWidth(context),child: const BottomMusicSheet())
            ],
          ),
        ),
      );

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
        child: ListView(
          children: [
            for (var music in state.musics!)
              MusicItem(
                music: music,
                action: context.read<SearchMusicsCubit>().selectMusic,
              ),
          ],
        ),
      );
    });
  }
}
