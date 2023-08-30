import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_preview_app/components/icon_button.dart';
import 'package:music_preview_app/components/loading.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../components/art_work_music.dart';
import '../models/music.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key, required this.music});
  final Music music;

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;
  late Icon actionIcon;
  late Icon favoriteIcon = const Icon(Icons.favorite_outline);
  late Icon repeatIcon = const Icon(Icons.repeat);

  String getSeconds(int time) {
    if (time < 10) {
      return "00:0$time";
    }

    return "00:$time";
  }

  getPercent(int inSeconds) {
    double total = 29;

    return (inSeconds / total) ;
  }

  void executeActions() {
    if (_audioPlayer.playing) {
      setState(() {
        actionIcon = const Icon(Icons.play_arrow);
      });
      _audioPlayer.pause();
    } else {
      setState(() {
        actionIcon = const Icon(Icons.pause);
      });
      _audioPlayer.play();
    }
  }

  void favoriteAction() {
    setState(() {
      favoriteIcon = const Icon(Icons.favorite);
    });
  }

  void repeatAction() {
    _audioPlayer.setLoopMode(LoopMode.one);

    setState(() {
      repeatIcon = const Icon(Icons.repeat_one);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: [
          AudioSource.uri(Uri.parse(widget.music.previewSong)),
        ]));

    executeActions();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _audioPlayer.positionStream,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Loading();
          }
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.7,
                          0.9,
                          1
                        ],
                        colors: [
                          Colors.purple.shade100,
                          Colors.red.shade100,
                          Colors.green.shade100,
                          Colors.orange.shade100.withOpacity(0.9),
                        ])),
              ),
              title: Text("${widget.music.trackName} - ${widget.music.artistName}"),
            ),
            body: SafeArea(
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
                child: Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(0.3)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ArtWorkMusic(music: widget.music),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                    action: favoriteAction, icon: favoriteIcon),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomIconButton(
                                    action: executeActions, icon: actionIcon),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomIconButton(
                                    action: repeatAction, icon: repeatIcon),
                              ],
                            ),
                            const SizedBox(height: 25,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width * 0.30,
                                  lineHeight: 10,
                                  barRadius: const Radius.circular(8),
                                  backgroundColor: Colors.orange.withOpacity(0.2),
                                  progressColor: Colors.white.withOpacity(0.2),
                                  percent: getPercent(snapshot.data!.inSeconds),
                                ),
                                const SizedBox(width: 8,),
                                Text(
                                  getSeconds(snapshot.data!.inSeconds),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

}
