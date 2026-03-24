import 'package:flutter/material.dart';

class VictoryHeader extends StatelessWidget {
  final String winner;
  final String subtitle;

  const VictoryHeader({
    super.key,
    required this.winner,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Glow difuminado exterior
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A3DBF).withOpacity(0.4),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                  BoxShadow(
                    color: const Color(0xFF3D35CC).withOpacity(0.2),
                    blurRadius: 100,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
            // Círculo con ícono
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1A3DBF).withOpacity(0.25),
                border: Border.all(
                  color: const Color(0xFF1A3DBF).withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Color(0xFF1A3DBF),
                size: 40,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              const TextSpan(text: "¡"),
              TextSpan(
                text: winner,
                style: const TextStyle(color: Color(0xFF1A3DBF)),
              ),
              const TextSpan(text: " ganó!"),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}