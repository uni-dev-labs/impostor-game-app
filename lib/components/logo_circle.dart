import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class LogoCircle extends StatelessWidget {
  const LogoCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 210,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: AppColors.purpleShadow,
            blurRadius: 40,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: AppColors.blueShadow,
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(110),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.logoGradientStart, AppColors.logoGradientEnd],
            ),
          ),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}