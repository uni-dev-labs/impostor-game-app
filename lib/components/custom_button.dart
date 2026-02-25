import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;

  const CustomButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade700,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.purple.shade200, width: 2),
      ),
      child: IconButton(
        onPressed: () {
          print("hola mundo");
        }, 
        icon: Icon(icon, color: Colors.white)
      ),
    );
  }
}