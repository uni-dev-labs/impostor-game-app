import 'package:flutter/material.dart';
import '../components/game_round_time/game_round_header.dart';
import '../components/game_round_time/game_round_timer.dart';
import '../components/game_round_time/game_round_message.dart';
import '../components/game_round_time/game_round_buttons.dart';

class GameRoundPage extends StatelessWidget {
  const GameRoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1F4A), Color(0xFF0C0F2E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                SizedBox(height: 20),
                GameRoundHeader(role: "EL IMPOSTOR", round: 1, totalRounds: 5),
                SizedBox(height: 60),
                GameRoundTimer(seconds: 102),
                SizedBox(height: 60),
                GameRoundMessage(
                  message: "El impostor está entre vosotros.\nObserva los gestos y haz preguntas clave.",
                ),
                Spacer(),
                GameRoundButtons(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}