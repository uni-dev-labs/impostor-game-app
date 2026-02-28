import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        splashColor: Color.fromARGB(98, 15, 17, 151),
        highlightColor: Color.fromARGB(80, 9, 25, 173),
        icon: Icon(icon, color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}