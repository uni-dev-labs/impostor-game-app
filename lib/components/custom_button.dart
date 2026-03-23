import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed; // 1. Agregamos el parámetro opcional

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed, // 2. Lo incluimos en el constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 27, 68, 1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color.fromARGB(255, 100, 100, 100),
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed:
            onPressed ?? () => print("Tap!"), // 3. Usamos la función recibida
        icon: Icon(icon, color: Colors.white.withOpacity(0.7)),
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
    this.verticalPadding = 20,
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
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  // Simula tu lista de imágenes (puedes reemplazar con tu modelo de datos)
  static const List<String> _profileImages = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40 + (_profileImages.length - 1) * 24.0, // ancho dinámico
      height: 80,
      child: Stack(
        children: List.generate(
          _profileImages.length,
          (index) => Positioned(
            left: index * 24.0, // cuánto se enciman
            child: _Perfiles(imagePath: _profileImages[index]),
          ),
        ),
      ),
    );
  }
}

class _Perfiles extends StatelessWidget {
  const _Perfiles({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Stack(
        children: [
          CircleAvatar(radius: 100, backgroundImage: AssetImage(imagePath)),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.4), // Nivel de oscuridad
            ),
          ),
        ],
      ),
    );
  }
}
