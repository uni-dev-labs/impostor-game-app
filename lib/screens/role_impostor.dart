import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/hiding_role.dart';
import 'package:impostor/screens/rounds_screen.dart';
import 'package:provider/provider.dart';

class RoleImpostor extends StatelessWidget {
  const RoleImpostor({super.key});

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.playerCounter,
                          style: const TextStyle(color: purple, fontSize: 12),
                        ),
                        const Text(
                          'El Impostor',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
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
                                    'Tu Rol Secreto',
                                    style: TextStyle(color: subtitleGray, fontSize: 14),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Eres el',
                                    style: TextStyle(color: Colors.white, fontSize: 22),
                                  ),
                                  const Text(
                                    'IMPOSTOR',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(color: Color.fromARGB(255, 248, 137, 159), blurRadius: 10),
                                        Shadow(color: Color.fromARGB(255, 142, 2, 30), blurRadius: 20),
                                        Shadow(color: Color.fromARGB(255, 255, 21, 68), blurRadius: 40),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    width: 80,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      style: TextStyle(
                                        color: Color.fromARGB(135, 255, 255, 255),
                                        fontSize: 15,
                                      ),
                                      children: [
                                        TextSpan(text: 'Descubre la'),
                                        TextSpan(
                                          text: ' palabra secreta',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: '\nantes de que terminen las rondas.'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'No dejes que nadie sospeche de ti.',
                                    style: TextStyle(
                                      color: subtitleGray,
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -14,
                              right: -8,
                              child: Transform.rotate(
                                angle: 0.3,
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.visibility_off_sharp,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.gpp_maybe_rounded, color: subtitleGray, size: 18),
                          SizedBox(width: 6),
                          Text(
                            'Oculta la pantalla antes de continuar.',
                            style: TextStyle(color: subtitleGray, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
