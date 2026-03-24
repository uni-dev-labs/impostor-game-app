import 'package:flutter/material.dart';
 
class GuessTitleSection extends StatelessWidget {
  final String title;
  final String description;
 
  const GuessTitleSection({
    super.key,
    this.title = '¿Cuál era la palabra?',
    this.description =
        'Te han descubierto, pero aún puedes ganar. Si adivinas la palabra secreta, ¡la victoria es tuya!',
  });
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}