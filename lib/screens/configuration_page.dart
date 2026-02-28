import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  // Variables de estado simuladas
  int players = 8;
  int impostors = 1;
  int rounds = 5;
  String selectedTheme = 'ALEATORIO';

  // Paleta de colores basada en tu diseño
  final Color bgColor = const Color(0xFF0F0B29);
  final Color cardColor = const Color(0xFF1A1635);
  final Color accentColor = const Color(0xFF4C35FF);
  final Color textSub = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Configuración',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balancea el icono de atrás
                ],
              ),
            ),

            // --- CONTENIDO SCROLLEABLE ---
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // 1. SECCIÓN JUGADORES
                    _buildSectionHeader('JUGADORES', 'Total de participantes', value: players.toString().padLeft(2, '0')),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        _buildRoundButton(Icons.remove, cardColor, () {
                          if (players > 4) setState(() => players--);
                        }),
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 6,
                              activeTrackColor: accentColor,
                              inactiveTrackColor: cardColor,
                              thumbColor: Colors.transparent,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                            ),
                            child: Slider(
                              value: players.toDouble(),
                              min: 4,
                              max: 15,
                              onChanged: (val) {
                                setState(() => players = val.toInt());
                              },
                            ),
                          ),
                        ),
                        _buildRoundButton(Icons.add, accentColor, () {
                          if (players < 15) setState(() => players++);
                        }, hasGlow: true),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // 2. SECCIÓN IMPOSTORES Y RONDAS
                    Row(
                      children: [
                        Expanded(
                          child: _buildCounterCard(
                            'IMPOSTORES',
                            '¿Quién miente?',
                            impostors,
                            () { if (impostors > 1) setState(() => impostors--); },
                            () { if (impostors < 3) setState(() => impostors++); },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildCounterCard(
                            'RONDAS',
                            'Duración partida',
                            rounds,
                            () { if (rounds > 1) setState(() => rounds--); },
                            () { if (rounds < 10) setState(() => rounds++); },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // 3. SECCIÓN TEMÁTICA
                    _buildSectionHeader('TEMÁTICA', 'Selecciona el mazo de palabras'),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        children: [
                          _buildThemeCard('ALEATORIO', Icons.casino),
                          const SizedBox(width: 15),
                          _buildThemeCard('MAGIA', Icons.auto_awesome), // Reemplaza con tu imagen de fondo
                          const SizedBox(width: 15),
                          _buildThemeCard('DEPORTE', Icons.sports_soccer), // Reemplaza con tu imagen de fondo
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // 4. AVISO
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info, color: accentColor, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
                                children: [
                                  const TextSpan(text: 'Recomendamos al menos '),
                                  TextSpan(text: '5 jugadores', style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
                                  const TextSpan(text: ' para una experiencia óptima con más de un impostor.'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // --- BOTÓN COMENZAR FIJO ABAJO ---
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 15,
                    shadowColor: accentColor.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'COMENZAR',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS AUXILIARES (HELPERS) ---

  Widget _buildSectionHeader(String title, String subtitle, {String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: textSub, fontSize: 12),
            ),
          ],
        ),
        if (value != null)
          Text(
            value,
            style: TextStyle(color: accentColor, fontSize: 36, fontWeight: FontWeight.w900),
          ),
      ],
    );
  }

  Widget _buildRoundButton(IconData icon, Color color, VoidCallback onTap, {bool hasGlow = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: hasGlow
              ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: 15, offset: const Offset(0, 5))]
              : [],
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildCounterCard(String title, String subtitle, int value, VoidCallback onMinus, VoidCallback onPlus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 2),
        Text(subtitle, style: TextStyle(color: textSub, fontSize: 10)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onMinus,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                        child: const Icon(Icons.remove, color: Colors.white54, size: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: onPlus,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                        child: const Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeCard(String title, IconData icon) {
    bool isSelected = selectedTheme == title;
    
    return GestureDetector(
      onTap: () {
        setState(() => selectedTheme = title);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? accentColor : cardColor,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: accentColor, width: 2) : null,
          boxShadow: isSelected 
              ? [BoxShadow(color: accentColor.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))]
              : [],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: isSelected ? Colors.white : Colors.white54, size: 30),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: accentColor, size: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}