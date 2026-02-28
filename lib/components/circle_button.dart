import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isFilled;
  final double size;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isFilled = false,
    this.size = 45,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isFilled
              ? AppColors.accentColor
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
