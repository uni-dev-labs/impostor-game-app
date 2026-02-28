import 'package:flutter/material.dart';

class CounterControl extends StatelessWidget {
  final String label;
  final String subLabel;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterControl({
    super.key,
    required this.label,
    required this.subLabel,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF646AFF), // Azul brillante
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          subLabel,
          style: const TextStyle(color: Colors.white54, fontSize: 10),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                value.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _opButton("-", onDecrement),
                  _opButton("+", onIncrement),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _opButton(String op, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF211B44),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white10),
        ),
        child: Text(
          op,
          style: const TextStyle(
            color: Color(0xFF646AFF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
