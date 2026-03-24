import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class RevealImpostorRolePage extends StatelessWidget {
  const RevealImpostorRolePage({super.key});

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
                    'Tu rol secreto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 190),
                  beginOffset: const Offset(0, 0.08),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cardBorderColor, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'ERES EL',
                          style: TextStyle(
                            color: subtitleGray,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.92, end: 1),
                          duration: const Duration(milliseconds: 850),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value,
                            child: child,
                          ),
                          child: const Text(
                            'IMPOSTOR',
                            style: TextStyle(
                              color: Color(0xFFFF6666),
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Descubre la palabra secreta antes de que acaben las rondas.',
                          style: TextStyle(color: subtitleGray, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 260),
                  child: Text(
                    'No dejes que nadie sospeche de ti.',
                    style: TextStyle(color: subtitleGray),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 340),
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
