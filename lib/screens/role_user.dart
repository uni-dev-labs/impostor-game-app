import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/hiding_role.dart';
import 'package:impostor/screens/rounds_screen.dart';
import 'package:provider/provider.dart';

class RoleUser extends StatelessWidget {
  const RoleUser({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameSessionProvider>();

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      game.playerCounter,
                      style: const TextStyle(color: purple, fontSize: 12),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: purpleWithOpacity,
                        shape: BoxShape.circle,
                        border: Border.all(color: purple, width: 1),
                      ),
                      child: const Icon(Icons.person, color: purple, size: 24),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(113, 16, 161, 100),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 16, 161, 101),
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.circle, color: Color.fromARGB(255, 16, 161, 101), size: 10),
                            SizedBox(width: 6),
                            Text(
                              'ERES USUARIO',
                              style: TextStyle(
                                color: Color.fromARGB(255, 16, 161, 101),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: warningText,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: cardBorderColor, width: 1),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'LA PALABRA SECRETA ES',
                                style: TextStyle(color: subtitleGray, fontSize: 12, letterSpacing: 1),
                              ),
                              const SizedBox(height: 16),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  game.secretWord.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                width: 80,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 16, 161, 101),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.visibility_off, color: Colors.orange, size: 14),
                                  SizedBox(width: 6),
                                  Text(
                                    'No muestres esta palabra a nadie',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Memoriza la palabra y pasa el dispositivo al siguiente jugador con cuidado.',
                          style: TextStyle(color: subtitleGray, fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButtonText(
                          textButton: 'Siguiente',
                          iconRight: Icons.arrow_forward_rounded,
                          onPressed: () => _handleNext(context, game),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNext(BuildContext context, GameSessionProvider game) {
    if (game.isLastPlayer) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const RoundsScreen(),
          ),
        ),
        (route) => route.isFirst,
      );
    } else {
      game.advanceToNextPlayer(notify: false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const HidingRole(),
          ),
        ),
      );
    }
  }
}
