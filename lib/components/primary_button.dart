import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.gradientPrimary, AppColors.gradientPrimary],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow, color: Colors.white, size: 28),
                SizedBox(width: 10),
                Text("JUGAR", style: AppTextStyles.primaryButtonText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}