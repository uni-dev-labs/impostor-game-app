import 'package:flutter/material.dart';
 
class GuessWordInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
 
  const GuessWordInput({
    super.key,
    required this.controller,
    this.hint = 'Escribe la palabra secreta',
  });
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.characters,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.0,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontSize: 15,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
        ),
        filled: true,
        fillColor: const Color(0xFF1E2257),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: const Color(0xFF6C63FF).withOpacity(0.25),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFF6C63FF),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}