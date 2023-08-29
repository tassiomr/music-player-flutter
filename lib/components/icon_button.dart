import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function action;

  const CustomIconButton({
    super.key,
    required this.action,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: icon,
          onPressed: () { action(); },
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
