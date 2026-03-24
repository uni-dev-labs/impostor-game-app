import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';

class ButtonConfigurationUI extends StatelessWidget {

  final void Function() onPressed;
  final IconData icon;
  final bool isAccent;
  final double? width;
  final double? height;
  
  
  const ButtonConfigurationUI({
    super.key,
    required this.icon, 
    required this.onPressed,
    required this.isAccent,
    this.width = 55,
    this.height = 45,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isAccent ? purpleDark: purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 20),
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,          
        ),
      ),
    );
  }
}