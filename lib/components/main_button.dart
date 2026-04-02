import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class MainButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? height;

  const MainButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonHeight = height ?? (screenWidth < 600 ? 58.0 : 64.0);

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF5B3EFF), Color(0xFF7B5CFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isPrimary ? null : Colors.white.withOpacity(0.06),
          border: isPrimary
              ? null
              : Border.all(color: Colors.white.withOpacity(0.09), width: 1.5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onPressed,
            splashColor: isPrimary
                ? Colors.white.withOpacity(0.2)
                : AppColors.accentColor.withOpacity(0.15),
            highlightColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: buttonHeight * 0.42),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth < 600 ? 16 : 17.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
