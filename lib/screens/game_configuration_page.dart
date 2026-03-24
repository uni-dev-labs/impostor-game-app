import 'package:flutter/material.dart';
import 'dart:math';

import 'package:impostor/core/app_colors.dart';
import 'package:impostor/screens/ui/game_configuration/select_option.dart';

import 'package:impostor/core/game_data.dart';
import 'package:impostor/screens/game/role_reveal_screen.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  // --- VARIABLES DE ESTADO ---

  final TextEditingController _nameController = TextEditingController();

  final List<String> _players = [];

  int _impostorCount = 1;
  int _roundsCount = 1;
  String _selectedTheme = 'ALEATORIO';

  final List<(String, IconData)> _themes = [
    ('ALEATORIO', Icons.casino),
    ('MAGIA', Icons.auto_awesome),
    ('DEPORTE', Icons.sports_soccer),
    ('CIENCIA', Icons.science),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // --- LÓGICA PARA AGREGAR JUGADORES ---
  void _addPlayer() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      if (_players.contains(name)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ese nombre ya está en la lista')),
        );
      } else if (_players.length >= 12) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Máximo 12 jugadores permitidos')),
        );
      } else {
        setState(() {
          _players.add(name);
          _nameController.clear();

          if (_impostorCount > max(1, _players.length ~/ 3)) {
            _impostorCount = max(1, _players.length ~/ 3);
          }
        });
      }
    }
  }

  // --- LÓGICA PARA ELIMINAR JUGADORES ---
  void _removePlayer(String name) {
    setState(() {
      _players.remove(name);

      if (_impostorCount > max(1, _players.length ~/ 3)) {
        _impostorCount = max(1, _players.length ~/ 3);
      }
    });
  }


  // --- LÓGICA PARA INICIAR EL JUEGO ---
  void _startGame() {
    if (_players.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Se necesitan al menos 3 jugadores para empezar')),
      );
      return;
    }

    String categoryToPlay = _selectedTheme;
    if (categoryToPlay == 'ALEATORIO') {
      final random = Random();
      final categories = wordDictionary.keys.toList();
      categoryToPlay = categories[random.nextInt(categories.length)];
    }

    GameSession session = GameSession.initGame(
        _players,
        categoryToPlay,
        _impostorCount
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoleRevealScreen(session: session),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                _appBar(context),

                // --- NUEVA SECCIÓN DE NOMBRES ---
                _sectionNames(),

                const SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SelectOptionUI(
                          title: 'IMPOSTORES',
                          subtitle: '¿Quién miente?',
                          value: _impostorCount,
                          addPressed: () {
                            // Máximo 1 impostor por cada 3 jugadores
                            int maxImpostors = max(1, _players.length ~/ 3);
                            // Permitimos subir solo si hay suficientes jugadores y no superamos el límite
                            if (_players.length >= 3 && _impostorCount < maxImpostors) {
                              setState(() => _impostorCount++);
                            } else if (_players.length < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Agrega más jugadores primero')),
                              );
                            }
                          },
                          lessPressed: () {
                            if (_impostorCount > 1) {
                              setState(() => _impostorCount--);
                            }
                          },
                        )
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        child: SelectOptionUI(
                          title: 'RONDAS',
                          subtitle: '¿Cuántas rondas?',
                          value: _roundsCount,
                          addPressed: () {
                            setState(() => _roundsCount++);
                          },
                          lessPressed: () {
                            if (_roundsCount > 1) {
                              setState(() => _roundsCount--);
                            }
                          },
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _sectionTheme(context),
                const SizedBox(height: 20),
                _infoBox(),
                const SizedBox(height: 24),

                // Botón comenzar
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _startGame,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'COMENZAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.play_arrow, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[900],
            radius: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23),
            ),
          ),
          const Text('Configuración', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _sectionNames() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JUGADORES',
                  style: TextStyle(
                    color: purple,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Ingresa los nombres',
                  style: TextStyle(color: subtitleGray, fontSize: 14),
                ),
              ],
            ),
            // Muestra el total actual de jugadores ingresados
            Text(
              _players.length.toString().padLeft(2, '0'),
              style: TextStyle(
                color: purple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Campo de entrada y botón de añadir
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: cardBorderColor, width: 2),
                ),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "Nombre del jugador...",
                    hintStyle: TextStyle(color: subtitleGray),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  onSubmitted: (_) => _addPlayer(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: purpleDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: purple, width: 2),
              ),
              child: IconButton(
                onPressed: _addPlayer,
                icon: const Icon(Icons.add, color: Colors.white),
                tooltip: "Agregar Jugador",
              ),
            )
          ],
        ),
        const SizedBox(height: 16),

        // Lista visual de los nombres agregados (Chips)
        if (_players.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _players.map((name) => Chip(
              label: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: purple.withOpacity(0.5)),
              ),
              deleteIcon: const Icon(Icons.close, size: 18, color: Colors.white54),
              onDeleted: () => _removePlayer(name),
            )).toList(),
          )
        else
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("Aún no hay jugadores. ¡Agrega al menos 3!",
                  style: TextStyle(color: subtitleGray, fontStyle: FontStyle.italic)),
            ),
          ),
      ],
    );
  }

  Widget _sectionTheme(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TEMÁTICA',
          style: TextStyle(
            color: purple,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Selecciona el mazo de palabras',
          style: TextStyle(color: subtitleGray, fontSize: 14),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _themes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final label = _themes[index].$1;
              final icon = _themes[index].$2;
              final isSelected = _selectedTheme == label;

              return GestureDetector(
                onTap: () => setState(() => _selectedTheme = label),
                child: _themeCard(
                  label: label,
                  icon: icon,
                  selected: isSelected,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _themeCard({
    required String label,
    required IconData icon,
    required bool selected,
  }) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: selected ? purpleDark : cardColor,
        borderRadius: BorderRadius.circular(16),
        border: selected ? Border.all(color: purple, width: 2) : null,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 36),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (selected)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: purple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: subtitleGray, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: subtitleGray, fontSize: 14, height: 1.4),
                children: [
                  const TextSpan(text: 'Agrega los nombres arriba. Recomendamos al menos '),
                  TextSpan(
                    text: '5 jugadores',
                    style: TextStyle(color: purple, fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(
                    text: ' para una experiencia óptima con más de un impostor.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}