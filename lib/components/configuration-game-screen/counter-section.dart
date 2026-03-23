import 'package:flutter/material.dart';
import 'package:impostor/Providers/configuration_game_provider.dart';
import 'package:provider/provider.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigurationGameProvider>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _CounterItem(
            title: "IMPOSTORES",
            subtitle: "¿Quién miente?",
            value: config.impostors.toString().padLeft(2, "0"),
            onAdd: () => config.addImpostors(),
            onLess: () => config.lessImpostors(),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _CounterItem(
            title: "RONDAS",
            subtitle: "Duración partida",
            value: config.rounds.toString().padLeft(2, "0"),
            onAdd: () => config.addRounds(),
            onLess: () => config.lessRounds(),
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
  final VoidCallback onAdd;
  final VoidCallback onLess;

  const _CounterItem({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onAdd,
    required this.onLess,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1A3DBF),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF0F1230),
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
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _smallButton(Icons.remove, isPrimary: false, onTap: onLess),
                  _smallButton(Icons.add, isPrimary: true, onTap: onAdd),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _smallButton(IconData icon, {required bool isPrimary, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 60,
        decoration: BoxDecoration(
          color: isPrimary
              ? const Color.fromARGB(255, 3, 17, 78)
              : const Color(0xFF080C1A),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.85),
              blurRadius: 12,
              spreadRadius: 3,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xFF1A3DBF),
          size: 22,
        ),
      ),
    );
  }
}