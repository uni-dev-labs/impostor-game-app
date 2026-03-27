import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class RoundsPage extends StatefulWidget {
  const RoundsPage({super.key});

  @override
  State<RoundsPage> createState() => _RoundsPageState();
}

class _RoundsPageState extends State<RoundsPage>
    with SingleTickerProviderStateMixin {
  static const int _roundDuration = 120; // segundos por ronda

  late AnimationController _animController;
  late Timer _timer;
  int _secondsLeft = _roundDuration;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: _roundDuration),
    )..forward();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isPaused) return;
      if (_secondsLeft <= 1) {
        _timer.cancel();
        _animController.stop();
        setState(() => _secondsLeft = 0);
        _onTimeUp();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _togglePause() {
    setState(() => _isPaused = !_isPaused);
    _isPaused ? _animController.stop() : _animController.forward();
  }

  void _resetTimer() {
    _timer.cancel();
    _animController.reset();
    setState(() {
      _secondsLeft = _roundDuration;
      _isPaused = false;
    });
    _animController.forward();
    _startTimer();
  }

  void _onTimeUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          '¡Tiempo!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'El tiempo de la ronda ha terminado.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _handleNextRound();
            },
            child: const Text(
              'Continuar',
              style: TextStyle(color: Color(0xFF5B3FF8)),
            ),
          ),
        ],
      ),
    );
  }

  void _handleNextRound() {
    final config = context.read<GameConfig>();
    if (config.isLastRound) {
      Navigator.pushReplacementNamed(context, '/final');
    } else {
      config.nextRound();
      _resetTimer();
    }
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<GameConfig>();
    final progress = _secondsLeft / _roundDuration;
    final isLowTime = _secondsLeft <= 20;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // ── AppBar ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _showExitDialog(context),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white54,
                        size: 28,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Ronda ${config.currentRound} de ${config.rounds}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showRulesDialog(context),
                      child: const Icon(
                        Icons.help_outline,
                        color: Colors.white54,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── Temporizador circular ───────────────────────────
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 240,
                    height: 240,
                    child: AnimatedBuilder(
                      animation: _animController,
                      builder: (_, __) => CustomPaint(
                        painter: _CircularTimerPainter(
                          progress: progress,
                          isLowTime: isLowTime,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        _formatTime(_secondsLeft),
                        style: TextStyle(
                          color: isLowTime
                              ? const Color(0xFFFF3D3D)
                              : Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const Text(
                        'TIEMPO RESTANTE',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Botón pausa
                      GestureDetector(
                        onTap: _togglePause,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E143F),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            _isPaused ? Icons.play_arrow : Icons.pause,
                            color: const Color(0xFF5B3FF8),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // ── Texto motivador ─────────────────────────────────
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'El impostor está entre vosotros.\nObserva los gestos y haz preguntas clave.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),

              const Spacer(),

              // ── Botón intentar adivinar ─────────────────────────
              TextButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/guess'),
                icon: const Icon(
                  Icons.location_searching,
                  color: Color(0xFF5B3FF8),
                  size: 18,
                ),
                label: const Text(
                  'Intentar adivinar',
                  style: TextStyle(
                    color: Color(0xFF5B3FF8),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ── Botón siguiente ronda ───────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _handleNextRound,
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: Text(
                    config.isLastRound
                        ? 'Ver resultado final'
                        : 'Siguiente ronda',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3FF8),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ── Diálogos ──────────────────────────────────────────────────
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          '¿Salir de la partida?',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Se perderá el progreso actual.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<GameConfig>().resetGame();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: const Text(
              'Salir',
              style: TextStyle(color: Color(0xFFFF3D3D)),
            ),
          ),
        ],
      ),
    );
  }

  void _showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Cómo jugar', style: TextStyle(color: Colors.white)),
        content: const Text(
          '• Los jugadores dan pistas sobre la palabra.\n'
          '• El impostor intenta pasar desapercibido.\n'
          '• Al final se vota quién es el impostor.\n'
          '• El impostor puede adivinar la palabra para ganar.',
          style: TextStyle(color: Colors.white70, height: 1.6),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Entendido',
              style: TextStyle(color: Color(0xFF5B3FF8)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Painter del temporizador circular ─────────────────────────
class _CircularTimerPainter extends CustomPainter {
  final double progress;
  final bool isLowTime;

  const _CircularTimerPainter({
    required this.progress,
    required this.isLowTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const strokeWidth = 10.0;
    const startAngle = -1.5707963; // -π/2 (arriba)

    // Pista de fondo
    final bgPaint = Paint()
      ..color = const Color(0xFF1E143F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Arco de progreso
    final fgPaint = Paint()
      ..color = isLowTime ? const Color(0xFFFF3D3D) : const Color(0xFF5B3FF8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * 3.1415926 * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularTimerPainter old) =>
      old.progress != progress || old.isLowTime != isLowTime;
}
