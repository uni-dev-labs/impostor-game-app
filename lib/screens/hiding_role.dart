import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/role_reveal.dart';
import 'package:provider/provider.dart';

class HidingRole extends StatelessWidget {
  const HidingRole({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.visibility_off, color: subtitleGray, size: 14),
                        const SizedBox(width: 4),
                        const Text(
                          'PRIVACIDAD ACTIVA',
                          style: TextStyle(color: subtitleGray, fontSize: 11),
                        ),
                      ],
                    ),
                    Text(
                      game.stepCounter,
                      style: const TextStyle(color: subtitleGray, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: purpleWithOpacity,
                          shape: BoxShape.circle,
                          border: Border.all(color: purple, width: 1),
                        ),
                        child: const Icon(Icons.person, color: purple, size: 56),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        game.currentPlayerName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Es tu turno de ver la palabra secreta',
                        style: TextStyle(color: subtitleGray, fontSize: 15),
                      ),
                      const SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value: game,
                                child: const RoleReveal(),
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: purple.withValues(alpha: 0.3), width: 1),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: purple,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.touch_app_rounded, color: Colors.white, size: 28),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'TOCA PARA REVELAR',
                        style: TextStyle(
                          color: purple,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: warningText,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: cardBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: purpleWithOpacity,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: purple, width: 1),
                                ),
                                child: const Icon(Icons.shield, color: purple, size: 20),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Asegúrate de que nadie más esté\nmirando la pantalla antes de tocar.',
                                  style: TextStyle(color: subtitleGray, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
