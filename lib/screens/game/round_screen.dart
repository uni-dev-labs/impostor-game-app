import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/game_data.dart';
import 'result_screen.dart';
import 'guess_word_screen.dart';

class RoundScreen extends StatefulWidget {
  final GameSession session;
  const RoundScreen({super.key, required this.session});

  @override
  State<RoundScreen> createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  static const int roundDurationSeconds = 180;
  int _secondsLeft = roundDurationSeconds;
  Timer? _timer;

  // COLORES DEL MOCKUP
  final Color _bgColor = const Color(0xFF0B0B19);
  final Color _cardColor = const Color(0xFF16162C);
  final Color _primaryPurple = const Color(0xFF5636F3);
  final Color _textMuted = const Color(0xFF7A7A9D);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    int minutes = _secondsLeft ~/ 60;
    int seconds = _secondsLeft % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _endGame(bool impostorWon) {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(session: widget.session, impostorWon: impostorWon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              // --- ENCABEZADO SUPERIOR ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.close, color: _textMuted),
                      onPressed: () {
                        _timer?.cancel();
                        Navigator.pop(context);
                      }
                  ),
                  Column(
                    children: [
                      Text(
                          "EL IMPOSTOR",
                          style: TextStyle(color: _primaryPurple, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)
                      ),
                      const SizedBox(height: 4),
                      Text(
                          "Ronda 1 de 1",
                          style: TextStyle(color: _textMuted, fontSize: 12)
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.help_outline, color: _textMuted),
                      onPressed: () { /* Mostrar reglas */ }
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // --- CÍRCULO DEL TEMPORIZADOR ---
              Stack(
                alignment: Alignment.center,
                children: [
                  // Círculo de fondo oscuro
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _cardColor.withOpacity(0.3),
                    ),
                  ),
                  // Progreso Circular (Morado)
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 1.0, end: _secondsLeft / roundDurationSeconds),
                        duration: const Duration(seconds: 1),
                        builder: (context, value, _) {
                          return CircularProgressIndicator(
                            value: value,
                            strokeWidth: 15,
                            backgroundColor: _cardColor,
                            color: _primaryPurple,
                            strokeCap: StrokeCap.round,
                          );
                        }
                    ),
                  ),
                  // Textos centrales
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formattedTime,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                          "TIEMPO RESTANTE",
                          style: TextStyle(color: _textMuted, fontSize: 12, letterSpacing: 2.0, fontWeight: FontWeight.bold)
                      ),
                    ],
                  )
                ],
              ),

              const Spacer(flex: 2),

              // --- INSTRUCCIONES ---
              const Text(
                "El impostor está entre vosotros.\nObserva los gestos y haz preguntas\nclave.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
              ),

              const Spacer(flex: 1),

              // --- BOTONES DE ACCIÓN ---

              // Botón secundario: Adivinar
              TextButton.icon(
                onPressed: () {
                  _timer?.cancel();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuessWordScreen(session: widget.session),
                    ),
                  ).then((_) {
                    if (mounted && _secondsLeft > 0) {
                      _startTimer();
                    }
                  });
                },
                icon: Icon(Icons.lightbulb_outline, color: _primaryPurple, size: 20),
                label: Text(
                    "Intentar adivinar",
                    style: TextStyle(color: _primaryPurple, fontSize: 16, fontWeight: FontWeight.bold)
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),

              const SizedBox(height: 15),

              // Botón principal (Ganan usuarios)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => _endGame(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          "Atrapamos al impostor",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
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