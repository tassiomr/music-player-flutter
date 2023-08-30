import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/helpers/responsive_layout.dart';

import '../repositories/search_musics.dart';

class BottomMusicSheet extends StatelessWidget {
  const BottomMusicSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(
        builder: (context, state) {

      if (state?.music == null) {
        return const SizedBox();
      }

      return Container(
          color: Colors.white,
          child: SizedBox(
              width: ResponsiveLayout.getWidth(context),
              height: 80,
              child: Text(state.music!.trackName)));
    });
  }
}
