import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;
  const Subtitle(
      {super.key,
      required this.text,
      this.color = const Color(0xFFccc7c5),
      this.size = 12,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}
