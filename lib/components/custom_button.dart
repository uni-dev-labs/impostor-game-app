import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  
  final IconData? icon;
  final String text;
  final Color colorIcon;
  final Color colorBackground;
  final VoidCallback onPressed;

  const OptionButton({super.key, this.icon, required this.text, required this.colorIcon, required this.colorBackground, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      color: colorBackground,
      onPressed: () {onPressed();
      },
      child: Center(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(icon, color: colorIcon),
            Text(text, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
             )
             ),
          ],
        )
      ),
    );
  }
}