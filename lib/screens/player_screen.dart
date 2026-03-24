import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  final int playerNumber;
  final int totalPlayers;

  const PlayerScreen({
    super.key,
    required this.playerNumber,
    required this.totalPlayers,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  void nextPlayer() {
    if (widget.playerNumber < widget.totalPlayers) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PlayerScreen(
            playerNumber: widget.playerNumber + 1,
            totalPlayers: widget.totalPlayers,
          ),
        ),
      );
    } else {
      print("Fin del juego");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF150F33),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              // 🔝 HEADER
              const SizedBox(height: 20),
              Text(
                "PASO ${widget.playerNumber} DE ${widget.totalPlayers}",
                style: const TextStyle(color: Colors.white54),
              ),

              // 🔥 CONTENIDO CENTRADO
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // ICONO
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent.withOpacity(0.2),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blueAccent,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // TEXTO
                    Text(
                      "Jugador ${widget.playerNumber}",
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Es tu turno de ver el secreto",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),

              // 🔘 BOTÓN ABAJO
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 95, 44, 255),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: nextPlayer,
                      child: const Text(
                        "CONTINUAR",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}