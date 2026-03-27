import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'final_impostor_wins_screen.dart';

/// Pantalla donde el impostor intenta adivinar la palabra secreta.
class GuessWordScreen extends StatefulWidget {
  final String secretWord;
  final List<ImpostorPlayer> impostors;
  final int totalRounds;
  final String gameTime;
  final int voteCount;

  const GuessWordScreen({
    super.key,
    required this.secretWord,
    required this.impostors,
    required this.totalRounds,
    required this.gameTime,
    required this.voteCount,
  });

  @override
  State<GuessWordScreen> createState() => _GuessWordScreenState();
}

class _GuessWordScreenState extends State<GuessWordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _submitted = false;
  bool? _correct;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final input = _controller.text.trim().toUpperCase();
    if (input.isEmpty) return;

    final correct = input == widget.secretWord.toUpperCase();

    setState(() {
      _submitted = true;
      _correct = correct;
    });

    // Pequeña pausa para que el usuario vea el feedback visual antes de navegar
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FinalImpostorWinsScreen(
            impostorGuessedCorrectly: correct,
            impostorGuess: input,
            secretWord: widget.secretWord,
            impostors: widget.impostors,
            totalRounds: widget.totalRounds,
            gameTime: widget.gameTime,
            voteCount: widget.voteCount,
            onPlayAgain: () => Navigator.popUntil(context, (r) => r.isFirst),
            onGoHome: () => Navigator.popUntil(context, (r) => r.isFirst),
          ),
        ),
      );
    });
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
              _TopLabel(),
              const Spacer(),
              _LightbulbIcon(),
              const SizedBox(height: 24),
              const _QuestionText(),
              const SizedBox(height: 16),
              const _DescriptionText(),
              const SizedBox(height: 40),
              _WordInputField(
                controller: _controller,
                submitted: _submitted,
                correct: _correct,
              ),
              const SizedBox(height: 20),
              _ConfirmButton(onPressed: _submitted ? null : _onConfirm),
              const Spacer(),
              _FooterText(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios,
              color: AppColors.primary, size: 18),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'PASE FINAL',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        const SizedBox(width: 18),
      ],
    );
  }
}

class _LightbulbIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withOpacity(0.15),
        border: Border.all(color: AppColors.primary.withOpacity(0.4), width: 2),
      ),
      child: const Icon(Icons.lightbulb_outline,
          color: AppColors.primary, size: 40),
    );
  }
}

class _QuestionText extends StatelessWidget {
  const _QuestionText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '¿Cuál era la\npalabra?',
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Te han descubierto, pero aún puedes ganar.\nSi adivinas la palabra secreta, ¡la victoria es tuya!',
      style: TextStyle(
        color: AppColors.textMuted,
        fontSize: 13,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _WordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool submitted;
  final bool? correct;

  const _WordInputField({
    required this.controller,
    required this.submitted,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = AppColors.primary.withOpacity(0.3);
    if (submitted && correct == true) borderColor = Colors.green;
    if (submitted && correct == false) borderColor = Colors.red;

    return TextField(
      controller: controller,
      enabled: !submitted,
      textCapitalization: TextCapitalization.characters,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
      decoration: InputDecoration(
        hintText: 'Escribe la palabra secreta',
        hintStyle: const TextStyle(
          color: AppColors.textHint,
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: AppColors.surfaceMuted,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        suffixIcon: submitted
            ? Icon(
                correct == true ? Icons.check_circle : Icons.cancel,
                color: correct == true ? Colors.green : Colors.red,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _ConfirmButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              onPressed == null ? AppColors.surfaceMuted : AppColors.primary,
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
              'Confirmar',
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

class _FooterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'EL IMPOSTOR TIENE UNA OPORTUNIDAD',
      style: TextStyle(
        color: AppColors.textFaint,
        fontSize: 10,
        letterSpacing: 2,
      ),
    );
  }
}