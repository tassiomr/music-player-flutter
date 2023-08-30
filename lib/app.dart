import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/blocs/music_bloc.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/repositories/search_musics.dart';
import 'package:music_preview_app/views/search_view.dart';

import 'components/bottom_music_sheet.dart';

class App extends StatelessWidget {
  const App({super.key, required SearchMusicImpl repository})
      : _repository = repository;

  final SearchMusicImpl _repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: BlocProvider(
        create: (_) => MusicBloc(musicRepository: _repository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => SearchMusicsCubit(context.read<SearchMusicImpl>()),
        child: Scaffold(
            bottomSheet: const BottomMusicSheet(),
            appBar: AppBar(
              backgroundColor: Colors.red.shade200.withOpacity(0.32),
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
              title: const Text('Music Player'),
            ),
            body: const SearchView()),
      ),
    );
  }
}
