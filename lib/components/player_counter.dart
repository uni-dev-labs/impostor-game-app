import 'package:flutter/material.dart';

class PlayerCounter extends StatefulWidget {
  const PlayerCounter({super.key});

  @override
  State<PlayerCounter> createState() => _PlayerCounterState();
}

class _PlayerCounterState extends State<PlayerCounter> {
  int players = 3;
  final int maxPlayers = 20;

  @override
  Widget build(BuildContext context) {
    double progress = players / maxPlayers;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 20, 39, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          width: 1,
        ),
      ),
      width: double.infinity,
      height: 85,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            /// BOTÓN MENOS
            GestureDetector(
              onTap: () {
                if (players > 3) {
                  setState(() {
                    players--;
                  });
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 40, 59, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ),

            const SizedBox(width: 10),

            /// BARRA DE PROGRESO
            Expanded(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Fondo
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(32, 40, 59, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Progreso
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

            /// BOTÓN MÁS
            GestureDetector(
              onTap: () {
                if (players < maxPlayers) {
                  setState(() {
                    players++;
                  });
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 20, 234, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
