import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<GameConfig>();
    final impostorWon = config.impostorWon;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 32),

              // ── Icono de resultado ──────────────────────────────
              _buildResultIcon(impostorWon),

              const SizedBox(height: 24),

              // ── Título ──────────────────────────────────────────
              _buildTitle(impostorWon),

              const SizedBox(height: 8),

              // ── Subtítulo ───────────────────────────────────────
              Text(
                impostorWon
                    ? 'Lograron pasar desapercibidos'
                    : 'Los usuarios detectaron al impostor',
                style: const TextStyle(color: Colors.white54, fontSize: 15),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36),

              // ── Palabra revelada ────────────────────────────────
              _buildRevealedWord(config.secretWord),

              const SizedBox(height: 28),

              // ── Lista de impostores ─────────────────────────────
              _buildImpostorList(config),

              const SizedBox(height: 28),

              // ── Estadísticas ────────────────────────────────────
              _buildStats(config),

              const SizedBox(height: 40),

              // ── Botones ─────────────────────────────────────────
              _buildButtons(context, config),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ── Icono resultado ───────────────────────────────────────────
  Widget _buildResultIcon(bool impostorWon) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: impostorWon ? const Color(0xFF1A0A0A) : const Color(0xFF0A1A14),
        border: Border.all(
          color: impostorWon
              ? const Color(0xFFFF3D3D)
              : const Color(0xFF00C853),
          width: 3,
        ),
      ),
      child: Icon(
        impostorWon ? Icons.theater_comedy : Icons.emoji_events,
        size: 52,
        color: impostorWon ? const Color(0xFFFF3D3D) : const Color(0xFFFFD700),
      ),
    );
  }

  // ── Título ────────────────────────────────────────────────────
  Widget _buildTitle(bool impostorWon) {
    if (impostorWon) {
      return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
          children: [
            TextSpan(
              text: '¡El Impostor ',
              style: TextStyle(color: Colors.white),
            ),
            TextSpan(
              text: 'ganó',
              style: TextStyle(color: Color(0xFFFF3D3D)),
            ),
            TextSpan(
              text: '!',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          height: 1.2,
        ),
        children: [
          TextSpan(
            text: '¡Los usuarios ',
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'ganaron',
            style: TextStyle(color: Color(0xFF00C853)),
          ),
          TextSpan(
            text: '!',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // ── Palabra revelada ──────────────────────────────────────────
  Widget _buildRevealedWord(String word) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF5B3FF8).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'LA PALABRA SECRETA ERA',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            word.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }

  // ── Lista de impostores ───────────────────────────────────────
  Widget _buildImpostorList(GameConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LOS IMPOSTORES ERAN',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 11,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        ...config.impostorIndexes.map((index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFFF3D3D).withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF2A0A0A),
                    border: Border.all(
                      color: const Color(0xFFFF3D3D),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFFFF3D3D),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),

                // Nombre real del jugador
                Expanded(
                  child: Text(
                    config.getPlayerName(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Badge IMPOSTOR
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3D3D).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'IMPOSTOR',
                    style: TextStyle(
                      color: Color(0xFFFF3D3D),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ── Estadísticas ──────────────────────────────────────────────
  Widget _buildStats(GameConfig config) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem(config.rounds.toString(), 'RONDAS', Icons.loop),
          _statDivider(),
          _statItem('${config.rounds * 2}:00', 'MINUTOS', Icons.timer_outlined),
          _statDivider(),
          _statItem(
            config.totalPlayers.toString(),
            'JUGADORES',
            Icons.people_outline,
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF5B3FF8), size: 22),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _statDivider() {
    return Container(height: 50, width: 1, color: const Color(0xFF2A2A4A));
  }

  // ── Botones ───────────────────────────────────────────────────
  Widget _buildButtons(BuildContext context, GameConfig config) {
    return Column(
      children: [
        // Jugar otra vez (misma config y mismos nombres)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              config.startGame();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/rotation-hide',
                (route) => route.settings.name == '/',
              );
            },
            icon: const Icon(Icons.replay, color: Colors.white),
            label: const Text(
              'Jugar otra vez',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B3FF8),
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Volver al inicio (resetea todo incluyendo nombres)
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              config.resetAll();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: const Icon(Icons.home_outlined, color: Colors.white70),
            label: const Text(
              'Volver al inicio',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              side: const BorderSide(color: Color(0xFF2A2A4A), width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}