import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isFilled;
  final double? size; // null = responsivo

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isFilled = false,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = size ?? (screenWidth < 600 ? 48.0 : 56.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: isFilled
              ? AppColors.accentColor
              : Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(16),
          border: isFilled
              ? null
              : Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: buttonSize * 0.45, // proporcional
        ),
      ),
    );
  }
}
