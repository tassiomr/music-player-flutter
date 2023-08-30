import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/search_musics_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(builder: (context, state) {
      return CustomIconButton(action: () {}, icon: state.favorite);
    });
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(
        builder: (context, state) {
      return CustomIconButton(action: () {}, icon: state.repeat);
    });
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(builder: (context, state) {
      return
            CustomIconButton(action: () {
            context.read<SearchMusicsCubit>().actionPlayPause();
      }, icon: state.playPause);
    });
  }
}


class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function action;

  const CustomIconButton({super.key, required this.action, required this.icon});

  @override
  Widget build(BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: Ink(
          width: 40,
          height: 40,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 14,
            icon: Icon(icon),
            onPressed: () {
              action();
            },
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      );
  }
}
