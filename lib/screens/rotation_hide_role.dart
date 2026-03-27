import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/widgets.dart';

/// Pantalla de rotación: el dispositivo pasa al siguiente jugador.
/// El rol queda oculto para que nadie vea la pantalla de otro.
class RotationHideRoleScreen extends StatelessWidget {
  final int currentPlayer;
  final int totalPlayers;
  final VoidCallback onReveal;

  const RotationHideRoleScreen({
    super.key,
    required this.currentPlayer,
    required this.totalPlayers,
    required this.onReveal,
  });

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
              _TopInfo(
                currentPlayer: currentPlayer,
                totalPlayers: totalPlayers,
              ),
              const Spacer(),
              _AvatarPlaceholder(),
              const SizedBox(height: 30),
              Text(
                'Jugador $currentPlayer',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Es tu turno de ver el secreto',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              _TapToRevealButton(onReveal: onReveal),
              const SizedBox(height: 20),
              _PrivacyWarning(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopInfo extends StatelessWidget {
  final int currentPlayer;
  final int totalPlayers;

  const _TopInfo({required this.currentPlayer, required this.totalPlayers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.lock, color: AppColors.primary, size: 14),
            const SizedBox(width: 6),
            const Text(
              'PRIVACIDAD ACTIVA',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        Text(
          'PASO $currentPlayer DE $totalPlayers',
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceMuted,
        border: Border.all(color: AppColors.borderLight, width: 2),
      ),
      child: const Icon(
        Icons.person,
        color: AppColors.textMuted,
        size: 50,
      ),
    );
  }
}

class _TapToRevealButton extends StatelessWidget {
  final VoidCallback onReveal;

  const _TapToRevealButton({required this.onReveal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onReveal,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.4),
            width: 1.5,
          ),
          color: AppColors.primary.withOpacity(0.08),
        ),
        child: const Column(
          children: [
            Icon(Icons.touch_app, color: AppColors.primary, size: 32),
            SizedBox(height: 10),
            Text(
              'TOCA PARA REVELAR',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.info_outline, color: AppColors.textFaint, size: 14),
        const SizedBox(width: 6),
        const Flexible(
          child: Text(
            'Asegúrate de que nadie más esté mirando la pantalla antes de tocar.',
            style: TextStyle(
              color: AppColors.textFaint,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}