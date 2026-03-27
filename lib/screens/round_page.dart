import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class RoundPage extends StatefulWidget {
  const RoundPage({super.key});

  @override
  State<RoundPage> createState() => _RoundPageState();
}

class _RoundPageState extends State<RoundPage> {
  static const int _secondsPerRound = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ConfigurationGameProvider provider =
          Provider.of<ConfigurationGameProvider>(context, listen: false);
      provider.startRound(secondsPerRound: _secondsPerRound);
      _startTimer();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final ConfigurationGameProvider provider =
          Provider.of<ConfigurationGameProvider>(context, listen: false);
      provider.tickRoundTimer();
      if (provider.secondsLeft <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider provider =
        Provider.of<ConfigurationGameProvider>(context);
    final int seconds = provider.secondsLeft;
    final double progress = (seconds / _secondsPerRound).clamp(0, 1).toDouble();

    return Scaffold(
      backgroundColor: primaryColor,
      body: GameBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 14),
                FadeSlideIn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EL IMPOSTOR',
                        style: TextStyle(
                          color: purple,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        'Ronda ${provider.currentRound} de ${provider.rounds}',
                        style: TextStyle(color: subtitleGray),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 120),
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 230,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 12,
                              backgroundColor: cardColor,
                              color: purple,
                            ),
                          ),
                          TweenAnimationBuilder<double>(
                            tween: Tween(
                              begin: 1,
                              end: seconds <= 10
                                  ? (seconds.isEven ? 1.08 : 0.94)
                                  : 1,
                            ),
                            duration: const Duration(milliseconds: 450),
                            curve: Curves.easeInOut,
                            builder: (context, value, child) => Transform.scale(
                              scale: value,
                              child: child,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _formatSeconds(seconds),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 56,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'TIEMPO RESTANTE',
                                  style: TextStyle(
                                    color: subtitleGray,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 210),
                  child: Text(
                    'El impostor esta entre vosotros. Observa y haz preguntas clave.',
                    style: TextStyle(color: subtitleGray, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 280),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _timer?.cancel();
                      Navigator.pushNamed(context, 'guess-word');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: purple, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size.fromHeight(58),
                    ),
                    icon: Icon(Icons.lightbulb_outline, color: purple),
                    label: Text(
                      'Intentar adivinar',
                      style: TextStyle(color: purple, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 340),
                  child: CustomButton(
                    text: provider.isLastRound ? 'Ver resultado' : 'Siguiente ronda',
                    onPressed: () => _nextRound(context, provider),
                    color: purple,
                    icon: Icons.arrow_forward,
                    isIconInLeft: false,
                    height: 62,
                    borderRadius: 14,
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

  String _formatSeconds(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _nextRound(BuildContext context, ConfigurationGameProvider provider) {
    _timer?.cancel();
    if (provider.isLastRound) {
      provider.finishGame(impostorsWon: true);
      Navigator.pushReplacementNamed(context, 'final-result');
      return;
    }

    provider.nextRound();
    Navigator.pushReplacementNamed(context, 'rounds');
  }
}
