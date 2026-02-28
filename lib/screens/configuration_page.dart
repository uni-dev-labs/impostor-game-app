import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  int jugadores = 8;
  int impostores = 1;
  int rondas = 5;
  int tematicaSeleccionada = 0;

  final List<Map<String, dynamic>> tematicas = [
    {'label': 'ALEATORIO', 'icon': Icons.casino},
    {'label': 'MAGIA', 'icon': Icons.auto_fix_high},
    {'label': 'DEPORTE', 'icon': Icons.sports_basketball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D0B2E), Color(0xFF141038), Color(0xFF0D0B2E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ── AppBar ──────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    CustomButton(
                      icon: Icons.arrow_back_ios_new,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Configuración',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 44), // balance visual
                  ],
                ),
              ),

              // ── Contenido scrolleable ────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // ── JUGADORES ──────────────────────────────────
                      _sectionLabel('JUGADORES', 'Total de participantes'),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _roundIconButton(Icons.remove, () {
                            if (jugadores > 3) setState(() => jugadores--);
                          }),
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: const Color(0xFF3D38E0),
                                inactiveTrackColor: const Color(0xFF2A2560),
                                thumbColor: const Color(0xFF3D38E0),
                                overlayColor: const Color(0x223D38E0),
                                trackHeight: 6,
                              ),
                              child: Slider(
                                value: jugadores.toDouble(),
                                min: 3,
                                max: 15,
                                onChanged: (v) => setState(() => jugadores = v.round()),
                              ),
                            ),
                          ),
                          _roundIconButton(Icons.add, () {
                            if (jugadores < 15) setState(() => jugadores++);
                          }, filled: true),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          jugadores.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            color: Color(0xFF3D38E0),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ── IMPOSTORES + RONDAS ────────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionLabel('IMPOSTORES', '¿Quién miente?'),
                                const SizedBox(height: 12),
                                _counterWidget(
                                  value: impostores,
                                  onDecrement: () {
                                    if (impostores > 1) setState(() => impostores--);
                                  },
                                  onIncrement: () {
                                    if (impostores < 4) setState(() => impostores++);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionLabel('RONDAS', 'Duración partida'),
                                const SizedBox(height: 12),
                                _counterWidget(
                                  value: rondas,
                                  onDecrement: () {
                                    if (rondas > 1) setState(() => rondas--);
                                  },
                                  onIncrement: () {
                                    if (rondas < 10) setState(() => rondas++);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),

                      // ── TEMÁTICA ───────────────────────────────────
                      _sectionLabel('TEMÁTICA', 'Selecciona el mazo de palabras'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 110,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(tematicas.length, (i) {
                              final selected = tematicaSeleccionada == i;
                              return Padding(
                                padding: EdgeInsets.only(right: i == tematicas.length - 1 ? 0 : 12),
                                child: GestureDetector(
                                  onTap: () => setState(() => tematicaSeleccionada = i),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? const Color(0xFF3D38E0)
                                          : const Color(0xFF1A1645),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: selected
                                            ? const Color(0xFF3D38E0)
                                            : const Color(0xFF2A2560),
                                        width: 2,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                tematicas[i]['icon'] as IconData,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                tematicas[i]['label'] as String,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
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
                                              width: 20,
                                              height: 20,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.check,
                                                size: 14,
                                                color: Color(0xFF3D38E0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ── Aviso mínimo jugadores ─────────────────────
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                          children: const [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Color(0xFF3D38E0),
                                ),
                              ),
                            ),
                            TextSpan(text: 'Recomendamos al menos '),
                            TextSpan(
                              text: '5 jugadores',
                              style: TextStyle(
                                color: Color(0xFF3D38E0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' para una experiencia óptima con más de un impostor.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),

              // ── Botón COMENZAR ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D38E0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: const Color(0xFF3D38E0).withValues(alpha: 0.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'COMENZAR',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.play_arrow, size: 26),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Widgets helpers ──────────────────────────────────────────────────

  Widget _sectionLabel(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF3D38E0),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _counterWidget({
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Row(
      children: [
        _roundIconButton(Icons.remove, onDecrement),
        Expanded(
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _roundIconButton(Icons.add, onIncrement),
      ],
    );
  }

  Widget _roundIconButton(IconData icon, VoidCallback onTap, {bool filled = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: filled ? const Color(0xFF3D38E0) : const Color(0xFF1A1645),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF2A2560),
            width: 1.5,
          ),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}