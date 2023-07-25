import 'package:e_commerce/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double size;
  final double iconSize;
  final Color iconColor;
  const AppIcon(
      {required this.icon,
      this.size = 40,
      this.iconSize = 16,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
