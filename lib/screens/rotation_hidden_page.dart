import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class RotationHiddenPage extends StatelessWidget {
  const RotationHiddenPage({super.key});

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
              children: [
                const SizedBox(height: 16),
                FadeSlideIn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PRIVACIDAD ACTIVA',
                        style: TextStyle(
                          color: subtitleGray,
                          fontSize: 11,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'PASO ${provider.currentRevealPlayerNumber} DE ${provider.players}',
                        style: TextStyle(
                          color: subtitleGray,
                          fontSize: 11,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 120),
                  beginOffset: const Offset(0, 0.08),
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: cardBorderColor, width: 2),
                    ),
                    child: Column(
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.92, end: 1),
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value,
                            child: child,
                          ),
                          child: Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              color: purple.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                              border: Border.all(color: purple.withValues(alpha: 0.4)),
                            ),
                            child: const Icon(Icons.person, color: Colors.white, size: 40),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          'Jugador ${provider.currentRevealPlayerNumber}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Es tu turno de ver el secreto',
                          style: TextStyle(color: subtitleGray, fontSize: 16),
                        ),
                        const SizedBox(height: 28),
                        GestureDetector(
                          onTap: () => _revealRole(context, provider),
                          child: Text(
                            'TOCA PARA REVELAR',
                            style: TextStyle(
                              color: purple,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 230),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip_outlined, color: purple, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Asegurate de que nadie mas este mirando la pantalla.',
                            style: TextStyle(color: subtitleGray, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 300),
                  child: CustomButton(
                    text: 'Cancelar partida',
                    onPressed: () {
                      provider.resetGameProgress();
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    color: Colors.transparent,
                    height: 54,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _revealRole(BuildContext context, ConfigurationGameProvider provider) {
    if (provider.currentWord == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'configuration-game',
        (route) => false,
      );
      return;
    }

    final String route =
        provider.isCurrentPlayerImpostor ? 'reveal-impostor-role' : 'reveal-user-role';

    Navigator.pushReplacementNamed(context, route);
  }
}