import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Texto de advertencia
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
                color: Color(0xFF1A3DBF),
                size: 16,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                    children: [
                      TextSpan(text: "Recomendamos al menos "),
                      TextSpan(
                        text: "5 jugadores",
                        style: TextStyle(
                          color: Color(0xFF1A3DBF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " para una experiencia óptima con más de un impostor.",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Botón
        SizedBox(
          width: double.infinity,
          height: 55,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 38, 129),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF1A3DBF).withOpacity(0.8),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.5),
                  blurRadius: 25,
                  spreadRadius: 4,
                  offset: const Offset(0, 0),
                ),
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.2),
                  blurRadius: 50,
                  spreadRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "COMENZAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}