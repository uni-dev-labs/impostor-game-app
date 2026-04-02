import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? size;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = size ?? (screenWidth < 600 ? 48.0 : 54.0);

    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1.5),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor ?? Colors.white70,
          size: buttonSize * 0.48,
        ),
        splashRadius: buttonSize * 0.6,
      ),
    );
  }
}
