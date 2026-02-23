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



class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF5B3FD9),
    this.textColor = Colors.white,
    this.horizontalPadding = 100,
    this.verticalPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}