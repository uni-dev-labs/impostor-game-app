import 'package:flutter/material.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TEMÁTICA",
          style: TextStyle(
            color: Color(0xFF1A3DBF),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Selecciona el mazo de palabras",
          style: TextStyle(color: Colors.white54, fontSize: 15),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _ThemeCard(
                title: "ALEATORIO",
                icon: Icons.casino,
                selected: true,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ThemeCard(
                title: "MAGIA",
                icon: Icons.auto_fix_high,
                imagePath: 'assets/images/magia.jpg',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ThemeCard(
                title: "DEPORTES",
                icon: Icons.sports_basketball,
                imagePath: 'assets/images/deportes.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final String? imagePath;

  const _ThemeCard({
    required this.title,
    required this.icon,
    this.selected = false,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 40 - 20) / 3;

    return Stack(
      children: [
        Container(
          width: cardWidth,
          height: cardWidth * 1.2,
          decoration: BoxDecoration(
            color: selected ? null : const Color(0xFF0F1230),
            gradient: selected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6C63FF), Color(0xFF1A3DBF)],
                  )
                : null,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Imagen de fondo con opacidad
                if (imagePath != null && !selected)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(imagePath!, fit: BoxFit.cover),
                    ),
                  ),
                // Contenido
                SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white, size: 26),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        if (selected)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF1A3DBF),
                size: 12,
              ),
            ),
          ),
      ],
    );
  }
}
