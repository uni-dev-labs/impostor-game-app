import 'package:flutter/material.dart';

class SecretWordCard extends StatelessWidget {
  final String word;

  const SecretWordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0D2E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF1A3DBF).withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A3DBF).withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: const Color(0xFF3D35CC).withOpacity(0.15),
            blurRadius: 60,
            spreadRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "LA PALABRA SECRETA ERA",
            style: TextStyle(
              color: Color(0xFF1A3DBF),
              fontSize: 11,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            word,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}