import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';

class ButtonConfigurationUI extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final bool isAccent;
  final double width;
  final double height;

  const ButtonConfigurationUI({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isAccent,
    this.width = 48,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isAccent ? purple : purpleDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
