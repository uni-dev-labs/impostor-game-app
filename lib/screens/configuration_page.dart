import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int players = 8;
  int impostors = 1;
  int rounds = 5;
  int selectedTheme = 0;

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A1F4D), Color(0xFF0A0E27)],
  );

  final List<Map<String, dynamic>> themes = [
    {'label': 'ALEATORIO', 'icon': Icons.casino},
    {'label': 'MAGIA', 'icon': Icons.auto_fix_high},
    {'label': 'DEPORTE', 'icon': Icons.sports_basketball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: _gradient),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2F60),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.chevron_left, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                    const Text(
                      'Configuración',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // JUGADORES Section
                      _SectionLabel(title: 'JUGADORES', subtitle: 'Total de participantes'),
                      const SizedBox(height: 12),
                      _PlayersSlider(
                        value: players,
                        min: 3,
                        max: 16,
                        onDecrement: () => setState(() { if (players > 3) players--; }),
                        onIncrement: () => setState(() { if (players < 16) players++; }),
                        onChanged: (v) => setState(() => players = v.round()),
                      ),

                      const SizedBox(height: 24),

                      // IMPOSTORES & RONDAS Row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _SectionLabel(title: 'IMPOSTORES', subtitle: '¿Quién miente?'),
                                const SizedBox(height: 12),
                                _CounterWidget(
                                  value: impostors,
                                  onDecrement: () => setState(() { if (impostors > 1) impostors--; }),
                                  onIncrement: () => setState(() { if (impostors < 4) impostors++; }),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _SectionLabel(title: 'RONDAS', subtitle: 'Duración partida'),
                                const SizedBox(height: 12),
                                _CounterWidget(
                                  value: rounds,
                                  onDecrement: () => setState(() { if (rounds > 1) rounds--; }),
                                  onIncrement: () => setState(() { if (rounds < 10) rounds++; }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // TEMÁTICA Section
                      _SectionLabel(title: 'TEMÁTICA', subtitle: 'Selecciona el mazo de palabras'),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(themes.length, (i) {
                          final isSelected = selectedTheme == i;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedTheme = i),
                              child: Container(
                                margin: EdgeInsets.only(right: i < themes.length - 1 ? 8 : 0),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF6A0DAD)
                                      : const Color(0xFF1E2355),
                                  borderRadius: BorderRadius.circular(12),
                                  border: isSelected
                                      ? Border.all(color: const Color(0xFF8B5CF6), width: 2)
                                      : null,
                                ),
                                child: Stack(
                                  children: [
                                    if (isSelected)
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.check, size: 14, color: Color(0xFF6A0DAD)),
                                        ),
                                      ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(themes[i]['icon'] as IconData,
                                              color: Colors.white, size: 28),
                                          const SizedBox(height: 8),
                                          Text(
                                            themes[i]['label'] as String,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 20),

                      // Info tip
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2355),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3B82F6),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.info, color: Colors.white, size: 13),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 11, color: Color(0xAAFFFFFF)),
                                  children: [
                                    TextSpan(text: 'Recomendamos al menos '),
                                    TextSpan(
                                      text: '5 jugadores',
                                      style: TextStyle(
                                        color: Color(0xFF6A00FF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                        text: ' para una experiencia óptima con más de un impostor.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // COMENZAR Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5B21F5),
                            disabledBackgroundColor: const Color(0xFF5B21F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'COMENZAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.play_arrow, color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
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
}

// ─── Widgets de apoyo ──────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF7C6FF7),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0x88FFFFFF),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _PlayersSlider extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final ValueChanged<double> onChanged;

  const _PlayersSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.onDecrement,
    required this.onIncrement,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Minus button
        _CircleButton(icon: Icons.remove, onPressed: onDecrement),
        const SizedBox(width: 8),
        // Slider
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF6A00FF),
              inactiveTrackColor: const Color(0xFF2A2F60),
              thumbColor: const Color(0xFF6A00FF),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
              trackHeight: 5,
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: value.toDouble(),
              min: min.toDouble(),
              max: max.toDouble(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Plus button
        _CircleButton(
          icon: Icons.add,
          onPressed: onIncrement,
          filled: true,
        ),
        const SizedBox(width: 12),
        // Number display
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF5B21F5),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _CounterWidget({
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _SmallButton(icon: Icons.remove, onPressed: onDecrement),
            const SizedBox(width: 8),
            _SmallButton(icon: Icons.add, onPressed: onIncrement),
          ],
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool filled;

  const _CircleButton({
    required this.icon,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: filled ? const Color(0xFF5B21F5) : const Color(0xFF2A2F60),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _SmallButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SmallButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2F60),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}