import 'package:flutter/material.dart';
import '../../core/game_data.dart';

class ResultScreen extends StatelessWidget {
  final GameSession session;
  final bool impostorWon;

  const ResultScreen({super.key, required this.session, required this.impostorWon});

  // COLORES EXACTOS DEL DISEÑO
  final Color _bgColor = const Color(0xFF0B0B19);
  final Color _primaryPurple = const Color(0xFF5636F3);
  final Color _cardColor = const Color(0xFF16162C);
  final Color _textMuted = const Color(0xFF7A7A9D);
  final Color _impostorRed = const Color(0xFFFF3D3D);

  @override
  Widget build(BuildContext context) {
    List<Player> impostors = session.players.where((p) => p.isImpostor).toList();

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Icono de trofeo
              Icon(Icons.emoji_events, size: 70, color: _primaryPurple),
              const SizedBox(height: 20),

              // Título de Victoria
              Text(
                impostorWon ? "¡El Impostor ganó!" : "¡Los Usuarios ganaron!",
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                impostorWon ? "Logró pasar desapercibido o adivinó la palabra." : "Lograron descubrir al infiltrado.",
                style: TextStyle(color: _textMuted, fontSize: 14),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50),

              // SECCIÓN: PALABRA SECRETA
              Text("LA PALABRA SECRETA ERA", style: TextStyle(color: _textMuted, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                session.secretWord,
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 2.0),
              ),

              const SizedBox(height: 50),

              // SECCIÓN: LISTA DE IMPOSTORES
              Text(
                  impostors.length > 1 ? "LOS IMPOSTORES ERAN" : "EL IMPOSTOR ERA",
                  style: TextStyle(color: _textMuted, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 15),

              // Tarjetas de los impostores
              ...impostors.map((impostor) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _impostorRed.withOpacity(0.4), width: 1.5)
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: _primaryPurple,
                        radius: 18,
                        child: const Icon(Icons.person, color: Colors.white, size: 20)
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              impostor.name,
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                          Text(
                            "Infiltrado",
                            style: TextStyle(color: _impostorRed.withOpacity(0.8), fontSize: 10, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.visibility_off, color: _impostorRed, size: 20),
                  ],
                ),
              )).toList(),

              const Spacer(),

              // BOTONES FINALES
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Volver a la configuración
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text("Jugar otra vez", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: _textMuted.withOpacity(0.3))
                    ),
                  ),
                  child: const Text("Volver al inicio", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}