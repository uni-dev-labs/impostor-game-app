import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final Color iconColor;
  final String textButton;
  final Color textColor;
  final Color colorButton;
  final Color borderButon;
  final VoidCallback? onPressed;

  const CustomButtonText({
    super.key,
    this.iconLeft,
    this.iconColor = Colors.white,
    required this.textButton,
    this.textColor = Colors.white,
    this.colorButton = const Color.fromRGBO(67, 34, 237, 1),
    this.borderButon = Colors.transparent,
    required this.onPressed,
    this.iconRight,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderButon, width: 2),
      ),
      color: colorButton,
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) ...[
              Icon(iconLeft, color: iconColor),
              const SizedBox(width: 8),
            ],
            Text(
              textButton,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (iconRight != null) ...[
              Icon(iconRight, color: iconColor),
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }
}
