import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final IconData? icon;
  final String textButton;
  final Color colorButton;
  final Color borderButon;
  final VoidCallback onPressed;

  const CustomButtonText({
    super.key,
    this.icon,
    required this.textButton,
    this.colorButton = const Color.fromRGBO(67, 34, 237, 1),
    this.borderButon = Colors.transparent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: borderButon, width: 2),
      ),
      color: colorButton,
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            Text(
              textButton,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
