import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;

  const CustomButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Un azul noche un poco más claro que el fondo para que resalte el círculo
        color: const Color(0xFF1E1B4B),
        shape: BoxShape.circle, // Forma circular perfecta
        border: Border.all(
          // Nueva forma de poner opacidad para evitar el mensaje de 'deprecated'
          color: Colors.white.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: IconButton(
        onPressed: () {
          print("Botón presionado");
        },
        // Ponemos el ícono en blanco brillante para que resalte
        icon: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
