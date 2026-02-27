import 'package:flutter/material.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _CounterCard(title: "IMPOSTORES", value: "1")),
        SizedBox(width: 20),
        Expanded(child: _CounterCard(title: "RONDAS", value: "5")),
      ],
    );
  }
}

class _CounterCard extends StatelessWidget {
  final String title;
  final String value;

  const _CounterCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF14183C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF6C63FF),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
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
              _smallButton(Icons.remove),
              _smallButton(Icons.add),
            ],
          )
        ],
      ),
    );
  }

  Widget _smallButton(IconData icon) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Color(0xFF1E224F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}