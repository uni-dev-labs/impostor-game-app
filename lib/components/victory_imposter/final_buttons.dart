import 'package:flutter/material.dart';

class FinalButtons extends StatelessWidget {
  const FinalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón primario - Jugar otra vez
        SizedBox(
          width: double.infinity,
          height: 55,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3D35CC), Color(0xFF1A3DBF)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.6),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(-15, 0),
                ),
                BoxShadow(
                  color: const Color(0xFF3D35CC).withOpacity(0.6),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(15, 0),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "Jugar otra vez",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Botón outline - Volver al inicio
        SizedBox(
          width: double.infinity,
          height: 52,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0A0D2E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF1A3DBF).withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(-10, 0),
                ),
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(10, 0),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "Volver al inicio",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}