import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../components/custom_button.dart';
import '../components/config_cards.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  int players = 8;
  int impostors = 1;
  int rounds = 5;
  String selectedTheme = 'ALEATORIO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildSectionHeader('JUGADORES', 'Total de participantes', value: players.toString().padLeft(2, '0')),
                    const SizedBox(height: 15),
                    _buildPlayerSlider(),
                    const SizedBox(height: 35),
                    
                    // Fila de Tarjetas de Configuración
                    Row(
                      children: [
                        Expanded(
                          child: CounterCard(
                            title: 'IMPOSTORES', subtitle: '¿Quién miente?', value: impostors,
                            onMinus: () { if (impostors > 1) setState(() => impostors--); },
                            onPlus: () { if (impostors < 3) setState(() => impostors++); },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CounterCard(
                            title: 'RONDAS', subtitle: 'Duración partida', value: rounds,
                            onMinus: () { if (rounds > 1) setState(() => rounds--); },
                            onPlus: () { if (rounds < 10) setState(() => rounds++); },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    
                    _buildSectionHeader('TEMÁTICA', 'Selecciona el mazo de palabras'),
                    const SizedBox(height: 15),
                    _buildThemeSelection(),
                    const SizedBox(height: 40),
                    
                    _buildWarningInfo(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 10),
              child: PrimaryButton(
                text: 'COMENZAR',
                icon: Icons.play_arrow,
                onPressed: () {
                  // Lógica para iniciar el juego
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTES ESPECÍFICOS DE ESTA PANTALLA ---

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          CustomIconButton(
            icon: Icons.arrow_back_ios_new,
            backgroundColor: AppColors.card,
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(child: Center(child: Text('Configuración', style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, {String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.textSub, fontSize: 12)),
          ],
        ),
        if (value != null)
          Text(value, style: const TextStyle(color: AppColors.primary, fontSize: 36, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildPlayerSlider() {
    return Row(
      children: [
        _buildRoundButton(Icons.remove, AppColors.card, () { if (players > 4) setState(() => players--); }),
        Expanded(
          child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 6, activeTrackColor: AppColors.primary, inactiveTrackColor: AppColors.card,
              thumbColor: Colors.transparent, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
            ),
            child: Slider(
              value: players.toDouble(), min: 4, max: 15,
              onChanged: (val) => setState(() => players = val.toInt()),
            ),
          ),
        ),
        _buildRoundButton(Icons.add, AppColors.primary, () { if (players < 15) setState(() => players++); }, hasGlow: true),
      ],
    );
  }

  Widget _buildRoundButton(IconData icon, Color color, VoidCallback onTap, {bool hasGlow = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, height: 50,
        decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15),
          boxShadow: hasGlow ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: 15, offset: const Offset(0, 5))] : [],
        ),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }

  Widget _buildThemeSelection() {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal, clipBehavior: Clip.none,
        children: [
          ThemeCard(title: 'ALEATORIO', icon: Icons.casino, isSelected: selectedTheme == 'ALEATORIO', onTap: () => setState(() => selectedTheme = 'ALEATORIO')),
          const SizedBox(width: 15),
          ThemeCard(title: 'MAGIA', icon: Icons.auto_awesome, isSelected: selectedTheme == 'MAGIA', onTap: () => setState(() => selectedTheme = 'MAGIA')),
          const SizedBox(width: 15),
          ThemeCard(title: 'DEPORTE', icon: Icons.sports_soccer, isSelected: selectedTheme == 'DEPORTE', onTap: () => setState(() => selectedTheme = 'DEPORTE')),
        ],
      ),
    );
  }

  Widget _buildWarningInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(color: AppColors.card.withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info, color: AppColors.primary, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
                children: [
                  TextSpan(text: 'Recomendamos al menos '),
                  TextSpan(text: '5 jugadores', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' para una experiencia óptima con más de un impostor.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}