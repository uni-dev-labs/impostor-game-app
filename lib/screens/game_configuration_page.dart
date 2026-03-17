import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/screens/ui/game_configuration/button_configuration.dart';
import 'package:impostor/screens/ui/game_configuration/select_option.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

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
                SizedBox(height: 20),
                _appBar(context),
                _sectionPlayers(),
                const SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SelectOptionUI(
                        title: 'IMPOSTORES', 
                        subtitle: '¿Quién miente?', 
                        value: 0, 
                        addPressed  : () { }, 
                        lessPressed : () { }, 
                      )
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SelectOptionUI(
                        title: 'RONDAS', 
                        subtitle: '¿Cuántas rondas?', 
                        value: 0, 
                        addPressed  : () {  }, 
                        lessPressed : () {  }, 
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _sectionTheme(context),
                const SizedBox(height: 20),
                _infoBox(),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'COMENZAR',
                  color: purple,
                  icon: Icons.play_arrow,
                  onPressed: () {},
                  isIconInLeft: false,
                  borderRadius: 12,
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
              icon: Icon(Icons.chevron_left,
              color: Colors.white, size: 23),
            ),
          ),
          Text('Configuración', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(width: 0),
        ],
      ),
    );
  }

  Widget _sectionPlayers() {
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
                  'Total de participantes',
                  style: TextStyle(color: subtitleGray, fontSize: 14),
                ),
              ],
            ),
            Text(
              '08',
              style: TextStyle(
                color: purple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardBorderColor, width: 2),
          ),
          child: Row(
            children: [
              ButtonConfigurationUI(
                onPressed: () {},
                icon: Icons.remove,
                isAccent: false,
                width: 55,
                height: 55,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: purple,
                    inactiveTrackColor: cardColor.withValues(alpha:  0.5),
                    thumbColor: purple,
                    overlayColor: purple.withValues(alpha:  0.2),
                  ),
                  child: Slider(
                    value: 8,
                    min: 4,
                    max: 12,
                    onChanged: (_) {},
                  ),
                ),
              ),
              ButtonConfigurationUI(
                onPressed: () {},
                icon: Icons.add,
                isAccent: true,
                width: 55,
                height: 55,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionTheme(BuildContext context) {
    const themes = [
      ('ALEATORIO', Icons.casino, true),
      ('MAGIA', Icons.auto_awesome, false),
      ('DEPORTE', Icons.sports_soccer, false),
      ('CIENCIA', Icons.science, false),
    ];

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
            itemCount: themes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final (label, icon, selected) = themes[index];
              return _themeCard(
                label: label,
                icon: icon,
                selected: selected,
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
                  const TextSpan(text: 'Recomendamos al menos '),
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
