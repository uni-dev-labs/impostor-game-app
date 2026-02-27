import 'package:flutter/material.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  double totalJugadores = 8;
  int numImpostores = 1;
  int numRondas = 5;
  String tematicaSeleccionada = 'ALEATORIO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color changed to a slightly lighter shade
      backgroundColor: const Color(0xFF1E1E2F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2F),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECCIÓN JUGADORES
            _buildSeccionJugadores(),
            const SizedBox(height: 32),

            // SECCIÓN IMPOSTORES Y RONDAS
            Row(
              children: [
                Expanded(child: _buildSeccionImpostores()),
                const SizedBox(width: 20),
                Expanded(child: _buildSeccionRondas()),
              ],
            ),
            const SizedBox(height: 32),

            // SECCIÓN TEMÁTICA
            _buildSeccionTematica(),
            const SizedBox(height: 32),

            // TEXTO RECOMENDACIÓN
            _buildTextoRecomendacion(),
            const SizedBox(height: 24),

            // BOTÓN COMENZAR
            _buildBotonComenzar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeccionJugadores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'JUGADORES',
          style: TextStyle(
            color: Color(0xFF5B4FFF),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Total de participantes',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            // Botón menos
            _buildBotonControl(Icons.remove, () {
              if (totalJugadores > 3) {
                setState(() => totalJugadores--);
              }
            }),
            const SizedBox(width: 16),

            // Slider y número
            Expanded(
              child: Column(
                children: [
                  Text(
                    totalJugadores.toInt().toString().padLeft(2, '0'),
                    style: const TextStyle(
                      color: Color(0xFF5B4FFF),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      // use a pink accent for sliders
                      activeTrackColor: const Color(0xFFE91E63),
                      inactiveTrackColor: Colors.white24,
                      thumbColor: const Color(0xFFE91E63),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 8,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 16,
                      ),
                    ),
                    child: Slider(
                      value: totalJugadores,
                      min: 3,
                      max: 20,
                      onChanged: (value) {
                        setState(() => totalJugadores = value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // Botón más
            _buildBotonControl(Icons.add, () {
              if (totalJugadores < 20) {
                setState(() => totalJugadores++);
              }
            }, isPrimary: true),
          ],
        ),
      ],
    );
  }

  Widget _buildSeccionImpostores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'IMPOSTORES',
          style: TextStyle(
            color: Color(0xFF5B4FFF),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '¿Quién miente?',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            numImpostores.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotonControlPequeno(Icons.remove, () {
              if (numImpostores > 1) {
                setState(() => numImpostores--);
              }
            }),
            const SizedBox(width: 16),
            _buildBotonControlPequeno(Icons.add, () {
              if (numImpostores < totalJugadores.toInt() - 1) {
                setState(() => numImpostores++);
              }
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSeccionRondas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RONDAS',
          style: TextStyle(
            color: Color(0xFF5B4FFF),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Duración partida',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            numRondas.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotonControlPequeno(Icons.remove, () {
              if (numRondas > 1) {
                setState(() => numRondas--);
              }
            }),
            const SizedBox(width: 16),
            _buildBotonControlPequeno(Icons.add, () {
              if (numRondas < 20) {
                setState(() => numRondas++);
              }
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSeccionTematica() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TEMÁTICA',
          style: TextStyle(
            color: Color(0xFF5B4FFF),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Selecciona el mazo de palabras',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCardTematica('ALEATORIO', Icons.casino, true),
              const SizedBox(width: 12),
              _buildCardTematica('MAGIA', Icons.auto_fix_high, false),
              const SizedBox(width: 12),
              _buildCardTematica('DEPORTE', Icons.sports_soccer, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardTematica(String titulo, IconData icono, bool isSelected) {
    final bool seleccionado = tematicaSeleccionada == titulo;

    return GestureDetector(
      onTap: () {
        setState(() => tematicaSeleccionada = titulo);
      },
      child: Container(
        width: 120,
        height: 140,
        decoration: BoxDecoration(
          color: seleccionado
              ? const Color(0xFF5B4FFF)
              : const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: seleccionado ? const Color(0xFF5B4FFF) : Colors.white24,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: seleccionado ? Colors.white : Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icono,
                size: 32,
                color: seleccionado ? const Color(0xFF5B4FFF) : Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: seleccionado ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextoRecomendacion() {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Color(0xFF5B4FFF),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.white70, fontSize: 12),
              children: [
                TextSpan(text: 'Recomendamos al menos '),
                TextSpan(
                  text: '5 jugadores',
                  style: TextStyle(
                    color: Color(0xFF5B4FFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' para una'),
                TextSpan(text: '\nexperiencia óptima reducida en un impostor'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBotonComenzar() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Navegar a la siguiente pantalla
          print('Jugadores: $totalJugadores');
          print('Impostores: $numImpostores');
          print('Rondas: $numRondas');
          print('Temática: $tematicaSeleccionada');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B4FFF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'COMENZAR',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.play_arrow, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBotonControl(
    IconData icono,
    VoidCallback onPressed, {
    bool isPrimary = false,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF5B4FFF) : const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPrimary ? const Color(0xFF5B4FFF) : Colors.white24,
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icono, color: Colors.white),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildBotonControlPequeno(IconData icono, VoidCallback onPressed) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24, width: 2),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icono, color: Colors.white, size: 20),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
