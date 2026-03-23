import 'dart:async';
import 'package:flutter/material.dart';

class RoundPage extends StatefulWidget {
  final int totalRounds;
  final int secondsPerRound;
  final bool isImpostor;

  const RoundPage({
    super.key,
    this.totalRounds = 5,
    this.secondsPerRound = 120,
    required this.isImpostor,
  });

  @override
  State<RoundPage> createState() => _RoundPageState();
}

class _RoundPageState extends State<RoundPage>
    with SingleTickerProviderStateMixin {
  int _currentRound = 1;
  late int _secondsLeft;
  Timer? _timer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.secondsPerRound;
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.secondsPerRound),
    )..forward();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  void _nextRound() {
    if (_currentRound < widget.totalRounds) {
      setState(() {
        _currentRound++;
        _secondsLeft = widget.secondsPerRound;
        _progressController.reset();
        _progressController.forward();
        _timer?.cancel();
        _startTimer();
      });
    } else {
      // TODO: navegar a pantalla de votación
      debugPrint("Fin del juego");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  String get _timeFormatted {
    final m = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  double get _progress => _secondsLeft / widget.secondsPerRound;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A1A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              colors: [Color(0xFF1A1740), Color(0xFF0A0A1A)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 12),

                ///BAR 
                _TopBar(
                  currentRound: _currentRound,
                  totalRounds: widget.totalRounds,
                  isImpostor: widget.isImpostor,
                  onClose: () => Navigator.pop(context),
                ),

                const Spacer(),

                /// TIME CIRCLE
                _TimerCircle(
                  timeFormatted: _timeFormatted,
                  progress: _progress,
                ),

                const SizedBox(height: 40),
                const Text(
                  "El impostor está entre vosotros.\nObserva los gestos y haz preguntas clave.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 14, height: 1.6),
                ),

                const Spacer(),

                ///INTENTAR ADIVINAR (solo para impostores) 
                if (widget.isImpostor)
                  OutlinedButton.icon(
                    onPressed: () => debugPrint("Intentar adivinar"),
                    icon: const Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.white54),
                    label: const Text(
                      "Intentar adivinar",
                      style: TextStyle(color: Colors.white54),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 14),
                    ),
                  ),

                const SizedBox(height: 14),

                ///SIGUIENTE RONDA 
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nextRound,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C3BFF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      shadowColor: Colors.deepPurpleAccent,
                    ),
                    child: Text(
                      _currentRound < widget.totalRounds
                          ? "Siguiente ronda →"
                          : "Ir a votación →",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int currentRound;
  final int totalRounds;
  final bool isImpostor;
  final VoidCallback onClose;

  const _TopBar({
    required this.currentRound,
    required this.totalRounds,
    required this.isImpostor,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Botón cerrar
        GestureDetector(
          onTap: onClose,
          child: const Icon(Icons.close, color: Colors.white54, size: 22),
        ),

        /// Centro: rol + ronda
        Column(
          children: [
            Text(
              isImpostor ? "EL IMPOSTOR" : "JUGADOR",
              style: TextStyle(
                color: isImpostor ? Colors.redAccent : Colors.greenAccent,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              "Ronda $currentRound de $totalRounds",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),

        /// Botón ayuda
        GestureDetector(
          onTap: () => debugPrint("Ayuda"),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: const Icon(Icons.question_mark,
                color: Colors.white54, size: 14),
          ),
        ),
      ],
    );
  }
}

/// TIME
class _TimerCircle extends StatelessWidget {
  final String timeFormatted;
  final double progress;

  const _TimerCircle({required this.timeFormatted, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Arco de progreso
          SizedBox.expand(
            child: CustomPaint(
              painter: _ArcPainter(progress: progress),
            ),
          ),

          /// Tiempo
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeFormatted,
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                "TIEMPO RESTANTE",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _ArcPainter extends CustomPainter {
  final double progress;

  _ArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const strokeWidth = 8.0;

    // Fondo del arco
    final bgPaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Arco de progreso con gradiente azul-morado
    final progressPaint = Paint()
      ..shader = const SweepGradient(
        startAngle: -1.5708, // -pi/2 (top)
        endAngle: 4.7124,    // 3pi/2
        colors: [Color(0xFF6C3BFF), Color(0xFF4A90FF)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708,
      2 * 3.14159 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.progress != progress;
}