import 'package:e_commerce/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Color? color;
  final String text;
  final TextOverflow Txtoverflow;
  final double size;
  const Header({
    super.key,
    required this.text,
    this.color,
    this.size = 0,
    this.Txtoverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size == 0 ? Dimensions.font20 : size,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            overflow: Txtoverflow));
  }
}
