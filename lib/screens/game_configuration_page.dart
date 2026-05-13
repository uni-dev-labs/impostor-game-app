import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/core/game_card_data.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/hiding_role.dart';
import 'package:impostor/screens/ui/game_configuration/button_configuration.dart';
import 'package:impostor/screens/ui/game_configuration/select_option.dart';
import 'package:provider/provider.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigurationGameProvider>();

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _appBar(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      _sectionPlayers(config),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SelectOptionUI(
                              title: 'IMPOSTORES',
                              subtitle: '¿Quién miente?',
                              value: config.impostors,
                              addPressed: config.addImpostors,
                              lessPressed: config.lessImpostors,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SelectOptionUI(
                              title: 'RONDAS',
                              subtitle: '¿Cuántas rondas?',
                              value: config.rounds,
                              addPressed: config.addRounds,
                              lessPressed: config.lessRounds,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _sectionTheme(config),
                      const SizedBox(height: 20),
                      _infoBox(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: CustomButtonText(
                  textButton: 'COMENZAR',
                  iconRight: Icons.play_arrow,
                  onPressed: () => _startGame(context, config),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: purpleDark,
                shape: BoxShape.circle,
                border: Border.all(color: cardBorderColor, width: 1),
              ),
              child: const Icon(Icons.chevron_left, color: Colors.white, size: 24),
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
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _sectionPlayers(ConfigurationGameProvider config) {
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
                const Text(
                  'JUGADORES',
                  style: TextStyle(
                    color: purple,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const Text(
                  'Total de participantes',
                  style: TextStyle(color: subtitleGray, fontSize: 13),
                ),
              ],
            ),
            Text(
              config.players.toString().padLeft(2, '0'),
              style: const TextStyle(
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
                onPressed: config.lessPlayers,
                icon: Icons.remove,
                isAccent: false,
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 6,
                    activeTrackColor: purple,
                    inactiveTrackColor: purpleDark,
                    thumbColor: purple,
                    overlayColor: purple.withValues(alpha: 0.2),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                  ),
                  child: Slider(
                    value: config.players.toDouble(),
                    min: 3,
                    max: 20,
                    onChanged: (v) {
                      final diff = v.round() - config.players;
                      if (diff > 0) {
                        for (int i = 0; i < diff; i++) { config.addPlayers(); }
                      } else {
                        for (int i = 0; i < -diff; i++) { config.lessPlayers(); }
                      }
                    },
                  ),
                ),
              ),
              ButtonConfigurationUI(
                onPressed: config.addPlayers,
                icon: Icons.add,
                isAccent: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionTheme(ConfigurationGameProvider config) {
    final decks = WordDeck.values;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TEMÁTICA',
          style: TextStyle(
            color: purple,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Selecciona el mazo de palabras',
          style: TextStyle(color: subtitleGray, fontSize: 13),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: decks.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (_, i) {
              final deck = decks[i];
              final selected = config.selectedDeck == deck;
              return GestureDetector(
                onTap: () => config.selectDeck(deck),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 95,
                  decoration: BoxDecoration(
                    color: selected ? purple.withValues(alpha: 0.3) : cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected ? purple : cardBorderColor,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(deck.icon, color: Colors.white, size: 32),
                            const SizedBox(height: 8),
                            Text(
                              deck.label,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (selected)
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: purple,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check, color: Colors.white, size: 13),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
          const Icon(Icons.info_outline, color: subtitleGray, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: subtitleGray, fontSize: 13, height: 1.4),
                children: [
                  TextSpan(text: 'Recomendamos al menos '),
                  TextSpan(
                    text: '5 jugadores',
                    style: TextStyle(color: purple, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: ' para una mejor experiencia de juego.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startGame(BuildContext context, ConfigurationGameProvider config) {
    try {
      final word = config.startGame();
      final session = GameSessionProvider(
        totalPlayers: config.players,
        impostorCount: config.impostors,
        secretWord: word,
        totalRounds: config.rounds,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: session,
            child: const HidingRole(),
          ),
        ),
        (route) => route.isFirst,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('StateError: ', '')),
          backgroundColor: Colors.red[800],
        ),
      );
    }
  }
}
