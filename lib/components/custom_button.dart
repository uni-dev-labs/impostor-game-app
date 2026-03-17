import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;
  final bool isIconInLeft;
  final double? borderRadius;

  const CustomButton({
    super.key, 
    required this.text, 
    required this.onPressed,
    this.color = Colors.blue,
    this.icon, 
    this.isIconInLeft = true,
    this.borderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      color: color,
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconInLeft) Icon(icon, color: Colors.white),
            Text(
              text, 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20, 
                fontWeight: FontWeight.w800
              ),
            ),
            if (!isIconInLeft) Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}