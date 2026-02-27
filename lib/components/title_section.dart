import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("EL", style: AppTextStyles.title),
        Text("IMPOSTOR", style: AppTextStyles.title),
        SizedBox(height: 10),
        Text("DESCUBRE QUIÉN MIENTE", style: AppTextStyles.subtitle),
      ],
    );
  }
}