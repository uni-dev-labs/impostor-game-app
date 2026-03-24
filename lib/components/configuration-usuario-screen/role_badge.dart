import 'package:flutter/material.dart';

class RoleBadge extends StatelessWidget {
  const RoleBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF00C896).withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "● ERES USUARIO",
        style: TextStyle(
          color: Color(0xFF00C896),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}