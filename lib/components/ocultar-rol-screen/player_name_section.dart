import 'package:flutter/material.dart';
 
class PlayerNameSection extends StatelessWidget {
  final String playerName;
  final String subtitle;
 
  const PlayerNameSection({
    super.key,
    required this.playerName,
    this.subtitle = 'Es tu turno de ver el secreto',
  });
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          playerName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withOpacity(0.55),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
 