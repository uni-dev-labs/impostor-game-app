import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF1A1A3E);
  static const gradientPrimary = Color.fromARGB(255, 50, 14, 255);
  static const logoGradientStart = Color(0xFF2D2D5A);
  static const logoGradientEnd = Color(0xFF1A1A3E);
  static const purpleShadow = Color(0x80BA68C5);
  static const blueShadow = Color(0x4D4FC3F7);
}

class AppTextStyles {
  static const title = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static const subtitle = TextStyle(
    color: Colors.white38,
    fontSize: 12,
    letterSpacing: 2,
  );

  static const primaryButtonText = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static const secondaryButtonText = TextStyle(
    color: Colors.white70,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const footerText = TextStyle(
    color: Colors.white24,
    fontSize: 10,
    letterSpacing: 1,
  );
}