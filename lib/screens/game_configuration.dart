import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  int jugadores = 8;
  int impostores = 1;
  int rondas = 5;
  String temaSeleccionado = 'aleatorio';

  final List<Map<String, dynamic>> temas = [
    {'id': 'aleatorio', 'nombre': 'ALEATORIO', 'icon': Icons.casino},
    {'id': 'magia', 'nombre': 'MAGIA', 'icon': Icons.auto_awesome},
    {'id': 'deportes', 'nombre': 'DEPORTES', 'icon': Icons.sports_basketball},
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              _buildSectionTitle('JUGADORES', 'Total de participantes'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      jugadores.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Color(0xFF6C63FF),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildSliderControl(
                value: jugadores.toDouble(),
                min: 4,
                max: 12,
                onChanged: (value) {
                  setState(() {
                    jugadores = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 32),

             
              Row(
                children: [
                  Expanded(
                    child: _buildCounterCard(
                      title: 'IMPOSTORES',
                      subtitle: '¿Quién miente?',
                      value: impostores,
                      onDecrement: () {
                        if (impostores > 1) {
                          setState(() => impostores--);
                        }
                      },
                      onIncrement: () {
                        if (impostores < jugadores - 2) {
                          setState(() => impostores++);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCounterCard(
                      title: 'RONDAS',
                      subtitle: 'Duración partida',
                      value: rondas,
                      onDecrement: () {
                        if (rondas > 1) {
                          setState(() => rondas--);
                        }
                      },
                      onIncrement: () {
                        if (rondas < 10) {
                          setState(() => rondas++);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

             
              _buildSectionTitle('TEMÁTICA', 'Selecciona el mazo de palabras'),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: temas.length,
                  itemBuilder: (context, index) {
                    final tema = temas[index];
                    final isSelected = tema['id'] == temaSeleccionado;
                    return _buildThemeCard(
                      nombre: tema['nombre'],
                      icon: tema['icon'],
                      isSelected: isSelected,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          temaSeleccionado = tema['id'];
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A3E).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFF6C63FF),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(text: 'Recomendamos al menos '),
                            TextSpan(
                              text: '5 jugadores',
                              style: TextStyle(color: Color(0xFF6C63FF)),
                            ),
                            TextSpan(
                              text: ' para una experiencia óptima con más de un impostor',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

             
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFF6C63FF).withOpacity(0.4),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'COMENZAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderControl({
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A3E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _buildSliderButton(
            icon: Icons.remove,
            onTap: () {
              if (value > min) {
                HapticFeedback.lightImpact();
                onChanged(value - 1);
              }
            },
            isEnabled: value > min,
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: (max - min).toInt(),
              activeColor: const Color(0xFF6C63FF),
              inactiveColor: const Color(0xFF2D2D5A),
              onChanged: onChanged,
            ),
          ),
          _buildSliderButton(
            icon: Icons.add,
            onTap: () {
              if (value < max) {
                HapticFeedback.lightImpact();
                onChanged(value + 1);
              }
            },
            isEnabled: value < max,
            isPlus: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isEnabled,
    bool isPlus = false,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isPlus ? const Color(0xFF6C63FF) : const Color(0xFF2D2D5A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isEnabled ? Colors.white : Colors.white38,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildCounterCard({
    required String title,
    required String subtitle,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A3E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF6C63FF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCounterButton(
                icon: Icons.remove,
                onTap: onDecrement,
              ),
              const SizedBox(width: 32),
              _buildCounterButton(
                icon: Icons.add,
                onTap: onIncrement,
                isPlus: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isPlus = false,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isPlus ? const Color(0xFF6C63FF) : const Color(0xFF2D2D5A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildThemeCard({
    required String nombre,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF4834DF)],
                )
              : null,
          color: isSelected ? null : const Color(0xFF1A1A3E),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? null
              : Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Color(0xFF6C63FF),
                    size: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}