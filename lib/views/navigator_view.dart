import "package:english_words/english_words.dart";
import "package:flutter/material.dart";
import "package:music_preview_app/views/generator_view.dart";
import "package:music_preview_app/views/seach_view.dart";

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});

  @override
  State<NavigatorView> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int selectedIndex = 0;
  String text = "oxi";

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;

    switch (selectedIndex) {
      case 0:
        {
          selectedPage = const SearchView();
        }
      case 1:
        {
          selectedPage = const Placeholder();
        }

      case 2:
        {
          selectedPage = const SearchView();
        }

      default:
        {
          selectedPage = const Placeholder();
        }
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
            extended: true,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.search), label: Text("Search")),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite), label: Text("Favorites")),
              NavigationRailDestination(
                  icon: Icon(Icons.person), label: Text("Profile")),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              print(index);
              setState(() {
                selectedIndex = index;
                text = WordPair.random().asCamelCase;
              });
            },
          )),
          Expanded(child: selectedPage)
        ],
      ),
    );
  }
}
