import 'package:e_commerce/widgets/subtitle.dart';
import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final String text;
  final IconData icon;

  final Color iconColor;
  const IconMenu(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(
          width: 5,
        ),
        Subtitle(
          text: text,
        )
      ],
    );
  }
}
