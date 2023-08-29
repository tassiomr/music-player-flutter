import "package:flutter/material.dart";
import "package:music_preview_app/views/seach_view.dart";

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});

  @override
  State<NavigatorView> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int selectedIndex = 0;

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
            extended: false,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.search), label: Text("Search")),
              NavigationRailDestination(
                  icon: Icon(Icons.person), label: Text("Profile")),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          )),
          Expanded(child: selectedPage)
        ],
      ),
    );
  }
}
