import 'package:flutter/material.dart';
import 'package:impostor/Providers/configuration_game_provider.dart';
import 'package:provider/provider.dart';


class PlayersSection extends StatelessWidget {
  const PlayersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigurationGameProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JUGADORES",
                  style: TextStyle(
                    color: Color(0xFF1A3DBF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Total de participantes",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),

            /// 🔢 DINÁMICO
            Text(
              config.players.toString().padLeft(2, "0"),
              style: const TextStyle(
                color: Color(0xFF1A3DBF),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Color(0xFF1A3DBF),
                    blurRadius: 14,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white.withOpacity(0.07),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              /// ➖ RESTAR
              GestureDetector(
                onTap: () => config.lessPlayers(),
                child: _squareButton(Icons.remove, isPrimary: false),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      /// 📊 BARRA DINÁMICA
                      widthFactor: config.players == 0
                          ? 0
                          : config.players / config.maxPlayers,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A3DBF),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF1A3DBF),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// ➕ SUMAR
              GestureDetector(
                onTap: () => config.addPlayers(),
                child: _squareButton(Icons.add, isPrimary: true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _squareButton(IconData icon, {required bool isPrimary}) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1A3DBF) : const Color(0xFF0E1228),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: const Color(0xFF1A3DBF).withOpacity(0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}