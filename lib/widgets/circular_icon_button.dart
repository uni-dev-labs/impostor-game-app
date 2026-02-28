import 'package:flutter/material.dart';
import '../constants/app_colors.dart';


class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = AppColors.textHint,
    this.size = 45,
    this.iconSize = 22,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderLight, width: 1),
        ),
        child: IconButton(
          icon: Icon(icon, color: color, size: iconSize),
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            minimumSize: Size(size, size),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    );
  }
}
