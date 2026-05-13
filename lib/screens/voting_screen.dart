import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/game_result_screen.dart';
import 'package:provider/provider.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int? _selectedPlayer;

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameSessionProvider>();

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      ...List.generate(game.totalPlayers, (i) {
                        final isSelected = _selectedPlayer == i;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedPlayer = i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? purple.withValues(alpha: 0.15)
                                  : cardColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected ? purple : cardBorderColor,
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: isSelected ? purple : purpleDark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.person,
                                      color: Colors.white, size: 22),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Jugador ${i + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                if (isSelected)
                                  const Icon(Icons.check_circle,
                                      color: purple, size: 22),
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: CustomButtonText(
                  textButton: 'CONFIRMAR VOTO',
                  iconRight: Icons.how_to_vote,
                  colorButton: _selectedPlayer == null
                      ? purpleDark
                      : const Color.fromRGBO(67, 34, 237, 1),
                  onPressed:
                      _selectedPlayer == null ? null : () => _confirm(context, game),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          const Text(
            'VOTACIÓN',
            style: TextStyle(
              color: purple,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '¿Quién crees que es el impostor?',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          const Text(
            'Selecciona al sospechoso y confirma',
            style: TextStyle(color: subtitleGray, fontSize: 13),
          ),
        ],
      ),
    );
  }

  void _confirm(BuildContext context, GameSessionProvider game) {
    if (_selectedPlayer == null) return;
    final caught = game.isPlayerImpostor(_selectedPlayer!);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => GameResultScreen(
          impostorCaught: caught,
          votedPlayerIndex: _selectedPlayer!,
          game: game,
        ),
      ),
    );
  }
}
