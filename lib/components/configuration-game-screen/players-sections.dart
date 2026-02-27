import 'package:flutter/material.dart';

class PlayersSection extends StatelessWidget {
  const PlayersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "JUGADORES",
          style: TextStyle(
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Total de participantes",
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _squareButton(Icons.remove),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            _squareButton(Icons.add),
            const SizedBox(width: 15),
            const Text(
              "08",
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _squareButton(IconData icon) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0xFF1E224F),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}