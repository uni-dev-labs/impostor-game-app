import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_button.dart'; 
import '../provider/game_provider.dart';

class ResultPage extends StatelessWidget {
  final bool ganoImpostor;
  
  const ResultPage({super.key, required this.ganoImpostor});

  @override
  Widget build(BuildContext context) {
    // Obtenemos la palabra real desde tu Provider
    final String palabraCorrecta = Provider.of<GameProvider>(context).palabraSecreta;

    return Scaffold(
      backgroundColor: const Color(0xFF151530),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                ganoImpostor ? "¡El Impostor ganó!" : "¡Victoria del Pueblo!",
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 28, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "Lograron pasar desapercibidos", 
                style: TextStyle(color: Colors.white54)
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "LA PALABRA SECRETA ERA", 
                      style: TextStyle(color: Colors.white38, fontSize: 10)
                    ),
                    const SizedBox(height: 8),
                    Text(
                      palabraCorrecta.toUpperCase(), 
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                        letterSpacing: 2
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // USAMOS PrimaryButton porque es el que acepta "text"
              PrimaryButton(
                text: "Jugar otra vez",
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text(
                  "Volver al inicio", 
                  style: TextStyle(color: Colors.white54)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}