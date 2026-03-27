import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Pantalla principal de la ronda con temporizador circular.
class RoundScreen extends StatefulWidget {
  final int roundNumber;
  final int totalRounds;
  final int totalSeconds;
  final VoidCallback onNextRound;
  final VoidCallback onTryGuess;

  const RoundScreen({
    super.key,
    required this.roundNumber,
    required this.totalRounds,
    required this.totalSeconds,
    required this.onNextRound,
    required this.onTryGuess,
  });

  @override
  State<RoundScreen> createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen>
    with SingleTickerProviderStateMixin {
  late int _remaining;
  Timer? _timer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _remaining = widget.totalSeconds;
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalSeconds),
    )..forward();

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remaining <= 0) {
        t.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  double get _progress => _remaining / widget.totalSeconds;

  Color get _timerColor {
    if (_progress > 0.5) return AppColors.primary;
    if (_progress > 0.25) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _TopBar(
                roundNumber: widget.roundNumber,
                totalRounds: widget.totalRounds,
              ),
              const Spacer(),
              _CircularTimer(
                timeText: _formatTime(_remaining),
                progress: _progress,
                color: _timerColor,
              ),
              const SizedBox(height: 30),
              _HintText(),
              const Spacer(),
              _TryGuessButton(onPressed: widget.onTryGuess),
              const SizedBox(height: 16),
              _NextRoundButton(onPressed: widget.onNextRound),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int roundNumber;
  final int totalRounds;

  const _TopBar({required this.roundNumber, required this.totalRounds});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.close, color: AppColors.textMuted, size: 22),
        ),
        Column(
          children: [
            Text(
              'EL IMPOSTOR',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ronda $roundNumber de $totalRounds',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Icon(Icons.help_outline, color: AppColors.textMuted, size: 22),
      ],
    );
  }
}

class _CircularTimer extends StatelessWidget {
  final String timeText;
  final double progress;
  final Color color;

  const _CircularTimer({
    required this.timeText,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 220,
            height: 220,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8,
              backgroundColor: AppColors.surfaceMuted,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeText,
                style: TextStyle(
                  color: color,
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'TIEMPO RESTANTE',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HintText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'El impostor está entre vosotros.\nObserva los gestos y haz preguntas clave.',
      style: TextStyle(
        color: AppColors.textMuted,
        fontSize: 13,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _TryGuessButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _TryGuessButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, color: AppColors.primary, size: 16),
          const SizedBox(width: 6),
          Text(
            'Intentar adivinar',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _NextRoundButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _NextRoundButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Siguiente ronda',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}