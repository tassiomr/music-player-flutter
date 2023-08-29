import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
