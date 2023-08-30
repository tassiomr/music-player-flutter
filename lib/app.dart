import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_preview_app/cubits/search_musics_cubit.dart';
import 'package:music_preview_app/helpers/responsive_layout.dart';
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
        create: (_) => SearchMusicsCubit(SearchMusicImpl()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => SearchMusicsCubit(context.read<SearchMusicImpl>()),
        child: Scaffold(
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
                    ], colors: [
                      Colors.purple.shade100,
                      Colors.red.shade100,
                      Colors.green.shade100,
                      Colors.orange.shade100.withOpacity(0.9),
                    ])),
              ),
              title: const Text('Music Player'),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
                child: const SearchView())
        ),
      ),
    );
  }
}
