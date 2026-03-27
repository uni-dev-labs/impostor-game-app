import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_icon_button.dart';
import 'package:impostor/components/number_counter.dart';
import 'package:impostor/components/theme_card.dart';
import 'package:impostor/providers/providers.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  static const List<Map<String, dynamic>> _themes = [
    {'name': 'ALEATORIO', 'icon': Icons.casino},
    {'name': 'MAGIA', 'icon': Icons.auto_awesome},
    {'name': 'DEPORTES', 'icon': Icons.sports_soccer},
    {'name': 'CIENCIA', 'icon': Icons.science_outlined},
    {'name': 'CINE', 'icon': Icons.movie_outlined},
    {'name': 'COCINA', 'icon': Icons.restaurant_outlined},
    {'name': 'TECNOLOGÍA', 'icon': Icons.computer_outlined},
    {'name': 'NATURALEZA', 'icon': Icons.forest_outlined},
    {'name': 'MÚSICA', 'icon': Icons.music_note_outlined},
    {'name': 'HISTORIA', 'icon': Icons.account_balance_outlined},
    {'name': 'VIDEOJUEGOS', 'icon': Icons.sports_esports_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    final config = context.watch<GameConfig>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── AppBar ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.arrow_back_ios_new,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Configuración',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Jugadores ───────────────────────────────────────
              _sectionLabel('JUGADORES', 'Total de participantes'),
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.read<GameConfig>().setTotalPlayers(
                      config.totalPlayers - 1,
                    ),
                    icon: const Icon(Icons.remove, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF1E143F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5B3FF8),
                        inactiveTrackColor: const Color(0xFF1E143F),
                        thumbColor: const Color(0xFF5B3FF8),
                        overlayColor: const Color(0x335B3FF8),
                      ),
                      child: Slider(
                        value: config.totalPlayers.toDouble(),
                        min: 4,
                        max: 15,
                        divisions: 11,
                        onChanged: (v) => context
                            .read<GameConfig>()
                            .setTotalPlayers(v.toInt()),
                      ),
                    ),
                  ),
                  Text(
                    config.totalPlayers.toString().padLeft(2, '0'),
                    style: const TextStyle(
                      color: Color(0xFF5B3FF8),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => context.read<GameConfig>().setTotalPlayers(
                      config.totalPlayers + 1,
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF5B3FF8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── Impostores + Rondas ─────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionLabel('IMPOSTORES', '¿Quién miente?'),
                        const SizedBox(height: 12),
                        NumberCounter(
                          value: config.impostors,
                          min: 1,
                          max: config.maxImpostors,
                          onChanged: context.read<GameConfig>().setImpostors,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionLabel('RONDAS', 'Duración partida'),
                        const SizedBox(height: 12),
                        NumberCounter(
                          value: config.rounds,
                          min: 1,
                          max: 10,
                          onChanged: context.read<GameConfig>().setRounds,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ── Temática ────────────────────────────────────────
              _sectionLabel('TEMÁTICA', 'Selecciona el mazo de palabras'),
              const SizedBox(height: 12),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _themes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final t = _themes[i];
                    return ThemeCard(
                      name: t['name'],
                      icon: t['icon'],
                      isSelected: config.selectedTheme == t['name'],
                      onTap: () =>
                          context.read<GameConfig>().setTheme(t['name']),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ── Aviso ───────────────────────────────────────────
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Color(0xFF5B3FF8),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                        children: [
                          TextSpan(text: 'Recomendamos al menos '),
                          TextSpan(
                            text: '6 jugadores ',
                            style: TextStyle(
                              color: Color(0xFF5B3FF8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'para una experiencia óptima con más de un impostor.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // ── Botón COMENZAR ──────────────────────────────────
              CustomButton(
                text: 'COMENZAR',
                icon: Icons.play_arrow,
                onPressed: () {
                  context.read<GameConfig>().startGame();
                  Navigator.pushNamed(context, '/rotation-hide');
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF5B3FF8),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}
