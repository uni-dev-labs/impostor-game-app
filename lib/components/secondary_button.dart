import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onTap;

  const SecondaryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: const Center(
            child: Text("Cómo jugar", style: AppTextStyles.secondaryButtonText),
          ),
        ),
      ),
    );
  }
}