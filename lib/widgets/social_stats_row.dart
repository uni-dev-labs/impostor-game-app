import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Fila de iconos sociales con contador y texto inferior.
class SocialStatsRow extends StatelessWidget {
  const SocialStatsRow({
    super.key,
    this.iconSize,
    this.counter = '30k',
    this.caption = 'JUGADO POR GENTE DE TODO EL MUNDO',
  });

  final double? iconSize;
  final String counter;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final size = iconSize ?? MediaQuery.sizeOf(context).width * 0.08;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialIcon(icon: Icons.people, size: size),
            const SizedBox(width: 10),
            _SocialIcon(icon: Icons.groups, size: size),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                counter,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          caption,
          style: const TextStyle(
            color: AppColors.textFaint,
            fontSize: 10,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.icon, required this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.borderSubtle(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.textSecondary, size: size * 0.5),
    );
  }
}
