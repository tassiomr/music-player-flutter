// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:music_preview_app/blocs/music_cubit.dart';
// import 'package:music_preview_app/views/seach_view.dart';
//

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart' ;
import 'package:music_preview_app/app.dart';
import 'package:music_preview_app/repositories/search_musics.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlockObserver();
  final musicRepository = SearchMusicImpl();

  runApp(App(repository: musicRepository));
}

class AppBlockObserver extends BlocObserver {
  const AppBlockObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
