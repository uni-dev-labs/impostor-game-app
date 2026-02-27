import 'package:flutter/material.dart';
import '../components/configuration-game-screen/config-header.dart';
import '../components/configuration-game-screen/players-sections.dart';
import '../components/configuration-game-screen/counter-section.dart';
import '../components/configuration-game-screen/theme-section.dart';
import '../components/configuration-game-screen/start-button.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1C1F4A),
              Color(0xFF0C0F2E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10),
                ConfigHeader(),
                SizedBox(height: 30),
                PlayersSection(),
                SizedBox(height: 30),
                CounterSection(),
                SizedBox(height: 30),
                ThemeSection(),
                Spacer(),
                StartButton(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}