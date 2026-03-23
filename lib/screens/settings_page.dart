import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/counter_control.dart';
import 'package:impostor/screens/game_data.dart';
import 'package:impostor/screens/reveal_role_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Estado del juego
  int _players = 8;
  int _impostors = 1;
  int _rounds = 5;
  String _selectedTheme = "ALEATORIO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1F4D), Color(0xFF0A0E27)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel("JUGADORES", "Total de participantes"),
                      _buildPlayerSlider(),
                      const SizedBox(height: 30),

                      Row(
                        children: [
                          Expanded(
                            child: CounterControl(
                              label: "IMPOSTORES",
                              subLabel: "¿Quién miente?",
                              value: _impostors,
                              onIncrement: () => setState(() => _impostors++),
                              onDecrement: () {
                                if (_impostors > 1) {
                                  setState(() => _impostors--);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CounterControl(
                              label: "RONDAS",
                              subLabel: "Duración partida",
                              value: _rounds,
                              onIncrement: () => setState(() => _rounds++),
                              onDecrement: () {
                                if (_rounds > 1) setState(() => _rounds--);
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      _buildSectionLabel(
                        "TEMÁTICA",
                        "Selecciona el mazo de palabras",
                      ),
                      _buildThemeList(),

                      const SizedBox(height: 40),
                      _buildRecommendationBox(),
                      const SizedBox(height: 24),

                      PrimaryButton(
                        text: "COMENZAR  ▶",
                        onPressed: () {
                          // 1. Elegimos la palabra secreta según el tema seleccionado
                          String secretWord = GameData.getRandomWord(
                            _selectedTheme,
                          );

                          // 2. Creamos la lista de roles (primero todos con la palabra)
                          List<String> roles = List.generate(
                            _players,
                            (index) => secretWord,
                          );

                          // 3. Reemplazamos algunos por "IMPOSTOR" según la cantidad elegida
                          for (int i = 0; i < _impostors; i++) {
                            roles[i] = "IMPOSTOR";
                          }

                          // 4. ¡MUY IMPORTANTE! Mezclamos la lista para que sea aleatorio
                          roles.shuffle();

                          // 5. Navegamos a la pantalla de revelado que hicimos antes
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RevealRolePage(playerRoles: roles),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widgets de Apoyo ---

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              "Configuración",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48), // Balance para el botón de atrás
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF646AFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white54, fontSize: 11),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPlayerSlider() {
    return Row(
      children: [
        _miniIconButton(Icons.remove, () {
          if (_players > 3) setState(() => _players--);
        }),
        Expanded(
          child: Slider(
            value: _players.toDouble(),
            min: 3,
            max: 20,
            activeColor: const Color(0xFF5B3FD9),
            onChanged: (val) => setState(() => _players = val.toInt()),
          ),
        ),
        _miniIconButton(Icons.add, () {
          if (_players < 20) setState(() => _players++);
        }, isPrimary: true),
        const SizedBox(width: 15),
        Text(
          _players.toString().padLeft(2, '0'),
          style: const TextStyle(
            color: Color(0xFF646AFF),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _miniIconButton(
    IconData icon,
    VoidCallback onTap, {
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF5B3FD9) : Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildThemeList() {
    final themes = [
      {'name': 'ALEATORIO', 'icon': Icons.casino},
      {'name': 'MAGIA', 'icon': Icons.auto_fix_high},
      {'name': 'DEPORTE', 'icon': Icons.sports_soccer},
    ];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: themes.length,
        itemBuilder: (context, index) {
          final theme = themes[index];
          bool isSelected = _selectedTheme == theme['name'];
          return GestureDetector(
            onTap: () =>
                setState(() => _selectedTheme = theme['name'] as String),
            child: Container(
              width: 110,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF5B3FD9) : Colors.white10,
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    theme['icon'] as IconData,
                    color: Colors.white,
                    size: 35,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    theme['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendationBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF5B3FD9)),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "Recomendamos al menos 5 jugadores para una experiencia óptima con más de un impostor.",
              style: TextStyle(color: Colors.white38, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
