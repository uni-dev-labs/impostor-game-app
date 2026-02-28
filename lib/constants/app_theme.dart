import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Estilos de texto reutilizables para la aplicación.
abstract final class AppTheme {
  AppTheme._();

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  static const TextStyle sectionSubtitle = TextStyle(
    color: AppColors.textMuted,
    fontSize: 12,
  );

  static const TextStyle bigNumber = TextStyle(
    color: AppColors.primary,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardValue = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryButton = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );
}
