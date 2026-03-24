import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class RevealUserRolePage extends StatelessWidget {
  const RevealUserRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider provider =
        Provider.of<ConfigurationGameProvider>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: GameBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 18),
                FadeSlideIn(
                  child: Text(
                    'JUGADOR ${provider.currentRevealPlayerNumber} DE ${provider.players}',
                    style: TextStyle(
                      color: subtitleGray,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 90),
                  child: const Text(
                    'El impostor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 150),
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF12392D),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'ERES USUARIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF45E2A4),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 220),
                  beginOffset: const Offset(0, 0.08),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cardBorderColor, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'LA PALABRA SECRETA ES',
                          style: TextStyle(
                            color: subtitleGray,
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.9, end: 1),
                          duration: const Duration(milliseconds: 650),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value,
                            child: child,
                          ),
                          child: Text(
                            (provider.currentWord ?? '').toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'Memoriza la palabra y pasa el dispositivo al siguiente jugador.',
                    style: TextStyle(color: subtitleGray),
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 380),
                  child: CustomButton(
                    text: 'Pasar al siguiente jugador',
                    onPressed: () => _nextStep(context, provider),
                    color: purple,
                    icon: Icons.arrow_forward,
                    isIconInLeft: false,
                    height: 62,
                    borderRadius: 14,
                  ),
                ),
                const SizedBox(height: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextStep(BuildContext context, ConfigurationGameProvider provider) {
    if (provider.hasMorePlayersToReveal) {
      provider.nextRevealPlayer();
      Navigator.pushReplacementNamed(context, 'rotation-secret');
      return;
    }

    Navigator.pushReplacementNamed(context, 'rounds');
  }
}
