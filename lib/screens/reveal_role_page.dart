import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RevealRolePage extends StatefulWidget {
  final List<String> playerRoles;

  const RevealRolePage({super.key, required this.playerRoles});

  @override
  State<RevealRolePage> createState() => _RevealRolePageState();
}

class _RevealRolePageState extends State<RevealRolePage>
    with TickerProviderStateMixin {
  int _currentPlayerIndex = 0;
  bool _isRevealed = false;

  late AnimationController _flipController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // más suave 🔥
    );

    _glowController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _flipController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _nextStep() {
    HapticFeedback.mediumImpact();

    if (!_isRevealed) {
      _flipController.forward();
      setState(() => _isRevealed = true);
    } else {
      if (_currentPlayerIndex < widget.playerRoles.length - 1) {
        setState(() {
          _currentPlayerIndex++;
          _isRevealed = false;
          _flipController.reset();
        });
      } else {
        debugPrint("🔥 Todos listos");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String role = widget.playerRoles[_currentPlayerIndex];
    bool isImpostor = role == "IMPOSTOR";

    Color neonColor = isImpostor ? Colors.redAccent : Colors.greenAccent;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A1A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              colors: [Color(0xFF1A1740), Color(0xFF0A0A1A)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "JUGADOR ${_currentPlayerIndex + 1} DE ${widget.playerRoles.length}",
                  style: const TextStyle(color: Colors.white54),
                ),

                const Spacer(),

                /// FLIP DOBLE
                AnimatedBuilder(
                  animation: _flipController,
                  builder: (context, child) {
                    double angle = _flipController.value * 2 * pi;

                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: _isRevealed
                          ? _buildCard(role, isImpostor, neonColor)
                          : _buildHidden(),
                    );
                  },
                ),

                const Spacer(),

                /// BOTÓN
                AnimatedOpacity(
                  opacity: _isRevealed ? 1 : 0,
                  duration: const Duration(milliseconds: 400),
                  child: _isRevealed
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _nextStep,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6C3BFF),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 10,
                              shadowColor: Colors.deepPurpleAccent,
                            ),
                            child: const Text(
                              "Pasar al siguiente →",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHidden() {
    return GestureDetector(
      onTap: _nextStep,
      child: Column(
        children: [
          const Icon(Icons.lock_outline, size: 80, color: Colors.white38),
          const SizedBox(height: 20),
          const Text(
            "Toca para revelar",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 30),
          AnimatedBuilder(
            animation: _glowController,
            builder: (_, __) {
              return Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple
                          .withOpacity(0.5 + _glowController.value * 0.5),
                      blurRadius: 30 + (_glowController.value * 20),
                    ),
                  ],
                ),
                child: const Icon(Icons.touch_app,
                    size: 60, color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String role, bool isImpostor, Color neonColor) {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (_, __) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0xFF151530),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: neonColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: neonColor.withOpacity(0.6 + _glowController.value * 0.4),
                blurRadius: 30 + (_glowController.value * 20),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                isImpostor
                    ? "TU ROL SECRETO ES"
                    : "LA PALABRA SECRETA ES",
                style: const TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 25),
              Text(
                isImpostor ? "IMPOSTOR" : role,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: neonColor,
                  shadows: [
                    Shadow(
                      color: neonColor.withOpacity(0.9),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isImpostor
                    ? "Descubre la palabra antes de que termine la ronda"
                    : "Memoriza la palabra y pasa el dispositivo",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        );
      },
    );
  }
}