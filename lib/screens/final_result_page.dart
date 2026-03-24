import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class FinalResultPage extends StatelessWidget {
  const FinalResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider provider =
        Provider.of<ConfigurationGameProvider>(context);
    final bool impostorsWon = provider.impostorsWon;
    final String title = impostorsWon ? 'El impostor gano' : 'Los usuarios ganaron';
    final String subtitle = impostorsWon
        ? 'Lograron pasar desapercibidos.'
        : 'Descubrieron al impostor y protegieron la palabra.';

    return Scaffold(
      backgroundColor: primaryColor,
      body: GameBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 26),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 90),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.88, end: 1),
                    duration: const Duration(milliseconds: 650),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) => Transform.scale(
                      scale: value,
                      child: child,
                    ),
                    child: Container(
                      width: 110,
                      height: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: purple.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.emoji_events, size: 56, color: purple),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 170),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 230),
                  child: Text(
                    subtitle,
                    style: TextStyle(color: subtitleGray, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 280),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'La palabra secreta era',
                          style: TextStyle(color: subtitleGray),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (provider.currentWord ?? '').toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 330),
                  child: Text(
                    'Los impostores eran',
                    style: TextStyle(color: subtitleGray, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: FadeSlideIn(
                    delay: const Duration(milliseconds: 380),
                    child: ListView.builder(
                      itemCount: provider.impostorPlayerNumbers.length,
                      itemBuilder: (BuildContext context, int index) {
                        final int player = provider.impostorPlayerNumbers[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: purple.withValues(alpha: 0.2),
                                child: Icon(Icons.person, color: purple),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Jugador $player',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(Icons.visibility, color: subtitleGray),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 430),
                  child: CustomButton(
                    text: 'Jugar otra vez',
                    onPressed: () => _playAgain(context, provider),
                    color: purple,
                    height: 62,
                    borderRadius: 14,
                  ),
                ),
                const SizedBox(height: 10),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 480),
                  child: OutlinedButton(
                    onPressed: () {
                      provider.resetGameProgress();
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: subtitleGray),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(54),
                    ),
                    child: Text(
                      'Volver al inicio',
                      style: TextStyle(color: subtitleGray, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _playAgain(BuildContext context, ConfigurationGameProvider provider) {
    try {
      provider.startGame();
      Navigator.pushNamedAndRemoveUntil(context, 'rotation-secret', (route) => false);
    } catch (_) {
      Navigator.pushNamedAndRemoveUntil(context, 'configuration-game', (route) => false);
    }
  }
}
