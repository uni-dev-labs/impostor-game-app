import 'package:flutter/material.dart';
 
class GuessPhaseHeader extends StatelessWidget {
  final String phaseLabel;
 
  const GuessPhaseHeader({
    super.key,
    this.phaseLabel = 'PASE FINAL',
  });
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2D6A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF6C63FF).withOpacity(0.35),
            width: 1,
          ),
        ),
        child: Text(
          phaseLabel,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}