import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impostor/screens/round_page.dart';

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
      duration: const Duration(milliseconds: 800),
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
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => RoundPage(
        totalRounds: 5,
        secondsPerRound: 120,
        isImpostor: widget.playerRoles[_currentPlayerIndex] == "IMPOSTOR",
      ),
    ),
  );
}
}
}

  @override
  Widget build(BuildContext context) {
    String role = widget.playerRoles[_currentPlayerIndex];
    bool isImpostor = role == "IMPOSTOR";
    Color neonColor = isImpostor ? Colors.redAccent : Colors.greenAccent;
    int total = widget.playerRoles.length;
    int playerNum = _currentPlayerIndex + 1;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A1A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              colors: [Color(0xFF1A1740), Color(0xFF0A0A1A)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 12),

                
                _TopBar(playerNum: playerNum, total: total),

                const SizedBox(height: 40),

                if (!_isRevealed) ...[
                  _HiddenContent(
                    playerNum: playerNum,
                    glowController: _glowController,
                    onTap: _nextStep,
                  ),
                ] else ...[
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _flipController,
                      builder: (context, child) {
                        double angle = _flipController.value * 2 * pi;
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(angle),
                          child: _buildCard(role, isImpostor, neonColor),
                        );
                      },
                    ),
                  ),
                ],

                const SizedBox(height: 20),
                if (_isRevealed)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextStep,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C3BFF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: Colors.deepPurpleAccent,
                      ),
                      child: Text(
                        playerNum < total
                            ? "Pasar al siguiente →"
                            : "¡Comenzar el juego!",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
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
                color: neonColor
                    .withOpacity(0.6 + _glowController.value * 0.4),
                blurRadius: 30 + (_glowController.value * 20),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isImpostor ? "TU ROL SECRETO ES" : "LA PALABRA SECRETA ES",
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
              const SizedBox(height: 25),
              Text(
                isImpostor ? "IMPOSTOR" : role,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: neonColor,
                  shadows: [Shadow(color: neonColor.withOpacity(0.9), blurRadius: 20)],
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

class _TopBar extends StatelessWidget {
  final int playerNum;
  final int total;

  const _TopBar({required this.playerNum, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Título con ícono
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, color: Colors.white54, size: 16),
            const SizedBox(width: 6),
            const Text(
              "Rotación: Ocultar Rol",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// Badges: Privacidad + Paso
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Badge(
              icon: Icons.privacy_tip_outlined,
              label: "PRIVACIDAD ACTIVA",
              color: Colors.deepPurpleAccent,
            ),
            _Badge(
              icon: null,
              label: "PASO $playerNum DE $total",
              color: Colors.white24,
            ),
          ],
        ),

        const SizedBox(height: 8),

        /// Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: playerNum / total,
            backgroundColor: Colors.white12,
            valueColor: const AlwaysStoppedAnimation(Color(0xFF6C3BFF)),
            minHeight: 3,
          ),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color color;

  const _Badge({this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color, size: 12),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color == Colors.white24 ? Colors.white70 : color,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
class _HiddenContent extends StatelessWidget {
  final int playerNum;
  final AnimationController glowController;
  final VoidCallback onTap;

  const _HiddenContent({
    required this.playerNum,
    required this.glowController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Avatar de persona
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6C3BFF).withOpacity(0.2),
                border: Border.all(
                  color: const Color(0xFF6C3BFF).withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF6C3BFF),
                size: 38,
              ),
            ),

            const SizedBox(height: 24),

            /// Nombre jugador
            Text(
              "Jugador $playerNum",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Es tu turno de ver el secreto",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),

            const SizedBox(height: 50),

            /// Ícono de toque con glow
            AnimatedBuilder(
              animation: glowController,
              builder: (_, __) {
                return Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                        .withOpacity(0.15 + glowController.value * 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple
                            .withOpacity(0.4 + glowController.value * 0.4),
                        blurRadius: 25 + (glowController.value * 20),
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.touch_app,
                    color: Colors.white,
                    size: 34,
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            const Text(
              "TOCA PARA REVELAR",
              style: TextStyle(
                color: Color(0xFF6C3BFF),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 40),

            /// Aviso de privacidad
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.shield_outlined, color: Colors.white38, size: 14),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      "Asegúrate de que nadie más esté mirando la pantalla antes de tocar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white38, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}