import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_icon_button.dart';
import 'package:impostor/components/number_counter.dart';
import 'package:impostor/components/theme_card.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  int _totalPlayers = 8;
  int _impostors = 1;
  int _rounds = 5;
  String _selectedTheme = 'ALEATORIO';

  final List<Map<String, dynamic>> _themes = [
    {'name': 'ALEATORIO', 'icon': Icons.casino},
    {'name': 'MAGIA', 'icon': Icons.auto_awesome},
    {'name': 'DEPORTES', 'icon': Icons.sports_soccer},
  ];

  // Calcula el máximo de impostores permitido según jugadores
  int get maxImpostors => (_totalPlayers ~/ 3).clamp(1, 5);

  // Método para actualizar jugadores y ajustar impostores automáticamente
  void _updatePlayers(int newValue) {
    setState(() {
      _totalPlayers = newValue.clamp(4, 15);
      // Si los impostores actuales superan el nuevo máximo -> bajarlos
      if (_impostors > maxImpostors) {
        _impostors = maxImpostors;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width < 380 ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: const Color(0xFF0F082E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomIconButton(icon: Icons.arrow_back),
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JUGADORES
            _buildSectionTitle('JUGADORES'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total de participantes:',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Text(
                  _totalPlayers.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildAdjustButton(Icons.remove, () {
                  if (_totalPlayers > 4) _updatePlayers(_totalPlayers - 1);
                }),
                Expanded(
                  child: Slider(
                    value: _totalPlayers.toDouble(),
                    min: 4,
                    max: 15,
                    divisions: 11,
                    activeColor: const Color(0xFF6200EE),
                    inactiveColor: Colors.white24,
                    onChanged: (value) {
                      _updatePlayers(value.round());
                    },
                  ),
                ),
                _buildAdjustButton(Icons.add, () {
                  if (_totalPlayers < 15) _updatePlayers(_totalPlayers + 1);
                }),
              ],
            ),

            const SizedBox(height: 40),

            // IMPOSTORES y RONDAS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSectionTitle('IMPOSTORES'),
                      const SizedBox(height: 6),
                      const Text(
                        '¿Quién miente?',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      NumberCounter(
                        value: _impostors,
                        min: 1,
                        max: maxImpostors,
                        onChanged: (val) => setState(() => _impostors = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSectionTitle('RONDAS'),
                      const SizedBox(height: 6),
                      const Text(
                        'Duración partida',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      NumberCounter(
                        value: _rounds,
                        min: 3,
                        max: 10,
                        onChanged: (val) => setState(() => _rounds = val),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // TEMÁTICA
            _buildSectionTitle('TEMÁTICA'),
            const SizedBox(height: 8),
            const Text(
              'Selecciona el mazo de palabras',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _themes.length,
                itemBuilder: (context, index) {
                  final theme = _themes[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ThemeCard(
                      name: theme['name'] as String,
                      icon: theme['icon'] as IconData,
                      isSelected: _selectedTheme == theme['name'],
                      onTap: () {
                        setState(
                          () => _selectedTheme = theme['name'] as String,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Recomendación
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.white54, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Recomendamos al menos 5 jugadores para una experiencia óptima con más de un impostor',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Botón COMENZAR
            Center(
              child: CustomButton(
                text: 'COMENZAR',
                onPressed: () {},
                color: const Color(0xFF6200EE),
                icon: Icons.play_arrow,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAdjustButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E143F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      ),
    );
  }
}
