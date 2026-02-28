import 'package:flutter/material.dart';

/// Colores centralizados de la aplicación para mantener consistencia visual.
abstract final class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0D0D1A);
  static const Color backgroundSecondary = Color(0xFF1A1A3E);
  static const Color surface = Color(0xFF1A1A3E);
  static const Color surfaceMuted = Color(0xFF2D2D5A);

  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4834DF);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white38;
  static const Color textHint = Colors.white54;
  static const Color textFaint = Colors.white24;

  static const Color borderLight = Colors.white24;
  static Color borderSubtle(double opacity) => Colors.white.withOpacity(opacity);
}
