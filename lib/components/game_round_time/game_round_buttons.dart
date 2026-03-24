import 'package:flutter/material.dart';

class GameRoundButtons extends StatelessWidget {
  const GameRoundButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón outline - Intentar adivinar
        SizedBox(
          width: double.infinity,
          height: 52,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF1A3DBF).withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined, color: Color(0xFF1A3DBF), size: 18),
                SizedBox(width: 8),
                Text(
                  "Intentar adivinar",
                  style: TextStyle(
                    color: Color(0xFF1A3DBF),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Botón sólido - Siguiente ronda
        SizedBox(
          width: double.infinity,
          height: 55,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3D35CC), Color(0xFF1A3DBF)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Siguiente ronda",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}