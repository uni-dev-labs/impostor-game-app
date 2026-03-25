import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/core/word_decks.dart';
import 'package:impostor/providers/game_configuration_provider.dart';
import 'package:impostor/providers/game_provider.dart';
import 'package:impostor/components/circle_button.dart';
import 'package:impostor/components/theme_card.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:provider/provider.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider configurationGameProvider = Provider.of<ConfigurationGameProvider>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              shape: BoxShape.circle,
            ),
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Configuración",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              primaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _playersSection(context, configurationGameProvider),
              SizedBox(height: 30),
              _impostorsAndRounds(configurationGameProvider),
              SizedBox(height: 30),
              _themeSection(context, configurationGameProvider),
              SizedBox(height: 20),
              _recommendationText(),
              SizedBox(height: 30),
              OptionButton(
                icon: Icons.play_arrow,
                text: "COMENZAR",
                colorIcon: Colors.white,
                colorBackground: purple,
                onTap: () => _onStartPressed(context, configurationGameProvider),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Column _playersSection(BuildContext context, ConfigurationGameProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JUGADORES",
                  style: TextStyle(
                    color: purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total de participantes",
                  style: TextStyle(
                    color: subtitleGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              provider.players.toString().padLeft(2, '0'),
              style: TextStyle(
                color: purple,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: purpleDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleButton(
                icon: Icons.remove,
                onTap: () => provider.lessPlayers(),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: purple,
                    inactiveTrackColor: cardBorderColor,
                    thumbColor: purple,
                    overlayColor: purple.withValues(alpha: 0.2),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: provider.players.toDouble(),
                    min: 0,
                    max: provider.maxPlayers.toDouble(),
                    divisions: provider.maxPlayers,
                    onChanged: (_) => provider.players,
                  ),
                ),
              ),
              CircleButton(
                icon: Icons.add,
                onTap: () => provider.addPlayers(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _impostorsAndRounds(ConfigurationGameProvider provider) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IMPOSTORES",
                style: TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "¿Quién miente?",
                style: TextStyle(
                  color: subtitleGray,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: purpleDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      provider.impostors.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                          icon: Icons.remove,
                          onTap: () => provider.lessImpostors(),
                        ),
                        SizedBox(width: 15),
                        CircleButton(
                          icon: Icons.add,
                          onTap: () => provider.addImpostors(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "RONDAS",
                style: TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Duración partida",
                style: TextStyle(
                  color: subtitleGray,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: purpleDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      provider.rounds.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                          icon: Icons.remove,
                          onTap: () => provider.lessRounds(),
                        ),
                        SizedBox(width: 15),
                        CircleButton(
                          icon: Icons.add,
                          onTap: () => provider.addRounds(),
                        ),
                      ],
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

  Column _themeSection(BuildContext context, ConfigurationGameProvider provider) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TEMÁTICA",
          style: TextStyle(
            color: purple,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2
          ),
        ),
        Text(
          "Selecciona el mazo de palabras",
          style: TextStyle(
            color: subtitleGray,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: height * 0.20,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: WordDeck.values.length,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final WordDeck deck = WordDeck.values[index];
              return SizedBox(
                width: 100,
                child: ThemeCard(
                  label: deck.label,
                  icon: deck.icon,
                  imagePath: deck.imagePath,
                  isSelected: provider.selectedDeck == deck,
                  onTap: () => provider.selectDeck(deck),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

    void _onStartPressed(BuildContext context, ConfigurationGameProvider provider) {
      try {
        provider.startGame();
        final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
        gameProvider.initGame();
        Navigator.pushNamed(context, 'players-rol');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red[800],
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

  Row _recommendationText() {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: purple,
          size: 16,
        ),
        SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: subtitleGray,
                fontSize: 12,
              ),
              children: [
                TextSpan(text: "Recomendamos al menos "),
                TextSpan(
                  text: "5 jugadores",
                  style: TextStyle(
                    color: purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " para una experiencia óptima con más de un impostor.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}