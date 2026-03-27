import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Modelo de datos para un impostor revelado al final.
class ImpostorPlayer {
  final String name;
  final String? avatarUrl;

  const ImpostorPlayer({required this.name, this.avatarUrl});
}

/// Pantalla de fin de juego. Muestra si el impostor ganó adivinando o perdió.
class FinalImpostorWinsScreen extends StatelessWidget {
  final bool impostorGuessedCorrectly;
  final String impostorGuess;
  final String secretWord;
  final List<ImpostorPlayer> impostors;
  final int totalRounds;
  final String gameTime;
  final int voteCount;
  final VoidCallback onPlayAgain;
  final VoidCallback onGoHome;

  const FinalImpostorWinsScreen({
    super.key,
    required this.impostorGuessedCorrectly,
    required this.impostorGuess,
    required this.secretWord,
    required this.impostors,
    required this.totalRounds,
    required this.gameTime,
    required this.voteCount,
    required this.onPlayAgain,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 30),
                _ResultIcon(won: impostorGuessedCorrectly),
                const SizedBox(height: 24),
                _TitleSection(won: impostorGuessedCorrectly),
                const SizedBox(height: 8),
                _SubtitleText(won: impostorGuessedCorrectly),
                const SizedBox(height: 30),
                _SecretWordCard(
                  secretWord: secretWord,
                  impostorGuess: impostorGuess,
                  correct: impostorGuessedCorrectly,
                ),
                const SizedBox(height: 24),
                _ImpostorsList(impostors: impostors),
                const SizedBox(height: 24),
                _StatsRow(
                  totalRounds: totalRounds,
                  gameTime: gameTime,
                  voteCount: voteCount,
                ),
                const SizedBox(height: 30),
                _PlayAgainButton(onPressed: onPlayAgain),
                const SizedBox(height: 12),
                _HomeButton(onPressed: onGoHome),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultIcon extends StatelessWidget {
  final bool won;

  const _ResultIcon({required this.won});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: won
              ? [
                  AppColors.primary.withOpacity(0.3),
                  AppColors.primaryDark.withOpacity(0.5),
                ]
              : [
                  Colors.red.withOpacity(0.2),
                  Colors.red.withOpacity(0.4),
                ],
        ),
        border: Border.all(
          color: won
              ? AppColors.primary.withOpacity(0.5)
              : Colors.red.withOpacity(0.4),
          width: 2,
        ),
      ),
      child: Icon(
        won ? Icons.emoji_events : Icons.group,
        color: won ? AppColors.primary : Colors.red.shade300,
        size: 44,
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final bool won;

  const _TitleSection({required this.won});

  @override
  Widget build(BuildContext context) {
    if (won) {
      return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: '¡El ',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Impostor',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' ganó!',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: '¡Los ',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Jugadores',
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' ganaron!',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  final bool won;

  const _SubtitleText({required this.won});

  @override
  Widget build(BuildContext context) {
    return Text(
      won
          ? 'Lograron pasar desapercibidos'
          : 'Descubrieron al impostor a tiempo',
      style: const TextStyle(
        color: AppColors.textMuted,
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _SecretWordCard extends StatelessWidget {
  final String secretWord;
  final String impostorGuess;
  final bool correct;

  const _SecretWordCard({
    required this.secretWord,
    required this.impostorGuess,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          const Text(
            'LA PALABRA SECRETA ERA',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            secretWord.toUpperCase(),
            style: TextStyle(
              color: correct ? AppColors.primary : Colors.red.shade300,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          // Si falló, muestra lo que escribió el impostor
          if (!correct) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.close, color: Colors.red, size: 14),
                const SizedBox(width: 4),
                Text(
                  'El impostor dijo: $impostorGuess',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ImpostorsList extends StatelessWidget {
  final List<ImpostorPlayer> impostors;

  const _ImpostorsList({required this.impostors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LOS IMPOSTORES ERAN',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        ...impostors.map((p) => _ImpostorTile(player: p)),
      ],
    );
  }
}

class _ImpostorTile extends StatelessWidget {
  final ImpostorPlayer player;

  const _ImpostorTile({required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primary.withOpacity(0.2),
            backgroundImage: player.avatarUrl != null
                ? NetworkImage(player.avatarUrl!)
                : null,
            child: player.avatarUrl == null
                ? Text(
                    player.name[0].toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 14),
          Text(
            player.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int totalRounds;
  final String gameTime;
  final int voteCount;

  const _StatsRow({
    required this.totalRounds,
    required this.gameTime,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatCard(value: '$totalRounds', label: 'RONDAS')),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(value: gameTime, label: 'MINUTOS')),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(value: '$voteCount', label: 'VOTACIÓN')),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayAgainButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _PlayAgainButton({required this.onPressed});

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
        child: const Text(
          'Jugar otra vez',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _HomeButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          side: const BorderSide(color: AppColors.borderLight),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Volver al inicio',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}