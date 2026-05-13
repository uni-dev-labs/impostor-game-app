import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';

class GameResultScreen extends StatelessWidget {
  final bool impostorCaught;
  final int votedPlayerIndex;
  final GameSessionProvider game;

  const GameResultScreen({
    super.key,
    required this.impostorCaught,
    required this.votedPlayerIndex,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      _buildResultIcon(),
                      const SizedBox(height: 24),
                      _buildResultTitle(),
                      const SizedBox(height: 10),
                      _buildResultSubtitle(),
                      const SizedBox(height: 36),
                      _buildRevealCard(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: CustomButtonText(
                  textButton: 'JUGAR OTRA VEZ',
                  iconLeft: Icons.replay_rounded,
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultIcon() {
    final color = impostorCaught ? const Color(0xFF10A164) : Colors.red;
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(
        impostorCaught ? Icons.check_circle_outline : Icons.cancel_outlined,
        color: color,
        size: 64,
      ),
    );
  }

  Widget _buildResultTitle() {
    return Text(
      impostorCaught ? '¡IMPOSTOR ATRAPADO!' : '¡EL IMPOSTOR ESCAPÓ!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: impostorCaught ? const Color(0xFF10A164) : Colors.red,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildResultSubtitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        impostorCaught
            ? '¡Los jugadores encontraron al impostor. Buen trabajo!'
            : 'El impostor logró engañar a todos. ¡Mejor suerte la próxima!',
        textAlign: TextAlign.center,
        style: const TextStyle(color: subtitleGray, fontSize: 14, height: 1.4),
      ),
    );
  }

  Widget _buildRevealCard() {
    final impostorIndices = game.impostorIndices;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cardBorderColor),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, color: subtitleGray, size: 16),
                const SizedBox(width: 6),
                const Text(
                  'REVELACIÓN FINAL',
                  style: TextStyle(
                    color: subtitleGray,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: subtitleGray, fontSize: 14),
                children: [
                  const TextSpan(text: 'La palabra secreta era:\n'),
                  TextSpan(
                    text: game.secretWord.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: cardBorderColor, height: 1),
            const SizedBox(height: 16),
            Text(
              impostorIndices.length == 1
                  ? 'El impostor era: Jugador ${impostorIndices.first + 1}'
                  : 'Los impostores eran: ${impostorIndices.map((i) => 'Jugador ${i + 1}').join(', ')}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!impostorCaught) ...[
              const SizedBox(height: 6),
              Text(
                'Votaste a: Jugador ${votedPlayerIndex + 1}',
                style: const TextStyle(color: subtitleGray, fontSize: 13),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
