import 'package:flutter/material.dart';

class RevealRolePage extends StatefulWidget {
  final List<String>
  playerRoles; // La lista de palabras (ej: ['Gimnasio', 'Impostor', ...])

  const RevealRolePage({super.key, required this.playerRoles});

  @override
  State<RevealRolePage> createState() => _RevealRolePageState();
}

class _RevealRolePageState extends State<RevealRolePage> {
  int _currentPlayerIndex = 0; // Para saber qué jugador va (0, 1, 2...)
  bool _isRevealed = false; // ¿Está el secreto a la vista?

  void _nextStep() {
    setState(() {
      if (_isRevealed) {
        // Si ya vio la palabra y da al botón "Pasar al siguiente"
        if (_currentPlayerIndex < widget.playerRoles.length - 1) {
          _currentPlayerIndex++;
          _isRevealed = false; // Ocultamos para el siguiente
        } else {
          // Aquí iría la navegación a la pantalla de juego final
          debugPrint("¡Todos listos! Empezar partida");
        }
      } else {
        // Si toca para revelar
        _isRevealed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el rol actual
    String currentRole = widget.playerRoles[_currentPlayerIndex];
    bool isImpostor = currentRole == "IMPOSTOR";

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27), // Fondo oscuro
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Indicador de paso (ej: PASO 1 DE 8)
              Text(
                "PASO ${_currentPlayerIndex + 1} DE ${widget.playerRoles.length}",
                style: const TextStyle(color: Colors.white38, fontSize: 12),
              ),
              const Spacer(),

              // CONTENIDO QUE CAMBIA
              if (!_isRevealed) ...[
                // VISTA OCULTA (Imagen izquierda)
                const Icon(Icons.person, size: 100, color: Color(0xFF646AFF)),
                const SizedBox(height: 20),
                Text(
                  "JUGADOR ${_currentPlayerIndex + 1} DE ${widget.playerRoles.length}",
                  style: const TextStyle(
                    color: Color(0xFF646AFF),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "Es tu turno de ver el secreto",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 50),
                IconButton(
                  icon: const Icon(
                    Icons.touch_app,
                    size: 50,
                    color: Color(0xFF646AFF),
                  ),
                  onPressed: _nextStep,
                ),
                const Text(
                  "TOCA PARA REVELAR",
                  style: TextStyle(color: Color(0xFF646AFF)),
                ),
              ] else ...[
                // VISTA REVELADA (Imagen derecha)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isImpostor ? Colors.red : Colors.green,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        isImpostor ? "ERES EL IMPOSTOR" : "ERES USUARIO",
                        style: TextStyle(
                          color: isImpostor ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "LA PALABRA SECRETA ES",
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        isImpostor ? "???" : currentRole,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Memoriza la palabra y pasa el dispositivo con cuidado.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
              ],

              const Spacer(),
              // BOTÓN INFERIOR (Solo aparece cuando está revelado)
              if (_isRevealed)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3FD9),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: _nextStep,
                  child: const Text("Pasar al siguiente jugador →"),
                ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
