import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/helpers/numbers.dart';
import 'package:music_preview_app/helpers/responsive_layout.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'icon_button.dart';

class BottomMusicSheet extends StatefulWidget {
  const BottomMusicSheet({super.key});

  @override
  State<BottomMusicSheet> createState() => _BottomMusicSheetState();
}

class _BottomMusicSheetState extends State<BottomMusicSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMusicsCubit, SearchMusicState>(
        builder: (context, state) {
      if (state?.music == null) {
        return const SizedBox();
      }

      return StreamBuilder(
          stream: state.audioPlayer!.positionStream,
          builder: (context, snapshot) {
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
                child: SizedBox(
                    height: 140,
                    width: ResponsiveLayout.getWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(state.music!.cover)),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FavoriteButton(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  PlayPauseButton(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  RepeatButton(),
                                ],
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            width: ResponsiveLayout.getWidth(context) - 20,
                            lineHeight: 10,
                            backgroundColor: Colors.transparent,
                            progressColor: Colors.black.withOpacity(0.5),
                            percent:
                                Numbers.getPercents(snapshot.data?.inSeconds ?? 0),
                          )
                        ],
                      ),
                    )));
          });
    });
  }
}
