import 'package:flutter/material.dart';

class GameStatsRow extends StatelessWidget {
  final int rounds;
  final String minutes;
  final int votes;

  const GameStatsRow({
    super.key,
    required this.rounds,
    required this.minutes,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(value: rounds.toString(), label: "RONDAS"),
        _divider(),
        _StatItem(value: minutes, label: "MINUTOS"),
        _divider(),
        _StatItem(value: votes.toString(), label: "VOTACIÓN"),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white12,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}