import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class PlayersRolPage extends StatelessWidget {
  const PlayersRolPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appBar(context, gameProvider),
              const Spacer(),
              _playerIcon(),
              const SizedBox(height: 24),
              _playerName(gameProvider),
              const SizedBox(height: 8),
              _subtitle(),
              const SizedBox(height: 32),
              _flipCard(gameProvider),
              const Spacer(),
              _privacyNote(),
              const SizedBox(height: 16),
              _nextButton(context, gameProvider),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, GameProvider gameProvider) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: purpleDark,
            radius: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23),
            ),
          ),
          Row(
            children: [
              Icon(Icons.lock, color: subtitleGray, size: 14),
              const SizedBox(width: 6),
              Text(
                'PRIVACIDAD ACTIVA',
                style: TextStyle(
                  color: subtitleGray,
                  fontSize: 11,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          Text(
            gameProvider.currentStep,
            style: TextStyle(
              color: subtitleGray,
              fontSize: 11,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerIcon() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: purpleDark,
        border: Border.all(color: purple.withValues(alpha: 0.4), width: 2),
      ),
      child: Icon(
        Icons.person,
        color: purple.withValues(alpha: 0.6),
        size: 44,
      ),
    );
  }

  Widget _playerName(GameProvider gameProvider) {
    return Text(
      gameProvider.currentPlayerName,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _subtitle() {
    return Text(
      'Es tu turno de ver el secreto',
      style: TextStyle(
        color: subtitleGray,
        fontSize: 15,
      ),
    );
  }

  Widget _flipCard(GameProvider gameProvider) {
    return RawGestureDetector(
      gestures: {
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 300),
          ),
          (recognizer) {
            recognizer.onLongPressStart = (_) => gameProvider.flip();
            recognizer.onLongPressEnd = (_) => gameProvider.flip();
          },
        ),
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 0,
          end: gameProvider.isFlipped ? math.pi : 0,
        ),
        duration: const Duration(milliseconds: 300),
        builder: (context, double angle, child) {
          final isBack = angle > math.pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: isBack
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(math.pi),
                    child: _cardBack(gameProvider),
                  )
                : _cardFront(),
          );
        },
      ),
    );
  }

  Widget _cardFront() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: purpleDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: purple.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.touch_app, color: subtitleGray, size: 32),
          const SizedBox(height: 12),
          Text(
            'MANTÉN PARA REVELAR',
            style: TextStyle(
              color: subtitleGray,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBack(GameProvider gameProvider) {
    final bool impostor = gameProvider.isImpostor;
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: impostor
            ? Colors.red.withValues(alpha: 0.15)
            : Colors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: impostor
              ? Colors.red.withValues(alpha: 0.5)
              : Colors.green.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            impostor ? 'ERES EL IMPOSTOR' : 'ERES USUARIO',
            style: TextStyle(
              color: impostor ? Colors.red : Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            impostor
                ? gameProvider.impostorDeck.label
                : gameProvider.secretWord,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            impostor ? 'Esta es tu categoría' : 'Esta es la palabra secreta',
            style: TextStyle(
              color: subtitleGray,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton(BuildContext context, GameProvider gameProvider) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        icon: const Icon(Icons.arrow_forward, color: Colors.white),
        label: Text(
          gameProvider.isLastPlayer ? 'COMENZAR PARTIDA' : 'PASAR AL SIGUIENTE',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (gameProvider.isLastPlayer) {
            Navigator.pushNamed(context, 'rounds');
          } else {
            gameProvider.nextPlayer();
          }
        },
      ),
    );
  }

  Widget _privacyNote() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.info_outline, color: subtitleGray, size: 14),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'Asegúrate de que nadie más esté mirando la pantalla antes de tocar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: subtitleGray,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}