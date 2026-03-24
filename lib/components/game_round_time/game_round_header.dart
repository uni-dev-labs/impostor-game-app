import 'package:flutter/material.dart';

class GameRoundHeader extends StatelessWidget {
  final String role;
  final int round;
  final int totalRounds;

  const GameRoundHeader({
    super.key,
    required this.role,
    required this.round,
    required this.totalRounds,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.close, color: Colors.white, size: 22),
        Column(
          children: [
            Text(
              role,
              style: const TextStyle(
                color: Color(0xFF1A3DBF),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Ronda $round de $totalRounds",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Icon(Icons.help_outline, color: Colors.white, size: 22),
      ],
    );
  }
}