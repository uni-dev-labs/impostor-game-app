import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
  colors: [
    Color(0xFF7B2CFF), 
    Color(0xFF5A1FD6),
  ],
),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
  color: const Color(0xFF7B2CFF).withOpacity(0.5),
  blurRadius: 25,
  spreadRadius: 3,
),
        ],
      ),
      child: const Center(
        child: Text(
          "Pasar al siguiente jugador →",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}