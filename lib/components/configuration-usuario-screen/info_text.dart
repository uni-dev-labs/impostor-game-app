import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Memoriza la palabra y pasa el dispositivo al siguiente jugador con cuidado.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white54,
        fontSize: 13,
      ),
    );
  }
}