import 'package:flutter/material.dart';

class PlayerCounter extends StatelessWidget {
  final int players;
  final int maxPlayers;
  final ValueChanged<int> onChanged;

  const PlayerCounter({
    super.key,
    required this.players,
    required this.maxPlayers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double progress = players / maxPlayers;

    return Container(
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 20, 39, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (players > 3) {
                onChanged(players - 1);
              }
            },
            child: _button(Icons.remove, const Color.fromRGBO(32, 40, 59, 1)),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 40, 59, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(55, 20, 234, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              if (players < maxPlayers) {
                onChanged(players + 1);
              }
            },
            child: _button(Icons.add, const Color.fromRGBO(55, 20, 234, 1)),
          ),
        ],
      ),
    );
  }

  Widget _button(IconData icon, Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}