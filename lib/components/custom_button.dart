import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;
  final bool isIconInLeft;
  final double? borderRadius;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double iconSize;

  const CustomButton({
    super.key, 
    required this.text, 
    required this.onPressed,
    this.color = Colors.blue,
    this.icon, 
    this.isIconInLeft = true,
    this.borderRadius = 30,
    this.height = 70,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w800,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      color: color,
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconInLeft && icon != null)
              Icon(icon, color: Colors.white, size: iconSize),
            if (isIconInLeft && icon != null) const SizedBox(width: 8),
            Text(
              text, 
              style: TextStyle(
                color: Colors.white, 
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
            if (!isIconInLeft && icon != null) const SizedBox(width: 8),
            if (!isIconInLeft && icon != null)
              Icon(icon, color: Colors.white, size: iconSize),
          ],
        ),
      ),
    );
  }
}