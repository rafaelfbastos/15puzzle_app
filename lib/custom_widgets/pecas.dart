import 'package:flutter/material.dart';

class Pecas extends StatelessWidget {
  GestureTapCallback onTap;
  int label;
  Pecas({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return InkWell(
      onTap: onTap,
      child: Image.asset(
        "assets/numeric/$label.png",
        width: mediaQuery.size.width * 0.20,
        height: mediaQuery.size.width * 0.20,
      ),
    );
  }
}
