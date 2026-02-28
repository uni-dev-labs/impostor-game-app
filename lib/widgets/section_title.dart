import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

/// Título de sección con subtítulo para pantallas de configuración.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTheme.sectionTitle),
        Text(subtitle, style: AppTheme.sectionSubtitle),
      ],
    );
  }
}
