import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final Color iconColor;
  final String textButton;
  final Color textColor;
  final Color colorButton;
  final Color borderButton;
  final VoidCallback? onPressed;

  const CustomButtonText({
    super.key,
    this.iconLeft,
    this.iconRight,
    this.iconColor = Colors.white,
    required this.textButton,
    this.textColor = Colors.white,
    this.colorButton = const Color.fromRGBO(67, 34, 237, 1),
    this.borderButton = Colors.transparent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderButton, width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) ...[
              Icon(iconLeft, color: iconColor, size: 22),
              const SizedBox(width: 8),
            ],
            Text(
              textButton,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (iconRight != null) ...[
              const SizedBox(width: 8),
              Icon(iconRight, color: iconColor, size: 22),
            ],
          ],
        ),
      ),
    );
  }
}
