import 'package:flutter/material.dart';
import '../components/victory_imposter/victory_header.dart';
import '../components/victory_imposter/secret_word_card.dart';
import '../components/victory_imposter/impostors_list.dart';
import '../components/victory_imposter/game_stats_row.dart';
import '../components/victory_imposter/final_buttons.dart';

class VictoryPage extends StatelessWidget {
  const VictoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F2E),
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1F4A), Color(0xFF0C0F2E)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: const [
                    SizedBox(height: 30),
                    VictoryHeader(
                      winner: "El Impostor",
                      subtitle: "Lograron pasar desapercibidos",
                    ),
                    SizedBox(height: 24),
                    SecretWordCard(word: "AEROPUERTO"),
                    SizedBox(height: 24),
                    ImpostorsList(
                      impostors: [
                        ImpostorPlayer(name: "La ovejita negra", role: "Impostor Mayor", avatarColor: Color(0xFF3D35CC)),
                        ImpostorPlayer(name: "Sofía", role: "Cómplice", avatarColor: Color(0xFF1A3DBF)),
                      ],
                    ),
                    SizedBox(height: 24),
                    GameStatsRow(rounds: 8, minutes: "12:45", votes: 1),
                    Spacer(),
                    SizedBox(height: 25),
                    FinalButtons(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}