import 'package:flutter/material.dart';
import 'package:impostor/components/circle_button.dart';
import 'package:impostor/components/theme_card.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/screens/player_screen.dart'; // 👈 IMPORTANTE

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  double players = 8;
  int impostors = 1;
  int rounds = 5;
  int selectedTheme = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 15, 51),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(60, 255, 255, 255),
              shape: BoxShape.circle,
            ),
            child: const BackButton(
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "Configuración",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 21, 15, 51),
              Color.fromARGB(255, 19, 15, 35),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _playersSection(),
              const SizedBox(height: 30),
              _impostorsAndRounds(),
              const SizedBox(height: 30),
              _themeSection(),
              const SizedBox(height: 20),
              _recommendationText(),
              const SizedBox(height: 30),

              // 🔥 BOTÓN COMENZAR (YA FUNCIONANDO)
              OptionButton(
                icon: Icons.play_arrow,
                text: "COMENZAR",
                colorIcon: Colors.white,
                colorBackground: const Color.fromARGB(255, 95, 44, 255),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlayerScreen(
                        playerNumber: 1,
                        totalPlayers: players.toInt(), // 👈 dinámico
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============================
  // JUGADORES
  // ============================
  Column _playersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "JUGADORES",
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 44, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total de participantes",
                  style: TextStyle(
                    color: Color.fromARGB(150, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              players.toInt().toString().padLeft(2, '0'),
              style: const TextStyle(
                color: Color.fromARGB(255, 95, 44, 255),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 33, 22, 75),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleButton(
                icon: Icons.remove,
                onTap: () {
                  if (players > 3) setState(() => players--);
                },
              ),
              Expanded(
                child: Slider(
                  value: players,
                  min: 3,
                  max: 20,
                  divisions: 17,
                  onChanged: (value) => setState(() => players = value),
                ),
              ),
              CircleButton(
                icon: Icons.add,
                onTap: () {
                  if (players < 20) setState(() => players++);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================
  // IMPOSTORES Y RONDAS
  // ============================
  Row _impostorsAndRounds() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Text("IMPOSTORES",
                  style: TextStyle(color: Colors.purple)),
              Text(impostors.toString(),
                  style: const TextStyle(color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (impostors > 1) setState(() => impostors--);
                    },
                  ),
                  CircleButton(
                    icon: Icons.add,
                    onTap: () => setState(() => impostors++),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text("RONDAS",
                  style: TextStyle(color: Colors.purple)),
              Text(rounds.toString(),
                  style: const TextStyle(color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (rounds > 1) setState(() => rounds--);
                    },
                  ),
                  CircleButton(
                    icon: Icons.add,
                    onTap: () => setState(() => rounds++),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  // ============================
  // TEMÁTICA
  // ============================
  Column _themeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("TEMÁTICA",
            style: TextStyle(color: Colors.purple)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ThemeCard(
                label: "ALEATORIO",
                icon: Icons.casino,
                isSelected: selectedTheme == 0,
                onTap: () => setState(() => selectedTheme = 0),
              ),
            ),
            Expanded(
              child: ThemeCard(
                label: "MAGIA",
                icon: Icons.auto_fix_high,
                isSelected: selectedTheme == 1,
                onTap: () => setState(() => selectedTheme = 1),
              ),
            ),
            Expanded(
              child: ThemeCard(
                label: "DEPORTE",
                icon: Icons.sports_soccer,
                isSelected: selectedTheme == 2,
                onTap: () => setState(() => selectedTheme = 2),
              ),
            ),
          ],
        )
      ],
    );
  }

  // ============================
  // TEXTO
  // ============================
  Widget _recommendationText() {
    return const Text(
      "Recomendamos al menos 5 jugadores",
      style: TextStyle(color: Colors.white54),
    );
  }
}