import 'package:flutter/cupertino.dart';
import 'package:music_preview_app/views/seach_view.dart';

class GeneratorPage extends StatefulWidget {
  GeneratorPage({super.key, required selectedIndex});

  int selectedIndex = 0;

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {


  @override
  Widget build(BuildContext context) {
    switch(widget.selectedIndex) {
      case 0: {
          return const SearchView();
      }
      case 1: {
        return const Placeholder();
      }

      case 2: {
        return const SearchView();
      }

      default: {
        return const Placeholder();
      }
    }
  }
}
