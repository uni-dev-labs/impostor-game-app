import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Pantalla de rotación: muestra al jugador que es EL IMPOSTOR.
class RotationShowImpostorRoleScreen extends StatelessWidget {
  final int currentPlayer;
  final int totalPlayers;
  final VoidCallback onNextPlayer;

  const RotationShowImpostorRoleScreen({
    super.key,
    required this.currentPlayer,
    required this.totalPlayers,
    required this.onNextPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A1A2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _TopBar(
                currentPlayer: currentPlayer,
                totalPlayers: totalPlayers,
              ),
              const Spacer(),
              _ImpostorCard(),
              const Spacer(),
              _HideWarning(),
              const SizedBox(height: 20),
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
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withOpacity(0.2),
              border: Border.all(color: Colors.red.withOpacity(0.4)),
            ),
            child: const Icon(Icons.visibility_off, color: Colors.red, size: 18),
          ),
        ),
      ],
    );
  }
}

class _ImpostorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF3D1A1A),
            const Color(0xFF2A1020),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            'TU ROL SECRETO',
            style: TextStyle(
              color: Colors.red.withOpacity(0.7),
              fontSize: 12,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Eres el',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'IMPOSTOR',
            style: TextStyle(
              color: Colors.red,
              fontSize: 44,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Descubre la ',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'palabra secreta ',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'antes de que acaben las rondas.',
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No dejes que nadie sospeche de ti.',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _HideWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.security, color: AppColors.textMuted, size: 14),
        const SizedBox(width: 6),
        const Text(
          'Oculta la pantalla antes de continuar',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
          ),
        ),
      ],
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