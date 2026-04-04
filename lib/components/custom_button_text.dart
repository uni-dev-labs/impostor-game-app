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
  final double? fontSize; // nuevo parámetro
  final double? buttonHeight;

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
    this.fontSize,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: buttonHeight ?? 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderButon, width: 0.8),
      ),
      color: colorButton,
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) ...[
              Icon(iconLeft, color: iconColor, size: 17),
            ],
            const SizedBox(width: 5),
            Text(
              textButton,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize ?? 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            if (iconRight != null) ...[
              Icon(iconRight, color: iconColor, size: 17),
            ],
          ],
        ),
      ),
    );
  }
}
