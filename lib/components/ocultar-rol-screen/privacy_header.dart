import 'package:flutter/material.dart';
 
class PrivacyHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
 
  const PrivacyHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.lock_outline,
              color: Color(0xFF6C63FF),
              size: 14,
            ),
            const SizedBox(width: 6),
            Text(
              'PRIVACIDAD ACTIVA',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        Text(
          'PASO $currentStep DE $totalSteps',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}