import 'package:flutter/material.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: _CounterItem(
            title: "IMPOSTORES",
            subtitle: "¿Quién miente?",
            value: "1",
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: _CounterItem(
            title: "RONDAS",
            subtitle: "Duración partida",
            value: "5",
          ),
        ),
      ],
    );
  }
}

class _CounterItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;

  const _CounterItem({
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 TITULO
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(height: 4),

        // 🔥 SUBTITULO
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 14),

        // 🔥 CARD OSCURO
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF0F1230), // Más oscuro
            borderRadius: BorderRadius.circular(25),

            border: Border.all(
              color: Colors.white.withOpacity(0.05),
              width: 1,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              // 🔢 Número grande
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              // ➖➕ Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _smallButton(Icons.remove),
                  _smallButton(Icons.add),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _smallButton(IconData icon) {
    return Container(
      height: 48,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF262B5E), // Más claro que el card
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}