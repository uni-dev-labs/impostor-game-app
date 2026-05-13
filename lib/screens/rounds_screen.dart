import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/providers/round_provider.dart';
import 'package:impostor/screens/voting_screen.dart';
import 'package:provider/provider.dart';

class RoundsScreen extends StatelessWidget {
  const RoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RoundProvider()..start(),
      child: const _RoundsBody(),
    );
  }
}

class _RoundsBody extends StatelessWidget {
  const _RoundsBody();

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameSessionProvider>();
    final round = context.watch<RoundProvider>();

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(game),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimer(round),
                    const SizedBox(height: 40),
                    _buildTips(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: CustomButtonText(
                  textButton:
                      game.isLastRound ? 'VOTAR AL IMPOSTOR' : 'FINALIZAR RONDA',
                  iconRight:
                      game.isLastRound ? Icons.how_to_vote : Icons.arrow_forward_rounded,
                  onPressed: () => _handleFinishRound(context, game, round),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(GameSessionProvider game) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RONDA ${game.currentRound} DE ${game.totalRounds}',
                style: const TextStyle(
                  color: purple,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Text(
                'Fase de discusión',
                style: TextStyle(color: subtitleGray, fontSize: 12),
              ),
            ],
          ),
          Row(
            children: List.generate(game.totalRounds, (i) {
              final active = i < game.currentRound;
              return Container(
                margin: const EdgeInsets.only(left: 6),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: active ? purple : purpleDark,
                  shape: BoxShape.circle,
                  border: Border.all(color: purple.withValues(alpha: 0.5), width: 1),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer(RoundProvider round) {
    final timerColor = round.progress > 0.3 ? purple : Colors.red;
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  value: round.progress,
                  strokeWidth: 8,
                  backgroundColor: purpleDark,
                  valueColor: AlwaysStoppedAnimation<Color>(timerColor),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    round.formattedTime,
                    style: TextStyle(
                      color: round.isFinished ? Colors.red : Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'TIEMPO',
                    style: TextStyle(
                      color: subtitleGray,
                      fontSize: 11,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (round.isFinished)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
              ),
              child: const Text(
                '¡Tiempo agotado!',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardBorderColor),
        ),
        child: Column(
          children: [
            const Text(
              'CÓMO JUGAR',
              style: TextStyle(
                color: purple,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            _tip(Icons.chat_bubble_outline,
                'Habla sobre la palabra sin revelarla directamente'),
            const SizedBox(height: 8),
            _tip(Icons.search,
                'Observa quién hace preguntas vagas o confusas'),
            const SizedBox(height: 8),
            _tip(Icons.how_to_vote,
                'Al final votarán quién creen que es el impostor'),
          ],
        ),
      ),
    );
  }

  Widget _tip(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: purple, size: 16),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: subtitleGray, fontSize: 12),
          ),
        ),
      ],
    );
  }

  void _handleFinishRound(
    BuildContext context,
    GameSessionProvider game,
    RoundProvider round,
  ) {
    if (game.isLastRound) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const VotingScreen(),
          ),
        ),
      );
    } else {
      game.advanceToNextRound();
      round.reset();
      round.start();
    }
  }
}
