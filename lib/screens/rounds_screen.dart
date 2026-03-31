import 'dart:math';
import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/providers/round_provider.dart';
import 'package:provider/provider.dart';

class RoundsScreen extends StatefulWidget {
  const RoundsScreen({super.key});

  @override
  State<RoundsScreen> createState() => _RoundsScreenState();
}

class _RoundsScreenState extends State<RoundsScreen> {
  late RoundProvider _roundProvider;

  @override
  void initState() {
    super.initState();
    _roundProvider = RoundProvider();
    _roundProvider.start(); // arranca el cronómetro al entrar a la pantalla
  }

  @override
  void dispose() {
    _roundProvider.dispose();
    super.dispose();
  }

  void _handleNext(GameSessionProvider game) {
    _roundProvider.reset(); // resetea el cronómetro

    if (game.isLastRound) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'guess-missingword',
        (route) => false,
      );
    } else {
      game.advanceToNextRound();
      // Recarga la misma pantalla con el cronómetro reseteado
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const RoundsScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameSessionProvider>();

    return ChangeNotifierProvider.value(
      value: _roundProvider,
      child: BackgraundScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                // Header manual
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.close_rounded, color: subtitleGray, size: 16),
                      Column(
                        children: [
                          Text(
                            'EL IMPOSTOR',
                            style: TextStyle(color: purple, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Ronda ${game.currentRound} de ${game.totalRounds}',
                            style: TextStyle(color: subtitleGray, fontSize: 14),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.help_outline_rounded,
                        color: subtitleGray,
                        size: 16,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<RoundProvider>(
                          builder: (context, round, _) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: CustomPaint(
                                    painter: _TimerPainter(
                                      progress: round.progress,
                                      isFinished: round.isFinished,
                                    ),
                                  ),
                                ),
                                Text(
                                  round.formattedTime,
                                  style: TextStyle(
                                    color: round.isFinished
                                        ? Colors.red
                                        : Colors.white,
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Positioned(
                                  bottom: 50,
                                  child: Text(
                                    'TIEMPO RESTANTE',
                                    style: TextStyle(
                                      color: subtitleGray,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: 32),
                        Text(
                          'El impostor está entre uno de ustedes.\nObserven los gestos y hagan\npreguntas clave.',
                          style: TextStyle(color: subtitleGray, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButtonText(
                            iconLeft: Icons.lightbulb_outline_rounded,
                            colorButton: Colors.transparent,
                            borderButon: purple,
                            textButton: 'Intentar adivinar',
                            textColor: purple,
                            iconColor: purple,
                            onPressed: () => '',                            
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButtonText(
                            textButton: game.isLastRound
                                ? 'Ver resultados'
                                : 'Siguiente ronda',
                            onPressed: () => _handleNext(game),
                            iconRight: Icons.arrow_right_alt_rounded,
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
      ),
    );
  }
}

class _TimerPainter extends CustomPainter {
  final double progress;
  final bool isFinished;

  _TimerPainter({required this.progress, required this.isFinished});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Círculo de fondo
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white10
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6,
    );

    // Arco de progreso
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // empieza desde arriba
      2 * pi * progress, // avanza según el tiempo restante
      false,
      Paint()
        ..color = isFinished ? Colors.red : purple
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_TimerPainter old) =>
      old.progress != progress || old.isFinished != isFinished;
}
