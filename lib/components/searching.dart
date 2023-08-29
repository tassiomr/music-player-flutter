import 'package:flutter/material.dart';

class SearchingComponent extends StatefulWidget {
  SearchingComponent({super.key, required this.getMusic });

  Function getMusic;

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
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.brown,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () { widget.getMusic(_controller.value); },
                            color: Colors.grey[200],
                          ),
                        ),
                      )),
                ],
              )));
  }
}
