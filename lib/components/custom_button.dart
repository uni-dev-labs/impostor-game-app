import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  const CustomButton({super.key, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 27, 68, 1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color.fromARGB(255, 100, 100, 100), 
          width: 2
        ),
      ),
      child: IconButton(
        onPressed: () {
          print("hola mundo");
        }, 
        icon: Icon(
          icon,
          color: Colors.white.withOpacity(0.7), // Color blanco semi-transparente
        ),
      ),
    );
  }
}