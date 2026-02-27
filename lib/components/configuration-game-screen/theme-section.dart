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
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Selecciona el mazo de palabras",
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const SizedBox(height: 15),
        Row(
          children: const [
            Expanded(child: _ThemeCard(title: "ALEATORIO", selected: true)),
            SizedBox(width: 15),
            Expanded(child: _ThemeCard(title: "MAGIA")),
            SizedBox(width: 15),
            Expanded(child: _ThemeCard(title: "DEPORTES")),
          ],
        ),
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final bool selected;

  const _ThemeCard({required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        gradient: selected
            ? const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF4A3FFF)],
              )
            : null,
        color: selected ? null : const Color(0xFF14183C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}