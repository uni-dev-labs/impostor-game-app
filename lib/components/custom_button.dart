import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color.fromARGB(255, 100, 100, 100), width: 2),
      ),  
      child: IconButton(
        onPressed: onPressed, 
        icon: Icon(icon),
        color: const Color.fromARGB(156, 255, 255, 255),
      ),
    );
  }
}