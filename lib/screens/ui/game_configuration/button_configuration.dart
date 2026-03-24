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
    this.width = 48 ,
    this.height = 38,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isAccent ? purple : purpleDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 24),
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}