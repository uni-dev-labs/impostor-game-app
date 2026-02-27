import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class SocialSection extends StatelessWidget {
  final double width;

  const SocialSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialIcon(Icons.people, width * 0.08),
            const SizedBox(width: 10),
            _SocialIcon(Icons.groups, width * 0.08),
            const SizedBox(width: 10),
            const _Badge(text: "30k"),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "JUGADO POR GENTE DE TODO EL MUNDO",
          style: AppTextStyles.footerText,
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const _SocialIcon(this.icon, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white70, size: size * 0.5),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}