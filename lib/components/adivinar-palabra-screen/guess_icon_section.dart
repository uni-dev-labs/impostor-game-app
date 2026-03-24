import 'package:flutter/material.dart';
 
class GuessIconSection extends StatelessWidget {
  const GuessIconSection({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF2A2D6A),
        border: Border.all(
          color: const Color(0xFF6C63FF).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.lightbulb_outline,
        size: 38,
        color: Color(0xFF6C63FF),
      ),
    );
  }
}
 