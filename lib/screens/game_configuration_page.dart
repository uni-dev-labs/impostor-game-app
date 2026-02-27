import 'package:flutter/material.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

enum GameTheme { aleatorio, magia, deporte }

GameTheme selectedTheme = GameTheme.aleatorio;

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  int players = 5;
  final int maxPlayers = 15;
  final int minPlayers = 3;

  void increasePlayers() {
    if (players < maxPlayers) {
      setState(() {
        players++;
      });
    }
  }

  void decreasePlayers() {
    if (players > minPlayers) {
      setState(() {
        players--;
      });
    }
  }

  int impostors = 1;
  int rounds = 5;

  void increaseImpostors() {
    if (impostors < players - 1) {
      setState(() {
        impostors++;
      });
    }
  }

  void decreaseImpostors() {
    if (impostors > 1) {
      setState(() {
        impostors--;
      });
    }
  }

  void increaseRounds() {
    if (rounds < 20) {
      setState(() {
        rounds++;
      });
    }
  }

  void decreaseRounds() {
    if (rounds > 1) {
      setState(() {
        rounds--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B2A),
      body: Stack(
        children: [
          // Fondo degradado
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1E1559), Color(0xFF0D0B2A)],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // AppBar personalizada
                    Row(
                      children: [
                        _circleButton(Icons.arrow_back, () {
                          Navigator.pop(context);
                        }),
                        const Spacer(),
                        const Text(
                          "Configuración",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 40),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // JUGADORES
                    const Text(
                      "JUGADORES",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Total de participantes",
                      style: TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(height: 15),

                    _playersCounter(),

                    const SizedBox(height: 40),

                    const SizedBox(height: 30),

                    // IMPOSTORES Y RONDAS
                    Row(
                      children: [
                        Expanded(
                          child: _smallCounterCard(
                            title: "IMPOSTORES",
                            subtitle: "¿Quién miente?",
                            value: impostors,
                            onIncrease: increaseImpostors,
                            onDecrease: decreaseImpostors,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _smallCounterCard(
                            title: "RONDAS",
                            subtitle: "Duración partida",
                            value: rounds,
                            onIncrease: increaseRounds,
                            onDecrease: decreaseRounds,
                          ),
                        ),
                      ],
                    ),

                    //TEMAS
                    const SizedBox(height: 30),

                    const Text(
                      "TEMÁTICA",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Selecciona el mazo de palabras",
                      style: TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: _themeCard(
                            title: "ALEATORIO",
                            theme: GameTheme.aleatorio,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _themeCard(
                            title: "MAGIA",
                            theme: GameTheme.magia,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _themeCard(
                            title: "DEPORTE",
                            theme: GameTheme.deporte,
                          ),
                        ),
                      ],
                    ),

                    // BOTÓN COMENZAR
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF5B3CFF), Color(0xFF3B1EFF)],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "COMENZAR ▶",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================
  // WIDGET CONTADOR JUGADORES
  // ==========================

  Widget _playersCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF15133C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _circleButton(Icons.remove, decreasePlayers),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              children: [
                Text(
                  "$players",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: players / maxPlayers,
                  backgroundColor: Colors.white12,
                  color: const Color(0xFF5B3CFF),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5B3CFF), Color(0xFF3B1EFF)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: increasePlayers,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================
  // BOTÓN CIRCULAR
  // ==========================

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  Widget _smallCounterCard({
    required String title,
    required String subtitle,
    required int value,
    required VoidCallback onIncrease,
    required VoidCallback onDecrease,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF15133C),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white38, fontSize: 11),
          ),
          const SizedBox(height: 15),

          Center(
            child: Text(
              "$value",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _miniButton(Icons.remove, onDecrease),
              _miniGradientButton(Icons.add, onIncrease),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 38,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  Widget _miniGradientButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 38,
      width: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B3CFF), Color(0xFF3B1EFF)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.add, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  Widget _themeCard({required String title, required GameTheme theme}) {
    final bool isSelected = selectedTheme == theme;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTheme = theme;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1B1446), Color(0xFF3B1EFF)],
                )
              : null,
          color: isSelected ? null : const Color(0xFF15133C),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
