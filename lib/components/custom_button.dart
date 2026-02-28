import 'package:flutter/material.dart';
import '../core/app_colors.dart';

// Botón circular con icono (Settings, Back, Info)
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const CustomIconButton({
    super.key, 
    required this.icon, 
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.white.withOpacity(0.7), size: 20),
        onPressed: onPressed,
      ),
    );
  }
}

// Botón principal brillante (JUGAR, COMENZAR)
class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.white),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 1,
            color: AppColors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Ajustado a 16 para consistencia
          elevation: 10,
          shadowColor: AppColors.primary.withOpacity(0.5),
        ),
      ),
    );
  }
}