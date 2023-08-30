import 'package:flutter/material.dart';
import 'package:music_preview_app/helpers/responsive_layout.dart';

class SearchingComponent extends StatefulWidget {
  const SearchingComponent({super.key, required this.getMusic });

  final Function getMusic;

  @override
  State<SearchingComponent> createState() => _SearchingComponentState();
}

class _SearchingComponentState extends State<SearchingComponent> {

  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
          width: ResponsiveLayout.getWidth(context),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (String value) {
                          widget.getMusic(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Search a music or artist",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.brown,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                widget.getMusic(_controller.value.text);
                                },
                              color: Colors.grey[200],
                            ),
                          ),
                        )),
                  ],
                ),
              )));
  }
}
