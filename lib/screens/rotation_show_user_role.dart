import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Pantalla de rotación: muestra al jugador que es USUARIO (no impostor).
class RotationShowUserRoleScreen extends StatelessWidget {
  final int currentPlayer;
  final int totalPlayers;
  final String secretWord;
  final VoidCallback onNextPlayer;

  const RotationShowUserRoleScreen({
    super.key,
    required this.currentPlayer,
    required this.totalPlayers,
    required this.secretWord,
    required this.onNextPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _TopBar(
                currentPlayer: currentPlayer,
                totalPlayers: totalPlayers,
              ),
              const SizedBox(height: 30),
              _RoleBadge(isImpostor: false),
              const SizedBox(height: 30),
              _SecretWordCard(word: secretWord),
              const SizedBox(height: 20),
              _WarningRow(),
              const Spacer(),
              _HintText(),
              const SizedBox(height: 30),
              _NextPlayerButton(onPressed: onNextPlayer),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int currentPlayer;
  final int totalPlayers;

  const _TopBar({required this.currentPlayer, required this.totalPlayers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'JUGADOR $currentPlayer DE $totalPlayers',
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceMuted,
          ),
          child: const Icon(Icons.person, color: AppColors.textMuted, size: 18),
        ),
      ],
    );
  }
}

class _RoleBadge extends StatelessWidget {
  final bool isImpostor;

  const _RoleBadge({required this.isImpostor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            isImpostor ? '● ERES EL IMPOSTOR' : '● ERES USUARIO',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _SecretWordCard extends StatelessWidget {
  final String word;

  const _SecretWordCard({required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          const Text(
            'LA PALABRA SECRETA ES',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            word.toUpperCase(),
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _WarningRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.visibility_off, color: Colors.orange, size: 16),
        const SizedBox(width: 8),
        const Text(
          'No muestres esta palabra a nadie',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _HintText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Memoriza la palabra y pasa el dispositivo al siguiente jugador con cuidado.',
      style: TextStyle(
        color: AppColors.textMuted,
        fontSize: 13,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _NextPlayerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _NextPlayerButton({required this.onPressed});

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
              'Pasar al siguiente jugador',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}